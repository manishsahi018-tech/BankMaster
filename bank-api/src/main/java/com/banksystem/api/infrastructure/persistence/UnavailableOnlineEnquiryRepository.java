package com.banksystem.api.infrastructure.persistence;

import com.banksystem.api.application.NotAvailableException;
import com.banksystem.api.domain.model.OnlineStatementPage;
import com.banksystem.api.domain.repository.OnlineEnquiryRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Repository;

/**
 * The {@code denodo}-profile OnlineEnquiryRepository: there isn't one yet.
 *
 * <p>On-demand Statement and Transaction Inquiry are the two enquiries that
 * live entirely on the online gateway. Nothing in the archival schema stands in
 * for them — they are not slow or partial there, they are absent: the gateway
 * owns live balances and postings end to end, which is exactly why the legacy
 * opened a separate socket for them.
 *
 * <p>The message is deliberately specific about WHICH source is missing. An
 * operator who is told "not available" learns nothing; one who is told the
 * online gateway is not connected knows it is the same gap that blocks the
 * other online screen, and that no amount of retrying will help.
 *
 * <p>Delete this the day DB #2 has a real client, not before.
 */
@Profile("denodo")
@Repository
public class UnavailableOnlineEnquiryRepository implements OnlineEnquiryRepository {

    /**
     * Kept to one line: it is shown on the screen as a banner, and the WHY —
     * bmrtServer is a separate socket whose data no archival view holds — is
     * the class comment above, not something an operator needs re-reading every
     * time they open the screen.
     */
    private static final String MESSAGE =
            "The online gateway (bmrtServer, services 07 and 11) is not connected "
                    + "in this environment.";

    @Override
    public OnlineStatementPage onDemandStatement(
            String accNo, String fromDate, String toDate, String lastTransPtr) {
        throw new NotAvailableException(MESSAGE);
    }

    @Override
    public OnlineStatementPage transactionEnquiry(
            String accNo, String fromDate, String lastTransPtr) {
        throw new NotAvailableException(MESSAGE);
    }
}
