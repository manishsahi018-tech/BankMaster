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
        // The retired login allow-list is no longer in the template.
        assertThat(file).content().doesNotContain("allowed-users");
        // The template ships the card split switched OFF: the default is one
        // date for everything, exactly as before the setting existed.
        assertThat(settings.cardBankingDate()).isEmpty();
    }

    @Test
    void picksUpTheDateWhenTheFileIsSavedAgain() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);
        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");

        write(file, "banking-date=20121208\n", 2_000);

        assertThat(settings.bankingDate()).isEqualTo("20121208");
    }

    /** An old file that still carries the retired allow-list loads normally. */
    @Test
    void aLeftoverAllowListLineIsIgnored() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "allowed-users=OPER1\nbanking-date=2009-07-11\n", 1_000);

        assertThat(watching(file).bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void keepsTheLoadedValuesWhenAnEditIsUnusable() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);

        // 11/07/2009 is neither form the views can hold — binding it would return
        // no rows on every screen, so the whole edit is refused, not half-applied.
        write(file, "banking-date=11/07/2009\n", 2_000);

        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void keepsTheLoadedValuesWhenTheFileIsDeleted() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);

        Files.delete(file);

        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void blankBankingDateIsAllowedAndMeansResolveItFromTheDatabase() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=\n", 1_000);

        assertThat(watching(file).bankingDate()).isEmpty();
    }

    @Test
    void blankCardBankingDateMeansTheCardViewsFollowTheGlobalDate() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=2009-07-11\ncard-banking-date=\n", 1_000);

        // Left blank the setting stays inert. RuntimeSettings reports the blank
        // as-is; turning it into the global date is BankingDateProvider's job.
        assertThat(watching(file).cardBankingDate()).isEmpty();
    }

    @Test
    void picksUpTheCardDateSeparatelyFromTheGlobalOne() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=2009-07-11\ncard-banking-date=\n", 1_000);
        RuntimeSettings settings = watching(file);
        assertThat(settings.cardBankingDate()).isEmpty();

        // stcardtab was restored past the CSD snapshot; splitting the card views
        // off must not disturb the date every other view is read at.
        write(file, "banking-date=2009-07-11\ncard-banking-date=2012-12-08\n", 2_000);

        assertThat(settings.cardBankingDate()).isEqualTo("2012-12-08");
        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void aBadCardDateRefusesTheWholeEditJustAsABadGlobalOneDoes() throws IOException {
        Path file = dir.resolve("bank-runtime.properties");
        write(file, "banking-date=2009-07-11\n", 1_000);
        RuntimeSettings settings = watching(file);

        // The global date in this edit is perfectly good; the card date is not.
        // A half-applied snapshot would leave the card screens empty with no
        // error, so the candidate is discarded whole.
        write(file, "banking-date=20121208"
                + "\ncard-banking-date=08/12/2012\n", 2_000);

        assertThat(settings.cardBankingDate()).isEmpty();
        assertThat(settings.bankingDate()).isEqualTo("2009-07-11");
    }

    @Test
    void fixedInstanceNeverTouchesTheFilesystem() {
        RuntimeSettings settings = RuntimeSettings.fixed("20090711");

        assertThat(settings.bankingDate()).isEqualTo("20090711");
        assertThat(settings.cardBankingDate()).isEmpty();
        assertThat(dir).isEmptyDirectory();
    }

    @Test
    void fixedInstanceCanPinTheCardViewsSeparately() {
        RuntimeSettings settings = RuntimeSettings.fixed("20090711", "20121208");

        assertThat(settings.bankingDate()).isEqualTo("20090711");
        assertThat(settings.cardBankingDate()).isEqualTo("20121208");
        assertThat(dir).isEmptyDirectory();
    }
}
