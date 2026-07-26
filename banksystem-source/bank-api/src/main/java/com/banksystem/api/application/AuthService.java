package com.banksystem.api.application;

import com.banksystem.api.domain.auth.Authenticator;
import com.banksystem.api.domain.model.LoginResult;
import com.banksystem.api.domain.model.SessionInfo;
import com.banksystem.api.domain.repository.UserProfileRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.chrono.HijrahDate;
import java.time.format.DateTimeFormatter;

/**
 * Logon use case — legacy service 00 (cblogin.c / staticData.frm
 * cmdOk_Click), minus the password lifecycle (expiry, history, retry
 * lockout) which moves to the LDAP directory. Status codes and remarks
 * match resMsgLogin so the UI messages stay faithful to the VB6 client.
 */
@Service
public class AuthService {

    private static final DateTimeFormatter YMD = DateTimeFormatter.ofPattern("yyyyMMdd");

    private final Authenticator authenticator;
    private final UserProfileRepository profiles;

    public AuthService(Authenticator authenticator, UserProfileRepository profiles) {
        this.authenticator = authenticator;
        this.profiles = profiles;
    }

    public LoginResult login(String rawUserId, String password) {
        String userId = rawUserId == null ? "" : rawUserId.trim().toUpperCase();
        if (userId.isEmpty() || password == null || password.isEmpty()) {
            return LoginResult.failure("102", "Invalid User Id");
        }
        return switch (authenticator.authenticate(userId, password)) {
            case INVALID_CREDENTIALS -> LoginResult.failure("103", "Invalid Password");
            case ACCOUNT_LOCKED -> LoginResult.failure("104", "User Account is locked. Call HO to activate");
            case ACCOUNT_DISABLED -> LoginResult.failure("105", "Your Account has been closed");
            case OK -> profiles.findByUserId(userId)
                    .map(p -> new LoginResult("000", "Login successful", session(p)))
                    .orElseGet(() -> LoginResult.failure("102", "Invalid User Id"));
        };
    }

    private SessionInfo session(UserProfileRepository.UserProfile p) {
        LocalDate today = LocalDate.now();
        String gregorian = today.format(YMD);
        String hijri = HijrahDate.from(today).format(YMD);
        return new SessionInfo(
                p.userId(), p.userName(), p.branchCode(),
                p.authorityLevel(), p.authorityLevel2(),
                p.langPref(), gregorian, hijri, gregorian,
                p.nameSearchAllowed(), "0900");
    }
}
