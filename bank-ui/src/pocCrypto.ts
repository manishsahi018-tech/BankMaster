// Password cipher — the SPA half of the shared mechanism implemented by the
// API's AesPasswordCipher. Encrypts the entered password with AES-256-CBC so the
// plaintext never crosses the network; the backend decrypts it to perform the AD
// bind. Copied from the LoanOriginationSystem frontend (pocCrypto.ts).
//
// Must stay byte-compatible with the backend:
//   - key  = SHA-256(PASSWORD_KEY_PASSPHRASE)         (32 bytes)
//   - iv   = 16 random bytes per call
//   - wire = base64( iv ‖ AES-256-CBC(PKCS7) ciphertext )
//
// NOTE: the passphrase is embedded in the client (visible to anyone) — this is
// transport obfuscation, not a security control; TLS is the real protection.
// Keep this passphrase in sync with the API's bank.auth.password-key-passphrase.
const PASSWORD_KEY_PASSPHRASE = 'BANK-CSD-Login-Key-2026'

const enc = new TextEncoder()

function toBase64(bytes: Uint8Array): string {
  let binary = ''
  for (const b of bytes) binary += String.fromCharCode(b)
  return btoa(binary)
}

let keyPromise: Promise<CryptoKey> | null = null

function getKey(): Promise<CryptoKey> {
  if (!keyPromise) {
    keyPromise = crypto.subtle
      .digest('SHA-256', enc.encode(PASSWORD_KEY_PASSPHRASE))
      .then((hash) => crypto.subtle.importKey('raw', hash, { name: 'AES-CBC' }, false, ['encrypt']))
  }
  return keyPromise
}

/** Encrypt a password to base64(IV ‖ ciphertext), matching the API cipher. */
export async function encryptPassword(plaintext: string): Promise<string> {
  const key = await getKey()
  const iv = crypto.getRandomValues(new Uint8Array(16))
  const cipher = new Uint8Array(
    await crypto.subtle.encrypt({ name: 'AES-CBC', iv }, key, enc.encode(plaintext)),
  )
  const out = new Uint8Array(iv.length + cipher.length)
  out.set(iv, 0)
  out.set(cipher, iv.length)
  return toBase64(out)
}
