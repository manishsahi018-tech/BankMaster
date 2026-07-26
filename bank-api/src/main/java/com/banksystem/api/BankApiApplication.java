package com.banksystem.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.jdbc.autoconfigure.DataSourceAutoConfiguration;

/**
 * Enquiry API for the CSD revamp. Modern replacement for the legacy cbcmssrv
 * Tuxedo/socket server (docs/CSD C Code): each REST endpoint corresponds to a
 * legacy 2-char service code routed by cbrouter.c.
 *
 * DataSource auto-configuration is excluded while the two real databases
 * (archival-schema DB and the online-source DB) are not yet known; the
 * default repositories serve mock data shaped like the real records.
 */
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class BankApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(BankApiApplication.class, args);
    }
}
