package com.banksystem.api.domain.auth;

/**
 * Shared-key password cipher (AES-256-CBC; {@code Base64(IV ‖ ciphertext)}). The
 * bank-ui SPA derives the same key from the same passphrase and encrypts the
 * password before it leaves the browser, so the plaintext never crosses the
 * network; the login use case decrypts it here because an AD bind needs the
 * plaintext.
 *
 * <p>Copied from the LoanOriginationSystem auth slice (PocPasswordCipher). NOTE:
 * the passphrase is shared with the client, so this is transport obfuscation, not
 * a security control — TLS is the real protection. Kept faithful to the source
 * project per the porting brief.
 */
public interface PasswordCipher {

    String encrypt(String plaintext);

    String decrypt(String cipherTextBase64);
}
