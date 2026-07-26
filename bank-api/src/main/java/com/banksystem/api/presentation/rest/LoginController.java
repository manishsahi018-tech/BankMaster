package com.banksystem.api.presentation.rest;

import com.banksystem.api.application.AuthService;
import com.banksystem.api.domain.model.LoginResult;
import com.banksystem.api.domain.model.SessionInfo;
import com.banksystem.api.infrastructure.auth.JwtAccessTokenIssuer;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Legacy service 00 logon (cblogin.c / staticData.frm cmdOk_Click) — the
 * logon rules live in AuthService (LDAP bind + allow-list); this is only the HTTP
 * adapter. The password arrives AES-encrypted from the SPA. On success it issues
 * a JWT the UI sends as a Bearer token on every subsequent /api call.
 */
@RestController
@RequestMapping("/api/login")
public class LoginController {

    private final AuthService auth;
    private final JwtAccessTokenIssuer tokenIssuer;

    public LoginController(AuthService auth, JwtAccessTokenIssuer tokenIssuer) {
        this.auth = auth;
        this.tokenIssuer = tokenIssuer;
    }

    @PostMapping
    public LoginResult login(@RequestBody LoginRequest request) {
        LoginResult result = auth.login(request.userId(), request.password(), request.homeBranch());
        if ("000".equals(result.status()) && result.session() != null) {
            SessionInfo s = result.session();
            // Both authority halves travel: the legacy builds one string from
            // authorityLevel (20 chars) + authorityLevel2 (60), cbbranch2.c:
            // 5781-5788. Carrying only the first half hides codes like ~86 from
            // every server-side authority check.
            String token = tokenIssuer.issue(
                    s.userId(),
                    s.authorityLevel(),
                    s.authorityLevel2() == null ? "" : s.authorityLevel2(),
                    s.branchCode());
            return result.withToken(token);
        }
        return result;
    }
}
