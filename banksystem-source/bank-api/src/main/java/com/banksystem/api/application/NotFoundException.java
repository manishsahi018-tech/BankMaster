package com.banksystem.api.application;

/**
 * Enquiry hit no record. Framework-agnostic — the presentation layer maps
 * it to HTTP 404 (ApiExceptionHandler).
 */
public class NotFoundException extends RuntimeException {

    public NotFoundException(String message) {
        super(message);
    }
}
