package com.banksystem.api.presentation.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Swagger UI: http://localhost:8080/swagger-ui.html
 * Raw OpenAPI JSON: http://localhost:8080/v3/api-docs
 * The endpoint ↔ legacy service-code map lives in README.md.
 */
@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI bankApiSpec() {
        return new OpenAPI().info(new Info()
                .title("BankMaster Enquiry API")
                .description("CSD revamp enquiry API — modern replacement for the "
                        + "legacy cbcmssrv TCP/IP server. Endpoints mirror the legacy "
                        + "service codes (see bank-api/README.md for the mapping). "
                        + "Login users in mock mode: DEVUSER / Passw0rd etc.")
                .version("0.1.0"));
    }
}
