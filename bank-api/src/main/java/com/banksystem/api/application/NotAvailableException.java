package com.banksystem.api.application;

/**
 * The facility exists in the app but has no data source in THIS environment —
 * not a bad request and not a missing record, but a deployment gap the operator
 * should be told about plainly.
 *
 * <p>Framework-agnostic; the presentation layer maps it to HTTP 501 Not
 * Implemented, and the client shows the message verbatim rather than turning it
 * into a "quote this reference" support line — there is nothing to investigate,
 * the source simply is not wired up here.
 */
public class NotAvailableException extends RuntimeException {

    public NotAvailableException(String message) {
        super(message);
    }
}
