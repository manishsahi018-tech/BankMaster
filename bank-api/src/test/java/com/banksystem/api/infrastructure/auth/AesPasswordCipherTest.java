package com.banksystem.api.infrastructure.auth;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import java.util.Base64;
import org.junit.jupiter.api.Test;

/** Verifies the AES-GCM password cipher round-trips and rejects tampering. */
class AesPasswordCipherTest {

    private final AesPasswordCipher cipher = new AesPasswordCipher("TEST-PASSPHRASE");

    @Test
    void roundTrips() {
        assertThat(cipher.decrypt(cipher.encrypt("Passw0rd"))).isEqualTo("Passw0rd");
    }

    @Test
    void usesAFreshIvPerEncrypt() {
        assertThat(cipher.encrypt("Passw0rd")).isNotEqualTo(cipher.encrypt("Passw0rd"));
    }

    @Test
    void rejectsATamperedCiphertext() {
        byte[] bytes = Base64.getDecoder().decode(cipher.encrypt("Passw0rd"));
        bytes[bytes.length - 1] ^= 1;
        String tampered = Base64.getEncoder().encodeToString(bytes);

        assertThatThrownBy(() -> cipher.decrypt(tampered)).isInstanceOf(IllegalArgumentException.class);
    }

    @Test
    void rejectsAWrongKey() {
        String other = new AesPasswordCipher("OTHER-PASSPHRASE").encrypt("Passw0rd");

        assertThatThrownBy(() -> cipher.decrypt(other)).isInstanceOf(IllegalArgumentException.class);
    }

    @Test
    void rejectsATooShortCiphertext() {
        String shortValue = Base64.getEncoder().encodeToString(new byte[20]);

        assertThatThrownBy(() -> cipher.decrypt(shortValue)).isInstanceOf(IllegalArgumentException.class);
    }
}
