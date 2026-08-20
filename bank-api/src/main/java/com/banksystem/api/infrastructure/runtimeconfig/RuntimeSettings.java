package com.banksystem.api.infrastructure.runtimeconfig;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.Collections;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Pattern;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * The two settings an operator may change <b>while the application is
 * running</b> — {@code allowed-users} and {@code banking-date}.
 *
 * <p>They do not live in {@code application.yml} (baked into the jar, read once
 * at startup) but in a plain properties file NEXT TO THE JAR, named by
 * {@code bank.runtime-config.file} and defaulting to
 * {@code bank-runtime.properties} in the working directory the API was started
 * from. Edit that file and save it: the next login sees the new allow-list and
 * the next query binds the new BankingDate. Nothing is restarted, no endpoint
 * is called, no session is dropped.
 *
 * <p><b>How the reload works.</b> Every read checks the file's
 * last-modified/size fingerprint — at most once per
 * {@code bank.runtime-config.poll-millis} (default 1s), so a screen doing forty
 * queries pays for one {@code stat}. A changed fingerprint re-reads and
 * re-parses the file into a new immutable snapshot which then replaces the
 * live one atomically; readers always see one consistent pair of values.
 *
 * <p><b>A bad edit never breaks the running application.</b> The file is parsed
 * into a <i>candidate</i> snapshot first. If it cannot be read, or
 * {@code banking-date} is not a date the views could hold, the candidate is
 * discarded, the error is logged once (not once per second) and the previously
 * loaded values stay in force. The same fingerprint is remembered either way,
 * so the next save — presumably the correction — is what gets picked up.
 *
 * <p>Every accepted change is logged as {@code old -> new}, so the audit trail
 * of who was let in on which snapshot is in the ordinary application log.
 *
 * <p>If the file is absent at startup it is created with the documented
 * template below; if it cannot be created (read-only directory) the API still
 * starts on empty values — an empty allow-list means "allow all" and a blank
 * banking-date falls back to {@code MAX(BankingDate)}, both loudly logged.
 */
@Component
public class RuntimeSettings {

    private static final Logger log = LoggerFactory.getLogger(RuntimeSettings.class);

    static final String KEY_ALLOWED_USERS = "allowed-users";
    static final String KEY_BANKING_DATE = "banking-date";

    /**
     * The two forms a Denodo view can hold BankingDate in: the ISO rendering of
     * a DATE column (2009-07-11) or the YYYYMMDD string (20090711). The value is
     * bound as a string and compared with {@code =}, so anything else is not a
     * subtly wrong date — it is every screen silently returning no rows. That is
     * exactly the mistake this check exists to refuse.
     */
    private static final Pattern BANKING_DATE_FORM = Pattern.compile("\\d{4}-\\d{2}-\\d{2}|\\d{8}");

    /** Fingerprint value meaning "the file is not there / could not be stat'ed". */
    private static final long NO_FILE = -1L;

    /** Written into the file the first time the API starts without one. */
    private static final String TEMPLATE = """
            # BankSystem enquiry app - runtime configuration
            # =============================================
            # EDIT THIS FILE WHILE THE APPLICATION IS RUNNING. Save it and the
            # change takes effect within a second - do not restart the API.
            #
            # Only these two settings live here. Everything else (database URL,
            # credentials, JWT, ports) is startup configuration and still needs a
            # restart to change.

            # Comma-separated user IDs allowed to log in. A user who authenticates
            # against Active Directory but is not listed here is refused with
            # "User is not allowed to access the application."
            #
            # LEAVING THIS BLANK ALLOWS EVERY AUTHENTICATED USER IN. That is a dev
            # convenience only - fill it in before any real deployment.
            #
            #   allowed-users=DEVUSER,OPER1,ENQ1
            allowed-users=

            # The archival BankingDate every query filters on - one restore
            # snapshot for the whole application.
            #
            # Write it EXACTLY as the Denodo views store it: 2009-07-11 if
            # BankingDate is a DATE column, 20090711 if it is a YYYYMMDD string.
            # A wrong format is not an error, it is every screen coming up empty.
            #
            # 2009-07-11 is the restore date the CSD side sits on. Blank means
            # "use MAX(BankingDate) from stcusttab", which is a dev convenience,
            # not a configuration.
            banking-date=2009-07-11
            """;

