package com.banksystem.api.domain.model;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

/**
 * The archival date columns are typed Date/Timestamp in the Denodo views even
 * though the workbook documents their format as YYYYMMDD, so the driver hands
 * them back as ISO text. These cover the conversion both ways — the read path
 * (isoToBm*) and the predicate path (bmToIso), which must round-trip or the
 * customer-history drill-down stops matching.
 */
class BmFormsTemporalTest {

    @Test
    @DisplayName("Denodo date -> YYYYMMDD")
    void isoDateToBm() {
        assertThat(BmForms.isoToBmDate("2009-07-11")).isEqualTo("20090711");
        assertThat(BmForms.isoToBmDate("2009-07-11 00:00:00")).isEqualTo("20090711");
        assertThat(BmForms.isoToBmDate("1998-01-01 00:00:00.0")).isEqualTo("19980101");
        assertThat(BmForms.isoToBmDate("  2009-07-11 10:15:30  ")).isEqualTo("20090711");
    }

    @Test
    @DisplayName("Denodo timestamp -> YYYYMMDDHH24MISS, always 14 wide")
    void isoTimestampToBm() {
        assertThat(BmForms.isoToBmTimestamp("2009-07-11 10:15:30")).isEqualTo("20090711101530");
        assertThat(BmForms.isoToBmTimestamp("2009-07-11T10:15:30")).isEqualTo("20090711101530");
        // a stamp at midnight must still be 14 wide — the UI's formatTimestamp depends on it
        assertThat(BmForms.isoToBmTimestamp("2006-05-31 00:00:00")).isEqualTo("20060531000000");
        // a bare date pads rather than returning 8
        assertThat(BmForms.isoToBmTimestamp("2006-05-31")).isEqualTo("20060531000000");
    }

    @Test
    @DisplayName("values already in BM form pass through untouched")
    void bmFormsPassThrough() {
        assertThat(BmForms.isoToBmDate("20090711")).isEqualTo("20090711");
        assertThat(BmForms.isoToBmTimestamp("20090711101530")).isEqualTo("20090711101530");
        // the packed 6-char BM date must NOT be mistaken for ISO
        assertThat(BmForms.isoToBmDate("930717")).isEqualTo("930717");
        assertThat(BmForms.isoToBmDate("")).isEmpty();
        assertThat(BmForms.isoToBmDate(null)).isEmpty();
        assertThat(BmForms.isoToBmTimestamp(null)).isEmpty();
    }

    @Test
    @DisplayName("BM -> ISO for binding into a Date/Timestamp predicate")
    void bmToIsoForPredicates() {
        assertThat(BmForms.bmToIso("20090711")).isEqualTo("2009-07-11");
        assertThat(BmForms.bmToIso("20090711101530")).isEqualTo("2009-07-11 10:15:30");
        // anything not a BM date is left alone — including ISO the driver gave us
        assertThat(BmForms.bmToIso("2009-07-11")).isEqualTo("2009-07-11");
        assertThat(BmForms.bmToIso("")).isEmpty();
        assertThat(BmForms.bmToIso(null)).isEmpty();
    }

    @Test
    @DisplayName("round-trip: the history drill-down key survives display formatting")
    void roundTrip() {
        // stcustlog.dateTime comes back ISO, is shown in BM form, then comes back
        // from the UI as the profile-asof key and must rebuild the same predicate.
        String fromDriver = "2009-07-11 10:15:30";
        String shown = BmForms.isoToBmTimestamp(fromDriver);
        assertThat(BmForms.bmToIso(shown)).isEqualTo(fromDriver);
    }

    @Test
    @DisplayName("actualDate folds ISO before the BM century unpacking")
    void actualDateHandlesIso() {
        // the bug this fixes: "1993-07-17 00:00:00" used to yield "191993-0"
        assertThat(BmForms.actualDate("1993-07-17 00:00:00")).isEqualTo("19930717");
        assertThat(BmForms.actualDate("2013-02-12")).isEqualTo("20130212");
        // the legacy packed 6-char forms still decode as before
        assertThat(BmForms.actualDate("930717")).isEqualTo("19930717");
        assertThat(BmForms.actualDate("19930717")).isEqualTo("19930717");
        assertThat(BmForms.actualDate("")).isEmpty();
    }
}
