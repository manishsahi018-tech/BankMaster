package com.banksystem.api.presentation.rest;

import com.banksystem.api.domain.model.SessionInfo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Legacy service 00 (reqMsgLogin / resMsgLogin in cbcmssrv, cblogin.c).
 * Mocked until authentication for the revamp is designed; the authority
 * level string drives which facilities the UI enables (~4 cards, ~6/~32
 * accounts, ~81 merchant, ~87 historical statement, ~99 enquiry-only).
 */
@RestController
@RequestMapping("/api/session")
public class SessionController {

    @GetMapping
    public SessionInfo session() {
        return new SessionInfo(
                "DEVUSER", "DEV USER", "0001",
                "~4~6~32~41~81~87~", "",
                "1", "20260708", "14500114", "20260708",
                "1", "0900");
    }
}
