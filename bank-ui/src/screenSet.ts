// Port of getScreenSetNo (globalFunctions.bas:4810-4910) — the legacy's rule for
// WHICH profile form a customer opens on.
//
// This is a straight transcription, sub-category list for sub-category list,
// because the choice is not derivable from anything else on the row. The port
// previously guessed it from `idType === 'I'`, which the legacy never consults
// here: it sent Saudi nationals whose stored ID type was not 'I' to the Others
// profile and expatriates whose ID type was 'I' to the Saudi one, and had no
// branch at all for the two juristic variants.
//
// frmEnquirySelect.frm:643-666 reads both codes off the selected search row,
// calls this, and refuses to open anything when the answer is '-1'.

/** The legacy's screen-set identifiers. '-1' means "no form for this category". */
export type ScreenSet = '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'E' | '-1'

/** Individual, main category 01. */
const SAUDI = ['01', '02', '59', '69', '73']
const OTHERS = [
  '03', '04', '05', '06', '07', '08', '09',
  '60', '61', '62', '63', '70', '71', '72', '74', '84',
]

/** Juristic, decided on the sub category alone whatever the main category is. */
const JURISTIC_A = ['57', '58', '64', '75', '81', '83', '87'] // plus the 10–38 range
const JURISTIC_B = [
  '41', '42', '43', '44', '53', '54', '55', '67',
  '76', '77', '78', '79', '80', '82', '85', '86', '88',
]
const NON_RESIDENT = ['66'] // plus the 45–52 range
const DIPLOMATS = ['39', '40']

const within = (code: string, low: string, high: string) => code >= low && code <= high

export function getScreenSetNo(mainCategoryCode?: string, subCategoryCode?: string): ScreenSet {
  const main = (mainCategoryCode ?? '').trim()
  const sub = (subCategoryCode ?? '').trim()
  // frmEnquirySelect.frm:642 — the rule is only consulted when both are present.
  if (!main || !sub) return '-1'

  if (main === '01') {
    if (SAUDI.includes(sub)) return '1'
    if (OTHERS.includes(sub)) return '2'
    if (sub === '65') return 'A' // opens the Saudi form too (frmEnquirySelect:814)
    return '-1'
  }

  // Main category 00 is the create-a-customer family: quick, internal and quick
  // pension opening. All three are write screens, so they are out of this
  // build — the caller turns them into a "not in this build" message rather
  // than routing anywhere.
  if (main === '00') {
    if (sub === '00') return '7'
    if (sub === '56') return '8'
    if (sub === '99') return '9'
    return '-1'
  }

  if (within(sub, '10', '38') || JURISTIC_A.includes(sub)) return '3'
  if (within(sub, '45', '52') || NON_RESIDENT.includes(sub)) return '6'
  if (JURISTIC_B.includes(sub)) return '4'
  if (DIPLOMATS.includes(sub)) return '5'
  if (main === 'ES' && sub === 'ES') return 'E'
  return '-1'
}

/** The screen each set opens, as frmEnquirySelect.frm:814-844 dispatches them. */
export type ProfileScreen =
  | 'detail'              // frmIndividualSaudi
  | 'individualOthers'    // frmIndividualOthers
  | 'juristic'            // frmJuristicMain
  | 'juristicDiplomats'   // frmJuristicDiplomats
  | 'juristicNonResident' // frmJuristicNonResident

const SCREEN_FOR: Partial<Record<ScreenSet, ProfileScreen>> = {
  '1': 'detail',
  A: 'detail',
  '2': 'individualOthers',
  '3': 'juristic',
  '4': 'juristic',
  '5': 'juristicDiplomats',
  '6': 'juristicNonResident',
}

/**
 * The profile screen for a customer, or null when the legacy would refuse.
 *
 * Sets 7/8/9 (quick, internal and quick-pension OPENING) and E resolve to null
 * as well: they exist in the legacy, but every one of them is a create screen,
 * which this enquiry-only build does not carry.
 */
export function profileScreenFor(
  mainCategoryCode?: string,
  subCategoryCode?: string,
): ProfileScreen | null {
  return SCREEN_FOR[getScreenSetNo(mainCategoryCode, subCategoryCode)] ?? null
}

/**
 * Which related-party panels a customer's sub category reaches.
 *
 * The legacy has no buttons for these. They are Next Page destinations chosen
 * by sub category inside cmdNextPage_Click / cmdNext_Click, so a customer of
 * the wrong sub category can never see them:
 *
 *   65  frmIndividualSaudi.frm:5920  doHeirSearch      -> frmIndividualHeirs
 *   02  frmIndividualSaudi.frm:5881  doReferenceSearch -> frmIndividualSaudi2
 *   63  frmIndividualOthers.frm:3829 doReferenceSearch -> frmIndividualSaudi2
 *                                                         (the Saudi page 2,
 *                                                          not the Others one)
 *   anything else                                      -> the acct-info page
 *
 * Joint holders are absent on purpose. frmIndividualJoint is in the project
 * (statdata.vbp:69) and doJointSearch exists (search.bas:701), but no form in
 * the source shows the one or calls the other — it is a renamed frmCustomer3
 * (its grid still reads frmCustomer3Caption) whose entry point was cut. Nothing
 * in the legacy reaches it, so nothing here does either.
 *
 * The juristic forms have no related-party page at all: all three
 * cmdNextPage_Click handlers go straight to frmJuristicAccountInfo.
 */
export type PartyPanels = { heirs: boolean; references: boolean }

export function partyPanelsFor(
  mainCategoryCode?: string,
  subCategoryCode?: string,
): PartyPanels {
  const screen = profileScreenFor(mainCategoryCode, subCategoryCode)
  const individual = screen === 'detail' || screen === 'individualOthers'
  const sub = (subCategoryCode ?? '').trim()
  return {
    heirs: individual && sub === '65',
    references: individual && (sub === '02' || sub === '63'),
  }
}