    /** The file this instance follows; {@code null} for a {@link #fixed} instance. */
    private final Path file;
    private final long pollNanos;

    private volatile Snapshot snapshot = new Snapshot(Set.of(), "");
    /** Fingerprint of the file contents currently loaded (or last rejected). */
    private volatile long loadedStamp = Long.MIN_VALUE;
    private volatile long nextCheckAt;

    // @Autowired is required, not decorative: the fixed() constructor below makes
    // this a two-constructor bean, and Spring will not guess between them.
    @Autowired
    public RuntimeSettings(
            @Value("${bank.runtime-config.file:bank-runtime.properties}") String path,
            @Value("${bank.runtime-config.poll-millis:1000}") long pollMillis) {
        this.file = Path.of(path).toAbsolutePath();
        this.pollNanos = Math.max(0, pollMillis) * 1_000_000L;
        createTemplateIfAbsent();
        // announce=false: the first load is not a "change", and the summary line
        // below already states the values it produced.
        reloadIfChanged(false);
        this.nextCheckAt = System.nanoTime() + pollNanos;
        log.info("[runtime-config] {} — allowed-users={}, banking-date='{}'. "
                + "Edit that file while the app runs; changes apply within {} ms.",
                file, describe(snapshot.allowedUsers()), snapshot.bankingDate(), pollMillis);
        warnIfAllowAll(snapshot);
    }

    private RuntimeSettings(Snapshot fixed) {
        this.file = null;
        this.pollNanos = 0;
        this.snapshot = fixed;
    }

    /**
     * A file-less instance holding the given values for the life of the object —
     * for tests, which must not depend on a file in the working directory.
     */
    public static RuntimeSettings fixed(String allowedUsersCsv, String bankingDate) {
        return new RuntimeSettings(new Snapshot(
                parseAllowedUsers(allowedUsersCsv), bankingDate == null ? "" : bankingDate.trim()));
    }

    /**
     * User IDs permitted to log in, compared case-insensitively. EMPTY means the
     * gate is open — every authenticated user is allowed (and it has been logged).
     */
    public Set<String> allowedUsers() {
        return current().allowedUsers();
    }

    /**
     * The BankingDate archival queries filter on, exactly as the views store it,
     * or "" to let {@code BankingDateProvider} resolve MAX(BankingDate) instead.
     */
    public String bankingDate() {
        return current().bankingDate();
    }

    /** Where these values came from, for log and error messages. */
    public String source() {
        return file == null ? "fixed test values" : file.toString();
    }

    private Snapshot current() {
        if (file != null) {
            long now = System.nanoTime();
            // Subtract-and-compare, not <, so a wrapping nanoTime cannot stall the poll.
            if (now - nextCheckAt >= 0) {
                nextCheckAt = now + pollNanos;
                reloadIfChanged(true);
            }
        }
        return snapshot;
    }

