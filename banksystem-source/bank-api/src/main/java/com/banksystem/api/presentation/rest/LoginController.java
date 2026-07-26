package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.AuthService;
import com.banksystem.api.domain.model.LoginResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Legacy service 00 logon (cblogin.c / staticData.frm cmdOk_Click) — the
 * logon rules live in AuthService; this is only the HTTP adapter.
 */
@RestController
@RequestMapping("/api/login")
public class LoginController {

    private final AuthService auth;

    public LoginController(AuthService auth) {
        this.auth = auth;
    }

    @PostMapping
    public LoginResult login(@RequestBody LoginRequest request) {
        return auth.login(request.userId(), request.password());
    }
}
