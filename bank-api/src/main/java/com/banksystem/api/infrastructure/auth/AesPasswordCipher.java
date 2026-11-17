package com.banksystem.api.infrastructure.auth;

import com.banksystem.api.domain.auth.PasswordCipher;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * AES-256-GCM implementation of {@link PasswordCipher}, byte-compatible with the
 * bank-ui SPA's Web Crypto usage (see {@code pocCrypto.ts}):
 * key = SHA-256(passphrase); fresh random 12-byte IV per encrypt, prepended to
 * the ciphertext; output = {@code Base64(IV ‖ ciphertext ‖ 16-byte tag)}.
 * GCM authenticates the ciphertext, so a tampered value fails to decrypt.
 *
 * <p>Copied from the LoanOriginationSystem auth slice (AesPocPasswordCipher). The
 * passphrase ({@code bank.auth.password-key-passphrase}) MUST stay in sync with
 * the frontend {@code PASSWORD_KEY_PASSPHRASE}.
 */
@Component
public class AesPasswordCipher implements PasswordCipher {

    private static final int IV_SIZE = 12;
    private static final int TAG_BITS = 128;
    private static final String TRANSFORMATION = "AES/GCM/NoPadding";

    private final byte[] key;
    private final SecureRandom random = new SecureRandom();

    public AesPasswordCipher(
            @Value("${bank.auth.password-key-passphrase:BANK-CSD-Login-Key-2026}") String passphrase) {
        try {
            this.key = MessageDigest.getInstance("SHA-256")
                    .digest(passphrase.getBytes(StandardCharsets.UTF_8));
        } catch (Exception ex) {
            throw new IllegalStateException("SHA-256 unavailable", ex);
        }
    }

    @Override
    public String encrypt(String plaintext) {
        try {
            byte[] iv = new byte[IV_SIZE];
            random.nextBytes(iv);

            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key, "AES"), new GCMParameterSpec(TAG_BITS, iv));
            byte[] encrypted = cipher.doFinal(
                    (plaintext == null ? "" : plaintext).getBytes(StandardCharsets.UTF_8));

            byte[] output = new byte[IV_SIZE + encrypted.length];
            System.arraycopy(iv, 0, output, 0, IV_SIZE);
            System.arraycopy(encrypted, 0, output, IV_SIZE, encrypted.length);
            return Base64.getEncoder().encodeToString(output);
        } catch (Exception ex) {
            throw new IllegalStateException("Password encryption failed.", ex);
        }
    }

    @Override
    public String decrypt(String cipherTextBase64) {
        byte[] all = Base64.getDecoder().decode(cipherTextBase64);
        if (all.length < IV_SIZE + TAG_BITS / 8) {
            throw new IllegalArgumentException("Ciphertext is too short to contain an IV and tag.");
        }

        byte[] iv = new byte[IV_SIZE];
        System.arraycopy(all, 0, iv, 0, IV_SIZE);
        byte[] encrypted = new byte[all.length - IV_SIZE];
        System.arraycopy(all, IV_SIZE, encrypted, 0, encrypted.length);

        try {
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key, "AES"), new GCMParameterSpec(TAG_BITS, iv));
            return new String(cipher.doFinal(encrypted), StandardCharsets.UTF_8);
        } catch (Exception ex) {
            throw new IllegalArgumentException("Ciphertext could not be decrypted.", ex);
        }
    }
}
