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
 * SQL comments must be plain ASCII with no apostrophe and no question mark.
 *
 * <p>The Denodo driver does NOT strip dash-dash comments before it counts bind
 * placeholders or scans for string literals, so anything in a comment is live
 * text as far as parameter binding is concerned. This has now broken two
 * queries in two different ways:
 *
 * <ul>
 *   <li>An apostrophe opened a string literal that swallowed the real bind, and
 *       the driver reported "This statement has no parameters" (fixed in
 *       499d435).</li>
 *   <li>A question mark inside the very comment warning about apostrophes was
 *       counted as a placeholder, so Account Detail failed with "The value for
 *       the parameter 2 has not been set" — one bind supplied, two counted.</li>
 * </ul>
 *
 * <p>Non-ASCII is included because it cannot be shown to be safe: if the
 * connection charset renders an em dash as a question mark, that is another
 * phantom placeholder, and the failure is indistinguishable from the real one.
 * Comments cost nothing to keep in ASCII.
 *
 * <p>Reads the sources rather than the compiled classes because these comments
 * live inside text blocks; the compiler keeps them, but they are far easier to
 * locate and report by line number here.
 */
class SqlCommentSafetyTest {

    private static final Path JDBC_SOURCES =
            Path.of("src/main/java/com/banksystem/api/infrastructure/persistence/jdbc");

    @Test
    void sqlCommentsCarryNothingTheDriverCanMistakeForSyntax() throws IOException {
        assertThat(JDBC_SOURCES)
                .as("JDBC source directory — the scan must not silently pass by finding nothing")
                .isDirectory();

        List<String> offences = new ArrayList<>();
        try (Stream<Path> files = Files.list(JDBC_SOURCES)) {
            for (Path file : files.filter(f -> f.toString().endsWith(".java")).toList()) {
                List<String> lines = Files.readAllLines(file, StandardCharsets.UTF_8);
                for (int i = 0; i < lines.size(); i++) {
                    String line = lines.get(i);
                    if (!line.stripLeading().startsWith("--")) {
                        continue; // Java comments are //; a leading -- is SQL
                    }
                    String reason = hazardIn(line);
                    if (reason != null) {
                        offences.add("%s:%d %s — %s"
                                .formatted(file.getFileName(), i + 1, reason, line.trim()));
                    }
                }
            }
        }

        assertThat(offences)
                .as("the Denodo driver reads comment text when binding parameters, so these "
                        + "would break their query at runtime, not be ignored")
                .isEmpty();
    }

    private static String hazardIn(String line) {
        if (line.indexOf('?') >= 0) {
            return "question mark in a SQL comment is counted as a bind placeholder";
        }
        if (line.indexOf('\'') >= 0) {
            return "apostrophe in a SQL comment opens a string literal";
        }
        for (int i = 0; i < line.length(); i++) {
            if (line.charAt(i) > 127) {
                return "non-ASCII '%c' in a SQL comment may reach the driver as a question mark"
                        .formatted(line.charAt(i));
            }
        }
        return null;
    }
}
