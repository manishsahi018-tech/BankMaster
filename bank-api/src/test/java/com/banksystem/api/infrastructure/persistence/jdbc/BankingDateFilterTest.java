package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Stream;
import org.junit.jupiter.api.Test;

/**
 * Every query against a Denodo view must filter on the banking date.
 *
 * <p>Each archival view carries the ETL's {@code BankingDate} ("Data Restored
 * date"), key part 1 on nearly all of them, and several views hold the SAME
 * record once per restore snapshot — {@code sod0data} was measured with four
 * rows for one standing order. A query naming only the legacy key columns
 * therefore returns one row per snapshot instead of the one row the legacy ISAM
 * file held, so {@code bank.archival-db.banking-date} pins the whole
 * application to a single snapshot and every statement carries
 * {@code BankingDate = :bankingDate}.
 *
 * <p>Why a source scan and not a runtime check: most of these queries sit
 * inside a {@code catch (DataAccessException)} that degrades to an empty list
 * with a warning, so a statement that lost its predicate — or kept it and lost
 * its bind — does not fail loudly. It shows up as a screen that is quietly
 * missing rows, which is exactly what this port has already been bitten by.
 *
 * <p>The unit of the check is the Java text block: if a block names an archival
 * view after FROM/JOIN, that same block must name BankingDate. Where a shared
 * constant supplies the FROM (SEARCH_COLUMNS, LIST_COLUMNS) the constant also
 * carries the {@code WHERE BankingDate = :bankingDate} anchor and callers append
 * {@code AND}, which keeps the rule a simple per-block one.
 *
 * <p>{@link JdbcStatementRepository} is deliberately out of scope: it reads DB
 * #3, a separate Oracle statement archive with no BankingDate column.
 */
class BankingDateFilterTest {

    private static final Path JDBC_SOURCES =
            Path.of("src/main/java/com/banksystem/api/infrastructure/persistence/jdbc");

    /** Reads DB #3 (Oracle), which has no BankingDate. */
    private static final Set<String> NOT_ARCHIVAL = Set.of("JdbcStatementRepository.java");

    /** The archival views this application queries — docs/DENODO-VIEWS.md. */
    private static final List<String> VIEWS = List.of(
            "stcusttab", "stcustlog", "stidtab", "stidlog", "staddrtab", "staddrlog",
            "stheirtab", "stjointtab", "stcreftab", "stowntab",
            "stacclog", "staccblk", "stchqtab", "ststchqlog", "stsodlog",
            "stcardtab", "stcardlog", "stsigntab", "stswiftlog", "stsadadlog",
            "stuser", "stusrbrn",
            "stctltab", "stctltabBD", "stctltabNA", "stctltabSS", "stctltabDC",
            "stctltabMM", "stctltabXC", "stctltabSC",
            "gld0data", "sod0data", "pyd0data", "thd0data", "crd0data",
            "rid0data", "aad0data", "bkd0data", "ccarrblk");

    private static final Pattern FROM_VIEW = Pattern.compile(
            "(?i)\\b(?:from|join)\\s+(" + String.join("|", VIEWS) + ")\\b");

    @Test
    void everyArchivalQueryFiltersOnTheBankingDate() throws IOException {
        assertThat(JDBC_SOURCES)
                .as("JDBC source directory — the scan must not silently pass by finding nothing")
                .isDirectory();

        List<String> offences = new ArrayList<>();
        int checked = 0;

        try (Stream<Path> files = Files.list(JDBC_SOURCES)) {
            for (Path file : files.filter(f -> f.toString().endsWith(".java")).sorted().toList()) {
                if (NOT_ARCHIVAL.contains(file.getFileName().toString())) {
                    continue;
                }
                String source = Files.readString(file, StandardCharsets.UTF_8);
                for (String statement : sqlStatementsIn(source)) {
                    Matcher m = FROM_VIEW.matcher(statement);
                    if (!m.find()) {
                        continue;
                    }
                    checked++;
                    if (!statement.contains("BankingDate")) {
                        offences.add("%s: query on %s has no BankingDate predicate:%n%s"
                                .formatted(file.getFileName(), m.group(1), statement.strip()));
                    }
                }
            }
        }

        assertThat(checked)
                .as("archival statements found by the scan — a regex that matches nothing "
                        + "would make this test vacuous")
                .isGreaterThan(50);
        assertThat(offences)
                .as("every statement reading a Denodo view must carry "
                        + "BankingDate = :bankingDate, bound from BankingDateProvider")
                .isEmpty();
    }

    /**
     * Every SQL statement in the source: the text blocks, plus the one-line
     * string literals DbHealthController uses. Splitting on the text-block
     * delimiter is enough here because no SQL block contains one.
     */
    private static List<String> sqlStatementsIn(String source) {
        List<String> out = new ArrayList<>();
        String[] parts = source.split("\"\"\"", -1);
        // odd indexes are inside a text block
        for (int i = 1; i < parts.length; i += 2) {
            out.add(parts[i]);
        }
        Matcher line = Pattern.compile("\"(SELECT [^\"]*)\"").matcher(source);
        while (line.find()) {
            out.add(line.group(1));
        }
        return out;
    }
}
