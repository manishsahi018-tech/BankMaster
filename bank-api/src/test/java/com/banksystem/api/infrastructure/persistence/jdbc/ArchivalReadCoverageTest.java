package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

import org.junit.jupiter.api.Test;

/**
 * Every character column of the archival datasource is read through a cleanup
 * accessor, so the extract's quote wrapper cannot reach a screen.
 *
 * <p>An empty character field comes back from the Denodo views as the
 * two-character string {@code ""} (see {@link ArchivalText}), and the symptom
 * is invisible in mock data and in a screenshot of anything but live Denodo:
 * it showed up once as the customer grid's idType and again as the account
 * grid's Dormant Flag, both times as a pair of quote marks in a column. A
 * mapper that hands {@code rs.getString(...)} straight to a domain record
 * brings the bug straight back, and it would be found in production rather
 * than here — so the reads are checked by scanning the sources, the way
 * {@link SqlCommentSafetyTest} checks the SQL comments.
 *
 * <p>The allow-list is the set of accessors that end in an
 * {@code ArchivalText} unwrap, plus the money readers: those columns are
 * numeric views, so a quote wrapper cannot reach them and the unwrap would be
 * a no-op on a decimal.
 */
class ArchivalReadCoverageTest {

    private static final Path JDBC_SOURCES =
            Path.of("src/main/java/com/banksystem/api/infrastructure/persistence/jdbc");

    /**
     * DB #3 is a separate Oracle instance, not this CSV load — an empty
     * VARCHAR2 there is NULL, which its own reads already handle.
     */
    private static final String NOT_ARCHIVAL = "JdbcStatementRepository.java";

    private static final String READ = "rs.getString(";

    private static final List<String> ALLOWED = List.of(
            // the unwrapping accessors, whatever each repository calls its own
            "unquote", "unquoteKeepingWidth", "trim", "trimmed", "scrub", "str", "s",
            // money columns: numeric views, and these parse rather than display
            "plainAmount", "signedAmount", "amount");

    @Test
    void everyColumnReadGoesThroughAnUnwrappingAccessor() throws IOException {
        assertThat(JDBC_SOURCES)
                .as("JDBC source directory — the scan must not silently pass by finding nothing")
                .isDirectory();

        List<String> offences = new ArrayList<>();
        int reads = 0;
        try (Stream<Path> files = Files.list(JDBC_SOURCES)) {
            for (Path file : files.filter(f -> f.getFileName().toString().startsWith("Jdbc")).toList()) {
                if (file.getFileName().toString().equals(NOT_ARCHIVAL)) {
                    continue;
                }
                String source = Files.readString(file, StandardCharsets.UTF_8);
                for (int at = source.indexOf(READ); at >= 0; at = source.indexOf(READ, at + 1)) {
                    reads++;
                    String caller = callerOf(source, at);
                    if (!ALLOWED.contains(caller)) {
                        offences.add("%s:%d — the read is %s"
                                .formatted(file.getFileName(), lineOf(source, at),
                                        caller.isEmpty() ? "bare" : caller + "(rs.getString(...))"));
                    }
                }
            }
        }

        assertThat(reads)
                .as("column reads found by the scan — a pattern that matches nothing proves nothing")
                .isGreaterThan(300);
        assertThat(offences)
                .as("wrap the read in the repository's own accessor (it ends in an "
                        + "ArchivalText unwrap), not in a bare rs.getString")
                .isEmpty();
    }

    /**
     * The method the read is an argument of: the identifier before the open
     * bracket that immediately precedes it. "" when the read is not wrapped at
     * all — handed straight to a constructor argument, a Map.put or a return.
     */
    private static String callerOf(String source, int at) {
        int i = at - 1;
        while (i >= 0 && Character.isWhitespace(source.charAt(i))) {
            i--;
        }
        if (i < 0 || source.charAt(i) != '(') {
            return "";
        }
        int end = i;
        while (i > 0 && (Character.isLetterOrDigit(source.charAt(i - 1)) || source.charAt(i - 1) == '_')) {
            i--;
        }
        return source.substring(i, end);
    }

    private static int lineOf(String source, int at) {
        return (int) source.substring(0, at).chars().filter(c -> c == '\n').count() + 1;
    }
}
