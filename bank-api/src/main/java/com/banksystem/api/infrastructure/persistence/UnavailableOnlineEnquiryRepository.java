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

    private static final String MESSAGE =
            "This enquiry is served by the online gateway, which is not connected in this "
                    + "environment. The legacy read it over a separate socket to bmrtServer "
                    + "(services 07 and 11), and no archival view holds the same data — "
                    + "live balances and same-day postings only exist on that system.";

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
