package com.banksystem.api.application;

/**
 * Enquiry rejected before hitting a data source (legacy client-side
 * validation rules). Mapped to HTTP 400 by the presentation layer.
 */
public class BadRequestException extends RuntimeException {

    public BadRequestException(String message) {
        super(message);
    }
}
