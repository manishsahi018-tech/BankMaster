package com.banksystem.api.presentation.rest;

/** Login request — subset of the legacy reqMsgLogin (cbserver.h, service 00). */
public record LoginRequest(String userId, String password) {
}
