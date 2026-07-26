package com.banksystem.api.domain.model;

/** Standing order row. Field names = archival table sod0data columns. */
public record StandingOrder(
        String sodNo,
        String paymentType,
        String paymentAmt,
        String payAccNo,
        String orderType,
        String paymentFrequency) {
}
