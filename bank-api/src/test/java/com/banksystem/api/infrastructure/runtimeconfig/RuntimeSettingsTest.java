package com.banksystem.api.infrastructure.runtimeconfig;

import static org.assertj.core.api.Assertions.assertThat;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.FileTime;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;

/**
 * The point of {@link RuntimeSettings} is that an edit lands WITHOUT a restart,
 * and that a bad edit does not take the running application down with it. Both
 * are verified here against a real file.
 *
 * <p>Every write stamps an explicit last-modified time: the fingerprint is
 * timestamp+size, and two writes inside the same millisecond would otherwise be
 * indistinguishable to a test that is much faster than an operator.
 */
class RuntimeSettingsTest {

    @TempDir
    Path dir;

    /** poll-millis 0 = check on every read, so the test never has to sleep. */
    private RuntimeSettings watching(Path file) {
        return new RuntimeSettings(file.toString(), 0);
    }

    private static void write(Path file, String contents, long modifiedMillis) throws IOException {
        Files.writeString(file, contents);
        Files.setLastModifiedTime(file, FileTime.fromMillis(modifiedMillis));
    }

    @Test
    void createsTheFileWithWorkingDefaultsWhenItIsAbsent() {
        Path file = dir.resolve("nested/bank-runtime.properties");
        RuntimeSettings settings = watching(file);

        assertThat(file).exists();
        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
        assertThat(settings.allowedUsers()).isEmpty();
    }

    @Test
    void picksUpBothSettingsWhenTheFileIsSavedAgain() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "allowed-users=OPER1\nbanking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);
        assertThat(settings.allowedUsers()).containsExactly("OPER1");

        write(file, "allowed-users=OPER1,ENQ1\nbanking-date=20121208\n", 2_000);

        assertThat(settings.allowedUsers()).containsExactlyInAnyOrder("OPER1", "ENQ1");
        assertThat(settings.bankingDate()).isEqualTo("20121208");
    }

    @Test
    void membershipIgnoresCaseSoTheOperatorsIdIsNeverTransformed() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "allowed-users= OPER1 , enq1 \n", 1_000);

        // Set.contains, not AssertJ's element comparison: the case-tolerance IS
        // the set's comparator, and that is what the login gate calls.
        java.util.Set<String> allowed = watching(file).allowedUsers();
        assertThat(allowed.contains("oper1")).isTrue();
        assertThat(allowed.contains("Enq1")).isTrue();
        assertThat(allowed.contains("ghost")).isFalse();
    }

    @Test
    void keepsTheLoadedValuesWhenAnEditIsUnusable() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "allowed-users=OPER1\nbanking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);

        // 11/07/2009 is neither form the views can hold — binding it would return
        // no rows on every screen, so the whole edit is refused, not half-applied.
        write(file, "allowed-users=OPER1,ENQ1\nbanking-date=11/07/2009\n", 2_000);

        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
        assertThat(settings.allowedUsers()).containsExactly("OPER1");
    }

    @Test
    void keepsTheLoadedValuesWhenTheFileIsDeleted() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "allowed-users=OPER1\nbanking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);

        Files.delete(file);

        assertThat(settings.allowedUsers()).containsExactly("OPER1");
        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void blankBankingDateIsAllowedAndMeansResolveItFromTheDatabase() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "allowed-users=OPER1\nbanking-date=\n", 1_000);

        assertThat(watching(file).bankingDate()).isEmpty();
    }

    @Test
    void fixedInstanceNeverTouchesTheFilesystem() {
        RuntimeSettings settings = RuntimeSettings.fixed("OPER1", "20090711");

        assertThat(settings.allowedUsers()).containsExactly("OPER1");
        assertThat(settings.bankingDate()).isEqualTo("20090711");
        assertThat(dir).isEmptyDirectory();
    }
}
