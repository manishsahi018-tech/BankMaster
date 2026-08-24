package com.banksystem.api.infrastructure.persistence.jdbc;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.banksystem.api.domain.model.CustomerProfile;
import com.banksystem.api.domain.model.IdDocument;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.core.RowMapper;

/**
 * Denodo can hand back a fixed-width column CHAR-padded — {@code "P "} where the
 * screen expects {@code "P"} — and the mock profile never does, so nothing else
 * in this suite can catch an untrimmed mapper.
 *
 * <p>The damage is not cosmetic. The profile screens choose their document rows
 * by an EXACT idType match (IndividualOthers.tsx {@code byType}, and the Saudi
 * and juristic pages beside it). A padded idType matches nothing, the row falls
 * through to its stcusttab fallback — which carries the bare number and no
 * issued-at, no calendar and no dates — and the screen renders as though the
 * customer had no such document, with no error anywhere. That is exactly the
 * shape of the reported fault: Issued At blank on every row, and the passport
 * row missing its dates and calendar entirely while its number still showed.
 *
 * <p>These drive the REAL mappers over a padded ResultSet. They are reached by
 * reflection because they are private statics — going through
 * {@code repo.profile()} would need the whole stcusttab row stubbed first, and
 * what is under test is the mapper, not the plumbing around it.
 */
class PaddedColumnTrimTest {

    /** Every column comes back padded to a fixed width, as a CHAR view can. */
    private static ResultSet padded() throws Exception {
        ResultSet rs = mock(ResultSet.class);
        when(rs.getString(anyString())).thenAnswer(inv -> switch ((String) inv.getArgument(0)) {
            case "idType" -> "P ";
            case "idNo" -> "K1234567      ";
            case "idIssuedAt" -> "الرياض              ";
            case "idDateType" -> "1 ";
            case "iqamaType" -> "  ";
            case "mobileNo" -> "0501234567  ";
            case "custNo" -> "0415742";
            case "idIssueDateH", "idIssueDateG", "idExpiryDateH", "idExpiryDateG" -> "20081229";
            // Anything else is an all-spaces column: empty in the archive, but
            // only after trimming.
            default -> "   ";
        });
        return rs;
    }

    @SuppressWarnings("unchecked")
    private static <T> RowMapper<T> mapper(String field) throws Exception {
        Field f = JdbcCustomerRepository.class.getDeclaredField(field);
        f.setAccessible(true);
        return (RowMapper<T>) f.get(null);
    }

    @Test
    void idDocumentRowsArriveTrimmedSoTheScreenCanMatchTheirType() throws Exception {
        IdDocument doc = PaddedColumnTrimTest.<IdDocument>mapper("ID_DOCUMENT_MAPPER")
                .mapRow(padded(), 0);

        assertThat(doc.idType())
                .as("the screens compare idType with ===; a padded value drops the whole "
                        + "row to its bare-number fallback and loses its dates and issued-at")
                .isEqualTo("P");
        assertThat(doc.idNo()).isEqualTo("K1234567");
        assertThat(doc.idIssuedAt()).isEqualTo("الرياض");
        assertThat(doc.idDateType())
                .as("selects which of the Hijri/Gregorian columns the screen shows")
                .isEqualTo("1");
        assertThat(doc.iqamaType())
                .as("an all-spaces column is empty, not a value")
                .isEmpty();
    }

    @Test
    void profileColumnsArriveTrimmedSoBlankLookingIsActuallyBlank() throws Exception {
        CustomerProfile p = PaddedColumnTrimTest.<CustomerProfile>mapper("PROFILE_MAPPER")
                .mapRow(padded(), 0);

        assertThat(p.mobileNo())
                .as("a padded value renders as a control full of spaces — it reads as blank "
                        + "on screen but is not empty, and a padded CODE matches no code-set "
                        + "entry")
                .isEqualTo("0501234567");
        assertThat(p.idIssuedAt()).isEqualTo("الرياض");
        assertThat(p.relationshipManager())
                .as("all-spaces columns come through as genuinely empty")
                .isEmpty();
    }
}
