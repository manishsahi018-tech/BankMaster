package com.banksystem.api.infrastructure.sqllog;

import jakarta.annotation.PreDestroy;
import java.io.IOException;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.nio.file.StandardOpenOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * The SQL audit log: one file, outside the normal application log, recording
 * every API hit and the queries that ran behind it.
 *
 * <p>Three parties write here and nothing else does:
 * <ul>
 *   <li>{@link SqlLogFilter} opens a request ({@link #requestStarted}) and
 *       closes it ({@link #requestFinished}),</li>
 *   <li>{@link SqlLoggingDataSource} records each statement as it completes
 *       ({@link #logQuery}),</li>
 *   <li>this class formats and serialises the lines.</li>
 * </ul>
 *
 * <p>A request's header line is emitted lazily — on its first query, or at
 * request end if it ran none — so the file reads in completion order. Each
 * entry is written under the monitor as one block, so two operators working at
 * once produce interleaved BLOCKS, never interleaved lines; the {@code [r-NN]}
 * id on every header line ties a query back to its request.
 *
 * <p>OFF unless {@code bank.sql-log.enabled=true}. Disabled, nothing is
 * proxied, no file is created, and the filter short-circuits — the flag is the
 * whole switch. Enabled, bound parameter values are written in the CLEAR, so
 * the file holds real customer and account numbers: it is bank data, and wants
 * the same handling as a database extract.
 */
@Component
public class SqlLogWriter {

    private static final Logger log = LoggerFactory.getLogger(SqlLogWriter.class);
    private static final DateTimeFormatter TS = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
    /** Longest bound value written before it is cut with an ellipsis. */
    private static final int MAX_VALUE_CHARS = 200;

    /** Per-request state; set by the filter, read by the datasource proxy. */
    private static final class Request {
        final String id;
        final String summary;
        final long startNanos = System.nanoTime();
        int queries;
        boolean headerWritten;

        Request(String id, String summary) {
            this.id = id;
            this.summary = summary;
        }
    }

    private static final ThreadLocal<Request> CURRENT = new ThreadLocal<>();

    private final boolean enabled;
    private final Path file;
    private final long maxBytes;
    private final int maxHistory;
    private final AtomicInteger sequence = new AtomicInteger();

    private Writer out;
    private long written;
    /** Set after an I/O failure so a broken path degrades to silence, not a storm. */
    private boolean broken;

    public SqlLogWriter(
            @Value("${bank.sql-log.enabled:false}") boolean enabled,
            @Value("${bank.sql-log.file:logs/bank-api-sql.log}") String file,
            @Value("${bank.sql-log.max-size-mb:50}") int maxSizeMb,
            @Value("${bank.sql-log.max-history:3}") int maxHistory) {
        this.enabled = enabled;
        this.file = Paths.get(file).toAbsolutePath();
        this.maxBytes = Math.max(1, maxSizeMb) * 1024L * 1024L;
        this.maxHistory = Math.max(0, maxHistory);
        if (enabled) {
            log.info("SQL audit log enabled -> {} (bound parameter values are written in the clear)", this.file);
        }
    }

    public boolean isEnabled() {
        return enabled;
    }

    /** Next request id, e.g. {@code r-1f}. Short on purpose: it is read, not parsed. */
    public String nextRequestId() {
        return "r-" + Integer.toHexString(sequence.incrementAndGet());
    }

    /** Opens a request. No line is written yet — see the class note on laziness. */
    public void requestStarted(String id, String summary) {
        if (!enabled) {
            return;
        }
        CURRENT.set(new Request(id, summary));
    }

    /** Closes the request, emitting the header first if no query already did. */
    public void requestFinished(int status) {
        Request r = CURRENT.get();
        CURRENT.remove();
        if (r == null) {
            return;
        }
        long millis = (System.nanoTime() - r.startNanos) / 1_000_000L;
        StringBuilder b = new StringBuilder();
        header(b, r);
        b.append(stamp()).append(" [").append(r.id).append("] <<<< ")
                .append(status).append(" · ")
                .append(r.queries).append(r.queries == 1 ? " query · " : " queries · ")
                .append(millis).append(" ms")
                .append(System.lineSeparator());
        write(b.toString());
    }

    /**
     * Records one completed statement.
     *
     * @param db      which datasource ran it ({@code archival} / {@code statement})
     * @param sql     the SQL as the driver received it — table prefixes already applied
     * @param args    bound values, in parameter order, pre-formatted
     * @param outcome what came back: {@code 3 rows}, {@code updated 1}, {@code FAILED: …}
     * @param millis  elapsed time
     */
    public void logQuery(String db, String sql, List<String> args, String outcome, long millis) {
        Request r = CURRENT.get();
        StringBuilder b = new StringBuilder();
        String id;
        int n;
        if (r == null) {
            // A query outside any API call — startup probe, scheduled work.
            id = "no-request";
            n = 0;
        } else {
            header(b, r);
            id = r.id;
            n = ++r.queries;
        }
        b.append(stamp()).append(" [").append(id).append("] SQL");
        if (n > 0) {
            b.append(" #").append(n);
        }
        b.append(" · ").append(db).append(" · ").append(outcome)
                .append(" · ").append(millis).append(" ms")
                .append(System.lineSeparator());
        Inlined resolved = inline(sql, args);
        for (String line : resolved.sql().strip().split("\\R")) {
            b.append("    ").append(line.stripTrailing()).append(System.lineSeparator());
        }
        // Every ? accounted for: the SQL above IS the query, so an ARGS line would
        // only repeat it. Anything else (a ? left over, a value with no ?) and the
        // raw bindings are printed as well — the inlined text cannot be trusted then.
        if (!args.isEmpty() && resolved.substituted() != args.size()) {
            b.append("    ARGS");
            for (int i = 0; i < args.size(); i++) {
                b.append(" [").append(i + 1).append("]=").append(args.get(i));
            }
            b.append(System.lineSeparator());
        }
        write(b.toString());
    }

    /**
     * Formats a bound value as the SQL literal that replaces its {@code ?} —
     * numbers bare, everything else single-quoted with embedded quotes doubled,
     * null as NULL. Types are preserved from the JDBC bind call, so
     * {@code setString(1, "0123456")} inlines as {@code '0123456'} and keeps the
     * leading zero the query depends on.
     *
     * <p>An over-long value is cut, which makes that one line no longer runnable
     * — the marker says so rather than pretending otherwise.
     */
    static String literal(Object v) {
        if (v == null) {
            return "NULL";
        }
        if (v instanceof Number || v instanceof Boolean) {
            return String.valueOf(v);
        }
        if (v instanceof byte[] bytes) {
            return "<binary:" + bytes.length + " bytes>";
        }
        String s = String.valueOf(v);
        if (s.length() > MAX_VALUE_CHARS) {
            return "'" + s.substring(0, MAX_VALUE_CHARS).replace("'", "''") + "'…(" + s.length() + " chars)";
        }
        return "'" + s.replace("'", "''") + "'";
    }

    /** @param sql the query with its bindings substituted; @param substituted how many ? were replaced */
    record Inlined(String sql, int substituted) {}

    /**
     * Substitutes the bound values for the {@code ?} placeholders, so what is
     * logged can be pasted into Design Studio and run as it stands.
     *
     * <p>Only a placeholder in ordinary SQL position is replaced: the scan tracks
     * string literals, quoted identifiers and both comment forms, so a question
     * mark inside {@code '…?…'} or behind {@code --} is left alone. Getting that
     * wrong would corrupt the very queries this log exists to reproduce.
     */
    static Inlined inline(String sql, List<String> literals) {
        if (literals.isEmpty() || sql.indexOf('?') < 0) {
            return new Inlined(sql, 0);
        }
        StringBuilder out = new StringBuilder(sql.length() + 32);
        int used = 0;
        boolean inString = false;
        boolean inIdentifier = false;
        boolean inLineComment = false;
        boolean inBlockComment = false;

        for (int i = 0; i < sql.length(); i++) {
            char c = sql.charAt(i);
            char next = i + 1 < sql.length() ? sql.charAt(i + 1) : '\0';

            if (inLineComment) {
                out.append(c);
                if (c == '\n') {
                    inLineComment = false;
                }
            } else if (inBlockComment) {
                out.append(c);
                if (c == '*' && next == '/') {
                    out.append(next);
                    i++;
                    inBlockComment = false;
                }
            } else if (inString) {
                out.append(c);
                if (c == '\'') {
                    if (next == '\'') {   // '' is an escaped quote, not the end
                        out.append(next);
                        i++;
                    } else {
                        inString = false;
                    }
                }
            } else if (inIdentifier) {
                out.append(c);
                if (c == '"') {
                    inIdentifier = false;
                }
            } else if (c == '-' && next == '-') {
                out.append(c).append(next);
                i++;
                inLineComment = true;
            } else if (c == '/' && next == '*') {
                out.append(c).append(next);
                i++;
                inBlockComment = true;
            } else if (c == '\'') {
                out.append(c);
                inString = true;
            } else if (c == '"') {
                out.append(c);
                inIdentifier = true;
            } else if (c == '?' && used < literals.size()) {
                out.append(literals.get(used++));
            } else {
                out.append(c);
            }
        }
        return new Inlined(out.toString(), used);
    }

    private void header(StringBuilder b, Request r) {
        if (r.headerWritten) {
            return;
        }
        r.headerWritten = true;
        b.append(stamp()).append(" [").append(r.id).append("] >>>> ").append(r.summary)
                .append(System.lineSeparator());
    }

    private static String stamp() {
        return LocalDateTime.now().format(TS);
    }

    private synchronized void write(String block) {
        // Guarded here as well as at every caller: disabled must mean no file at
        // all, whoever calls in.
        if (!enabled || broken) {
            return;
        }
        try {
            if (out == null) {
                open();
            }
            out.write(block);
            out.flush();     // a log that loses its tail on kill -9 is no use
            written += block.length();
            if (written >= maxBytes) {
                rotate();
            }
        } catch (IOException e) {
            broken = true;
            closeQuietly();
            log.warn("SQL audit log disabled: cannot write {} ({})", file, e.toString());
        }
    }

    private void open() throws IOException {
        Path parent = file.getParent();
        if (parent != null) {
            Files.createDirectories(parent);
        }
        out = Files.newBufferedWriter(file, StandardCharsets.UTF_8,
                StandardOpenOption.CREATE, StandardOpenOption.APPEND);
        written = Files.exists(file) ? Files.size(file) : 0L;
    }

    /** file -> file.1 -> file.2 … up to max-history; 0 history just truncates. */
    private void rotate() throws IOException {
        closeQuietly();
        if (maxHistory == 0) {
            Files.deleteIfExists(file);
        } else {
            Files.deleteIfExists(archive(maxHistory));
            for (int i = maxHistory - 1; i >= 1; i--) {
                Path from = archive(i);
                if (Files.exists(from)) {
                    Files.move(from, archive(i + 1), StandardCopyOption.REPLACE_EXISTING);
                }
            }
            Files.move(file, archive(1), StandardCopyOption.REPLACE_EXISTING);
        }
        written = 0L;
        open();
    }

    private Path archive(int n) {
        return file.resolveSibling(file.getFileName() + "." + n);
    }

    @PreDestroy
    synchronized void closeQuietly() {
        if (out != null) {
            try {
                out.close();
            } catch (IOException ignored) {
                // shutting down; nowhere left to report it
            }
            out = null;
        }
    }
}
