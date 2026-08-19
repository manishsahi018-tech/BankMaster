package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;

class SqlTablePrefixerTest {

    private static final String P = "bv_impala_stg_bankmaster_";
    private final SqlTablePrefixer prefixer = new SqlTablePrefixer(P);

    @Test
    void prefixesSimpleFrom() {
        assertThat(prefixer.rewrite("SELECT MAX(BankingDate) FROM stcusttab"))
                .isEqualTo("SELECT MAX(BankingDate) FROM " + P + "stcusttab");
    }

    @Test
    void prefixesJoinAndKeepsAlias() {
        String in = "SELECT c.custNo FROM stcusttab c JOIN stidtab i ON i.custNo = c.custNo";
        assertThat(prefixer.rewrite(in))
                .isEqualTo("SELECT c.custNo FROM " + P + "stcusttab c JOIN " + P + "stidtab i ON i.custNo = c.custNo");
    }

    /**
     * The latest-snapshot predicate (JdbcAccountRepository.standingOrders)
     * names the SAME table twice — outer row and correlated MAX. Both must be
     * prefixed; an unprefixed inner reference would resolve only in an
     * environment with no prefix, so it would pass locally and fail in staging.
     */
    @Test
    void prefixesBothReferencesWhenSubqueryRepeatsTheOuterTable() {
        String in = "SELECT s.sodNo FROM sod0data s WHERE s.BankingDate = "
                + "(SELECT MAX(x.BankingDate) FROM sod0data x WHERE x.accNo = s.accNo)";
        assertThat(prefixer.rewrite(in))
                .isEqualTo("SELECT s.sodNo FROM " + P + "sod0data s WHERE s.BankingDate = "
                        + "(SELECT MAX(x.BankingDate) FROM " + P + "sod0data x WHERE x.accNo = s.accNo)");
    }

    @Test
    void prefixesTableInsideCorrelatedSubqueryAndOuter() {
        String in = "SELECT (SELECT COUNT(*) FROM stsodlog s WHERE s.acc = a.acc) FROM stacclog a";
        assertThat(prefixer.rewrite(in))
                .isEqualTo("SELECT (SELECT COUNT(*) FROM " + P + "stsodlog s WHERE s.acc = a.acc) FROM " + P + "stacclog a");
    }

    @Test
    void isCaseInsensitiveForKeywordsButKeepsTableCase() {
        assertThat(prefixer.rewrite("select * from stcusttab"))
                .isEqualTo("select * from " + P + "stcusttab");
    }

    @Test
    void doesNotTouchColumnsOrWhereLiterals() {
        String in = "SELECT recType FROM stctltab WHERE recType = 'SC'";
        assertThat(prefixer.rewrite(in))
                .isEqualTo("SELECT recType FROM " + P + "stctltab WHERE recType = 'SC'");
    }

    @Test
    void isIdempotentForAlreadyPrefixedNames() {
        String already = "SELECT * FROM " + P + "stcusttab";
        assertThat(prefixer.rewrite(already)).isEqualTo(already);
    }

    @Test
    void leavesLateralKeywordAlone() {
        assertThat(prefixer.rewrite("SELECT * FROM stcusttab c JOIN LATERAL (SELECT 1)"))
                .isEqualTo("SELECT * FROM " + P + "stcusttab c JOIN LATERAL (SELECT 1)");
    }

    @Test
    void blankPrefixIsNoOp() {
        SqlTablePrefixer none = new SqlTablePrefixer("");
        assertThat(none.rewrite("SELECT * FROM stcusttab")).isEqualTo("SELECT * FROM stcusttab");
    }

    @Test
    void nullSqlIsSafe() {
        assertThat(prefixer.rewrite(null)).isNull();
    }
}
