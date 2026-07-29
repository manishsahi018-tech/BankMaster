package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.BadRequestException;
import com.banksystem.api.application.NotFoundException;
import jakarta.servlet.http.HttpServletRequest;
import java.security.SecureRandom;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ProblemDetail;
import org.springframework.web.ErrorResponseException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/** Maps the framework-agnostic application exceptions to HTTP statuses. */
@RestControllerAdvice
public class ApiExceptionHandler {

    private static final Logger log = LoggerFactory.getLogger(ApiExceptionHandler.class);

    /** Unambiguous in a phone call: no vowels, no 0/O or 1/I. */
    private static final char[] REFERENCE_ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789".toCharArray();
    private static final SecureRandom RANDOM = new SecureRandom();

    @ExceptionHandler(NotFoundException.class)
    public ProblemDetail notFound(NotFoundException ex) {
        return ProblemDetail.forStatusAndDetail(HttpStatus.NOT_FOUND, ex.getMessage());
    }

    @ExceptionHandler(BadRequestException.class)
    public ProblemDetail badRequest(BadRequestException ex) {
        return ProblemDetail.forStatusAndDetail(HttpStatus.BAD_REQUEST, ex.getMessage());
    }

    /**
     * Anything that already carries its own status and body — ResponseStatusException
     * and Spring's binding/validation failures — passes through untouched.
     *
     * <p>Without this the catch-all below would turn every one of them into a 500:
     * a missing request parameter and MerchantController's 403 are both
     * RuntimeExceptions.
     */
    @ExceptionHandler(ErrorResponseException.class)
    public ProblemDetail passThrough(ErrorResponseException ex) {
        return ex.getBody();
    }

    /**
     * Unexpected failures — a dead Denodo view, a driver error, a bug.
     *
     * <p>The cause goes to the SERVER log against a short reference; the client
     * gets that reference and nothing else. Previously the stack-level detail
     * travelled to the browser and was rendered verbatim in a toast, which told a
     * branch operator nothing, leaked internal paths and table names, and left
     * support with no way to tie a complaint to a log line. The reference closes
     * that loop: the operator quotes six characters, the help desk greps for them.
     *
     * <p>Scoped to RuntimeException on purpose. Checked framework exceptions
     * (MissingServletRequestParameterException and friends) are left to Spring's
     * own handling so a missing parameter stays a 400 rather than becoming a 500.
     */
    @ExceptionHandler(RuntimeException.class)
    public ProblemDetail unexpected(RuntimeException ex, HttpServletRequest request) {
        String reference = newReference();
        log.error("[{}] Unhandled {} on {} {}", reference, ex.getClass().getSimpleName(),
                request.getMethod(), request.getRequestURI(), ex);
        ProblemDetail problem = ProblemDetail.forStatusAndDetail(
                HttpStatus.INTERNAL_SERVER_ERROR, "The request could not be completed.");
        problem.setProperty("reference", reference);
        return problem;
    }

    private static String newReference() {
        StringBuilder sb = new StringBuilder(6);
        for (int i = 0; i < 6; i++) {
            sb.append(REFERENCE_ALPHABET[RANDOM.nextInt(REFERENCE_ALPHABET.length)]);
        }
        return sb.toString();
    }
}
