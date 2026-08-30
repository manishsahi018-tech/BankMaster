import type { HistoricalStatement } from '../api.ts'
import type { Locale } from '../i18n/index.ts'

// What language an ARCHIVED statement is in.
//
// Every other screen in the app is in the operator's language, because every
// other screen IS the app. An archived statement is not: it is a document the
// bank produced years ago, in a language it recorded at the time, and
// BM_STMT_HEADER and PDP_STMT_HEADER both carry that language in LANG_CODE.
// Re-rendering an Arabic statement in English because the operator happens to
// have the app set to English would not be translating the screen — it would be
// reissuing the customer's document in a language it was never sent in.
//
// So the two archived-statement screens render their report from LANG_CODE and
// leave everything AROUND it — the form, the buttons, the counts line — on the
// operator's own locale. The chrome is the app talking to the operator; the
// card is the bank talking to the customer.
//
// The ON-DEMAND statement is deliberately not covered. It is produced now,
// live, for the operator in front of the screen rather than recovered from an
// archive, so it follows the app locale as the rest of the app does.

/**
 * LANG_CODE to a locale: 'A' is Arabic, anything else is English.
 *
 * Matched case-insensitively and after a trim, because the column is a
 * fixed-width archival CHAR and 'a', 'A' and 'A ' are the same value written
 * three ways. Everything else — 'E', a blank, a code nobody documented — falls
 * to English, which is the safe direction: an English rendering of an Arabic
 * statement is legible to the operator, where the reverse may not be.
 */
export function localeOfLangCode(langCode: string): Locale {
  return (langCode ?? '').trim().toLowerCase() === 'a' ? 'ar' : 'en'
}

/**
 * The language of a whole report.
 *
 * ONE language per pack, taken from the first statement, rather than one per
 * card. A pack CAN be mixed — the PDP customer route spans several accounts and
 * a BM range spans months — but the pack is a single document: it prints as one
 * run of sheets under one title, and it exports as one workbook, which can only
 * face one way. Letting cards disagree would put a right-to-left sheet in the
 * middle of a left-to-right document and give the workbook no answer at all.
 *
 * An empty pack answers English; nothing renders in that case anyway.
 */
export function packLocale(statements: HistoricalStatement[]): Locale {
  return statements.length === 0 ? 'en' : localeOfLangCode(statements[0].langCode)
}