    /**
     * Re-reads the file if its fingerprint moved. Synchronized because two
     * threads can pass the throttle at once; the read itself is a few hundred
     * bytes, so holding the lock across it costs nothing.
     */
    private synchronized void reloadIfChanged(boolean announce) {
        long stamp = fingerprint();
        if (stamp == loadedStamp) {
            return;
        }
        // Remember it either way: a file that fails to parse must be complained
        // about ONCE, not on every request until someone fixes it.
        loadedStamp = stamp;

        if (stamp == NO_FILE) {
            log.error("[runtime-config] {} is gone — keeping the values loaded before it "
                    + "disappeared (allowed-users={}, banking-date='{}'). Restore the file.",
                    file, describe(snapshot.allowedUsers()), snapshot.bankingDate());
            return;
        }

        Snapshot candidate;
        try {
            Properties props = new Properties();
            try (Reader reader = Files.newBufferedReader(file, StandardCharsets.UTF_8)) {
                props.load(reader);
            }
            candidate = parse(props);
        } catch (IOException | RuntimeException e) {
            log.error("[runtime-config] {} was changed but could not be applied ({}). "
                    + "KEEPING the previous values: allowed-users={}, banking-date='{}'. "
                    + "Fix the file and save it again.",
                    file, e.getMessage(), describe(snapshot.allowedUsers()), snapshot.bankingDate());
            return;
        }

        Snapshot previous = snapshot;
        if (candidate.equals(previous)) {
            return;
        }
        snapshot = candidate;
        if (!announce) {
            return;
        }
        if (!previous.bankingDate().equals(candidate.bankingDate())) {
            log.info("[runtime-config] banking-date: '{}' -> '{}'",
                    previous.bankingDate(), candidate.bankingDate());
        }
        if (!previous.allowedUsers().equals(candidate.allowedUsers())) {
            log.info("[runtime-config] allowed-users: {} -> {}",
                    describe(previous.allowedUsers()), describe(candidate.allowedUsers()));
            warnIfAllowAll(candidate);
        }
    }

    private static Snapshot parse(Properties props) {
        String date = props.getProperty(KEY_BANKING_DATE, "").trim();
        if (!date.isEmpty() && !BANKING_DATE_FORM.matcher(date).matches()) {
            throw new IllegalArgumentException(KEY_BANKING_DATE + "='" + date
                    + "' is neither yyyy-MM-dd nor yyyyMMdd");
        }
        return new Snapshot(parseAllowedUsers(props.getProperty(KEY_ALLOWED_USERS, "")), date);
    }

    private static Set<String> parseAllowedUsers(String csv) {
        if (csv == null || csv.isBlank()) {
            return Set.of();
        }
        // CASE_INSENSITIVE_ORDER, not an upcased set: the operator's id is never
        // transformed, so the membership test is what tolerates the case instead.
        Set<String> users = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        Arrays.stream(csv.split(","))
                .map(String::trim)
                .filter(s -> !s.isEmpty())
                .forEach(users::add);
        // Collections.unmodifiableSet, not Set.copyOf: copyOf hashes, which would
        // lose CASE_INSENSITIVE_ORDER and with it the case-tolerant membership test.
        return Collections.unmodifiableSet(users);
    }

    /** last-modified and size folded together — enough to notice any save. */
    private long fingerprint() {
        try {
            if (!Files.isRegularFile(file)) {
                return NO_FILE;
            }
            return Files.getLastModifiedTime(file).toMillis() * 31L + Files.size(file);
        } catch (IOException e) {
            return NO_FILE;
        }
    }

    private void createTemplateIfAbsent() {
        try {
            if (Files.exists(file)) {
                return;
            }
            Path parent = file.getParent();
            if (parent != null) {
                Files.createDirectories(parent);
            }
            Files.writeString(file, TEMPLATE, StandardCharsets.UTF_8);
            log.info("[runtime-config] created {} with the default values.", file);
        } catch (IOException e) {
            log.error("[runtime-config] could not create {} ({}). The application starts with "
                    + "NO allow-list and no fixed banking date; create the file by hand.",
                    file, e.toString());
        }
    }

    private static void warnIfAllowAll(Snapshot snapshot) {
        if (snapshot.allowedUsers().isEmpty()) {
            log.warn("[runtime-config] allowed-users is EMPTY — ALL directory-authenticated "
                    + "users are allowed in. Set the list before any real deployment.");
        }
    }

    private static String describe(Set<String> users) {
        return users.isEmpty() ? "<empty: allow all>" : users.toString();
    }

    /** One consistent pair of values; replaced wholesale, never mutated. */
    private record Snapshot(Set<String> allowedUsers, String bankingDate) {}
}
