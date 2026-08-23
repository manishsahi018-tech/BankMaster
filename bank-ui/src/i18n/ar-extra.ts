// Hand-written Arabic, layered over the generated ./legacy-ar.ts.
//
// Two kinds of entry live here:
//
//  1. OVERRIDES of the legacy table, where the extraction picked a rendering
//     that is wrong for this app. Each one says why — the legacy reused one
//     English caption across forms that meant different things (its "Details"
//     button on the returned-mail form was captioned "reason for return"), and
//     the extractor's most-frequent rule cannot know which sense we want.
//
//  2. Strings the legacy never had: the revamp's own chrome (theme picker,
//     pager, locale switcher) and the explanatory copy the VB6 forms had no
//     room for.
//
// Keys are normalised English — lower-cased, whitespace-collapsed, trailing
// punctuation dropped — exactly as normaliseKey() in ./index.ts produces them.
// A key may carry a context prefix ('grid|action') for a word that needs two
// renderings; the caller then asks for t('grid|Action').

const AR_EXTRA: Record<string, string> = {
  // ---- Overrides of the generated table -----------------------------------
  // Legacy: 'سبب الاعاده' — that is frmReturnedMail's "reason for return",
  // not the Details button every grid carries (frmCustUpdateHistory shows
  // 'التفاصيل', which is the sense we want).
  details: 'التفاصيل',
  // Legacy: 'خروج' (Exit) — the VB6 Cancel buttons were captioned "leave".
  // Our Cancel dismisses a dialog without leaving the screen.
  cancel: 'إلغاء',
  // Legacy: 'نعم' (Yes) — fine on a confirm prompt, wrong on the About
  // dialog's dismiss button.
  ok: 'موافق',
  // Legacy: 'مساعدة' (Help) — that was the MDI menu item. This is the dialog.
  about: 'حول البرنامج',
  // Legacy: 'سبب الايقاف' — specifically a stop-cheque reason.
  reason: 'السبب',
  // Legacy: 'اللغه' — the legacy's own spelling; 'اللغة' is the correct one.
  language: 'اللغة',

  // ---- Application shell ---------------------------------------------------
  'static data management': 'إدارة البيانات الثابتة',
  'core banking system': 'النظام المصرفي الأساسي',
  'static data management for cbs': 'إدارة البيانات الثابتة للنظام المصرفي',
  'version {version}': 'الإصدار {version}',
  'this software used to manage atm cards': 'يُستخدم هذا البرنامج لإدارة بطاقات الصراف الآلي.',
  'copyright © arab national bank, riyadh': 'حقوق النشر © البنك العربي الوطني، الرياض',
  'close about dialog': 'إغلاق نافذة حول البرنامج',
  'sign out': 'تسجيل الخروج',

  // Theme picker — no legacy counterpart; the VB6 client had one fixed look.
  theme: 'المظهر',
  'choose theme': 'اختر المظهر',
  mode: 'الوضع',
  light: 'فاتح',
  dark: 'داكن',
  'accent color': 'لون التمييز',
  sapphire: 'ياقوتي',
  emerald: 'زمردي',
  violet: 'بنفسجي',
  rose: 'وردي',
  amber: 'كهرماني',
  teal: 'فيروزي',

  // Locale switcher — the revamp's frmChangeScreenLang.
  'choose language': 'اختر اللغة',
  'change the screen language': 'تغيير لغة الشاشة',

  // ---- Logon window --------------------------------------------------------
  login: 'دخول',
  'logon window': 'شاشة الدخول',
  'logging on': 'جاري الدخول…',
  'ver {version} — enquiry': 'إصدار {version} — استعلام',
  'please enter user id and password': 'الرجاء إدخال هوية المستخدم وكلمة السر',
  'you are not authorised to use this application': 'غير مصرح لك باستخدام هذا التطبيق',

  // ---- Shared grid / detail chrome ----------------------------------------
  'no records found': 'لا توجد سجلات.',
  'showing {from}–{to} of {total}': 'عرض {from}–{to} من {total}',
  'page {page} of {pages}': 'صفحة {page} من {pages}',
  'not available at your authority level': 'غير متاح لمستوى صلاحيتك',
  select: 'اختر…',
  dismiss: 'إغلاق',

  // ---- Customer search (frmCustomerSearch) --------------------------------
  'customer lookup': 'البحث عن العميل',
  'search by one identifier — entering an identifier clears the other criteria, as in the legacy system':
    'ابحث بمعرّف واحد — إدخال معرّف يمسح بقية المعايير، كما في النظام السابق.',
  'look up a customer and maintain their static profile information':
    'ابحث عن عميل واعرض بياناته الثابتة.',
  'contact details': 'بيانات الاتصال',
  'customer names': 'أسماء العميل',
  classification: 'التصنيف',
  'categorisation used for reporting and branch assignment':
    'التصنيف المستخدم في التقارير وتحديد الفرع.',
  reset: 'مسح',
  'enquiries & services': 'الاستفسارات والخدمات',
  'historical statement — deleted a/c': 'كشف حساب قديم — حساب محذوف',
  'historical statement for deleted accounts': 'كشف حساب قديم للحسابات المحذوفة',
  'name search': 'البحث بالاسم',
  'free-text customer name search': 'بحث حر باسم العميل',
  'sadad transactions': 'حركات سداد',
  'payments the branch has made through sadad': 'المدفوعات التي نفذها الفرع عبر سداد',
  'pension enquiry — prefills from id / account number':
    'استفسار التقاعد — يُعبأ من رقم الهوية أو رقم الحساب',
  'returned mail handling': 'معالجة البريد المسترجع',
  'customer opened through phone': 'عملاء فُتحوا عبر الهاتف',
  'status of customers opened through phone': 'حالة العملاء الذين فُتحت حساباتهم عبر الهاتف',
  'needs a customer number or account number': 'يتطلب رقم عميل أو رقم حساب',
  'opens the account grid': 'يفتح قائمة الحسابات',
  'opens the card grid': 'يفتح قائمة البطاقات',
  'enter a customer no, account no or card number first':
    'أدخل رقم العميل أو رقم الحساب أو رقم البطاقة أولاً',
  'merchant statement facilities': 'خدمات كشف حساب البائع',
  'requires merchant statement authority (~81)': 'يتطلب صلاحية كشف حساب البائع (‎~81‎)',

  // Search-field placeholders. Most need no entry of their own — a
  // placeholder reading "Account number" normalises to the same key as the
  // "Account No" label above it and takes the same Arabic.
  'e.g. {example}': 'مثال: {example}',
  'national id / passport': 'رقم الهوية / جواز السفر',
  'home phone': 'هاتف المنزل',
  ext: 'تحويلة',
  'for corporate customers': 'للعملاء من الشركات',
  'select main category': 'اختر التصنيف الرئيسي',
  'select sub category': 'اختر التصنيف الفرعي',
  'select branch': 'اختر الفرع',

  // Search validation — errInvalidSearchCriteria and friends had no Arabic in
  // the tables we extracted, so they are translated here.
  'main category should be selected first before selecting sub category':
    'يجب اختيار التصنيف الرئيسي قبل اختيار التصنيف الفرعي',
  'invalid search criteria..please review': 'معايير بحث غير صالحة.. الرجاء المراجعة',
  'please enter at least one search criterion before searching':
    'الرجاء إدخال معيار بحث واحد على الأقل',
  'utility bill enquiry needs a customer number or account number':
    'استفسار فواتير الخدمات يتطلب رقم عميل أو رقم حساب.',
  'live bill status comes from the sadad network, which this archival enquiry has no connection to. use sadad transactions for payments the branch has already made':
    'حالة الفاتورة الحالية تأتي من شبكة سداد، وهذه الشاشة الأرشيفية غير متصلة بها. استخدم "حركات سداد" للمدفوعات التي نفذها الفرع بالفعل.',

  // ---- Account grid (frmAccount) ------------------------------------------
  'no accounts found for this customer': 'لا توجد حسابات لهذا العميل.',
  'empty row selected — please select an account': 'لم يتم اختيار سجل — الرجاء اختيار حساب.',
  'not authorized to access the account details of enquiry restricted branch':
    'غير مصرح لك بالاطلاع على تفاصيل حسابات فرع مقيّد الاستفسار',
  'transaction inquiry': 'استفسار عن حركة',
  'transaction type enquiry': 'استفسار حركة',

  // ---- Sweep of the remaining screens ------------------------------------
  // None of these had a counterpart in the legacy caption tables: they are
  // either headings the VB6 form had no room for, or explanatory copy this
  // build wrote itself.

  // Search results (frmEnquirySelect)
  'select the match to continue': 'اختر السجل المطابق للمتابعة.',

  // Customer profile — frmIndividualSaudi / frmIndividualOthers / frmJuristicMain
  'customer profile': 'ملف العميل',
  'individual — saudi national': 'فرد — سعودي',
  'page 1 of 2 — identity, personal and contact information':
    'صفحة 1 من 2 — الهوية والبيانات الشخصية وبيانات الاتصال.',
  'page 2 of 2 — employment, fees, account facilities and signature':
    'صفحة 2 من 2 — العمل والرسوم وخدمات الحساب والتوقيع.',
  registration: 'التسجيل',
  'personal details': 'البيانات الشخصية',
  'address & contact': 'العنوان وبيانات الاتصال',
  'address line 1': 'العنوان سطر 1',
  'address line 2': 'العنوان سطر 2',
  'phone (office)': 'هاتف العمل',
  'phone (residence)': 'هاتف المنزل',
  'family regn no': 'رقم دفتر العائلة',
  'alternative br. code': 'رمز الفرع البديل',
  'special status': 'حالة خاصة',
  'blind / illiterate': 'كفيف / أمي',
  'resident / non-resident': 'مقيم / غير مقيم',
  'single / joint a/c': 'حساب مفرد / مشترك',
  'identity documents': 'مستندات الهوية',
  document: 'المستند',
  number: 'الرقم',
  calendar: 'التقويم',
  'issue and expiry dates follow the selected calendar (h = hijri, g = gregorian)':
    'تواريخ الإصدار والانتهاء تتبع التقويم المختار (هـ = هجري، م = ميلادي).',
  'accounts to open': 'الحسابات المطلوب فتحها',
  'package, fees & memos': 'المزايا والرسوم والملاحظات',
  'com. accomodation': 'سكن توفره الشركة',
  'cust. advice flag': 'إشعار العميل',
  'cust. updated for sama': 'تحديث بيانات العميل لساما',
  'exclude from — atm fees': 'استثناء من — رسوم الصراف',
  'exclude from — minimum balance fees': 'استثناء من — رسوم الحد الأدنى للرصيد',

  // Account maintenance (frmAccct)
  'acc. status': 'حالة الحساب',
  'status & statements': 'الحالة وكشوف الحساب',
  'stmt. freq': 'دورية كشف الحساب',
  'interest, limits & references': 'الفوائد والحدود والمراجع',
  'open / update details': 'تفاصيل الفتح والتعديل',
  'amendment audit': 'سجل التعديلات',
  'last update csd': 'تاريخ آخر تعديل في CSD',
  'supervisor approved': 'موافقة المشرف',
  'written by the system, not by this screen': 'يكتبها النظام، لا هذه الشاشة.',
  'audit trail — populated by the system': 'سجل تدقيق — يعبئه النظام.',

  // Cards (frmCardGrid / frmCardDetails / frmCardHistory)
  cards: 'البطاقات',
  'card detail': 'تفاصيل البطاقة',
  'card / pin history': 'تاريخ البطاقة والرقم السري',
  'update history': 'تاريخ التعديلات',
  'card & delivery': 'البطاقة والتسليم',
  'pin status': 'حالة الرقم السري',
  'el.chip': 'الشريحة الإلكترونية',
  '12 or 16 digits, or s1 + 6': '12 أو 16 رقماً، أو S1 + 6',
  "captured when the customer is created and held on the pending record, not on the customer master — so the marks below are the form's defaults, not this customer's card. cards actually issued are on card info":
    'تُلتقط عند إنشاء العميل وتُحفظ في السجل المعلق، لا في ملف العميل الرئيسي — لذا فالعلامات أدناه هي القيم الافتراضية للنموذج، لا بطاقة هذا العميل. البطاقات الصادرة فعلاً تظهر في شاشة معلومات البطاقة.',

  // Statements (frmHistStmt / OnlineStmt / frmMerchantStmt)
  'from date (month / year)': 'من تاريخ (شهر / سنة)',
  'to date (month / year)': 'إلى تاريخ (شهر / سنة)',
  'from year': 'من سنة',
  'to year': 'إلى سنة',
  'generate statement': 'إصدار كشف الحساب',
  'demo data — no acquiring system connected': 'بيانات تجريبية — لا يوجد اتصال بنظام المدفوعات',
  'these statements are generated by {repo}, which stands in for the acquiring/pos system the legacy reaches over its own {ini} host:port. there is no merchant view in denodo and no merchant table in the archival schema, so every figure below is synthetic':
    'تُنشأ هذه الكشوف بواسطة {repo}، الذي ينوب عن نظام المدفوعات ونقاط البيع الذي يتصل به النظام السابق عبر {ini}. لا توجد شاشة للبائع في Denodo ولا جدول للبائع في مخطط الأرشيف، لذا فكل رقم أدناه اصطناعي.',

  // Card detail (frmCardDetails)
  'customer category': 'تصنيف العميل',
  'delivery branch': 'فرع التسليم',
  'new / update': 'جديد / تعديل',
  'sequence no': 'الرقم التسلسلي',

  // Account maintenance
  opened: 'تاريخ الفتح',

  // Search results — Arabic does not pluralise by suffix, so both forms are
  // whole phrases with the count as a placeholder.
  '{count} match': '{count} نتيجة',
  '{count} matches': '{count} نتيجة',
  'the search resulted in several matches — please select one':
    'أسفر البحث عن أكثر من نتيجة — الرجاء اختيار واحدة.',

  // Merchant statement
  'legacy frmmerchantstmt — authority ~81. served by the acquiring/pos system, not by the customer-static-data host':
    'الشاشة السابقة frmMerchantStmt — صلاحية ‎~81‎. يخدمها نظام المدفوعات ونقاط البيع، لا مضيف بيانات العملاء الثابتة.',

  // Customer-number chips. The number is a Latin run, so it is a placeholder
  // rather than text sitting beside the translated word.
  'customer {custno}': 'العميل {custNo}',
  'customer {custno} · joint {jointno}': 'العميل {custNo} · مشترك {jointNo}',
  'customer {custno} · owner {ownerno}': 'العميل {custNo} · مالك {ownerNo}',
  'customer {custno} · heir {partyno}': 'العميل {custNo} · وارث {partyNo}',
  'customer {custno} · reference {partyno}': 'العميل {custNo} · مرجع {partyNo}',
  'read-only enquiry — identity, proxy and address':
    'استعلام للقراءة فقط — الهوية والوكالة والعنوان.',
  'read-only enquiry — identity, required-for and address':
    'استعلام للقراءة فقط — الهوية وسبب المرجعية والعنوان.',

  'a/c {accno}': 'حساب {accNo}',

  // ---- Account sub-screens -------------------------------------------------
  // Titles follow the Arabic captures in docs/Screens where the legacy has
  // one (image10 status history, image11 SAMA, image16 standing orders,
  // image17 stopped cheques, image19 blocked amount); the rest is new copy.
  'account status history': 'التغير في حالة الحساب',
  'sama account status history': 'تفاصيل تعديلات الحساب على حالة ساما',
  'stop cheque information': 'معلومات الشيكات الموقوفة',
  'breakup of blocked amount': 'تفاصيل المبلغ المحجوز',
  'total blocked balance': 'إجمالي الرصيد المحجوز',
  'blocked by': 'حجز بواسطة',
  'blocking type': 'نوع الحجز',
  'standing orders': 'الأوامر الثابتة',
  'standing order type': 'نوع الأمر الثابت',
  'no standing orders for this account': 'لا توجد أوامر ثابتة لهذا الحساب.',
  'cheque book requests': 'دفاتر الشيكات المطلوبة',
  'from cheque number': 'من شيك رقم',
  'reason for changing': 'سبب التغيير',
  'debit account': 'الحساب المدين',
  'pay curr': 'عملة الدفع',
  'product / reference no': 'المنتج / رقم المرجع',
  'signatory no': 'رقم المفوض بالتوقيع',
  'reference no (optional)': 'رقم المرجع (اختياري)',
  'read-only enquiry': 'استعلام للقراءة فقط.',

  // Grid columns and lifecycle captions
  'cust. br. code': 'رمز فرع العميل',
  'main cat': 'التصنيف الرئيسي',
  'sub cat': 'التصنيف الفرعي',
  'approved date & time': 'تاريخ ووقت الموافقة',
  counter: 'العداد',
  type: 'النوع',
  system: 'النظام',
  processed: 'تمت المعالجة',
  'issue to customer': 'صادرة للعميل',
  'produced at dc9000': 'صدرت في DC9000',
  'sent to dc9000': 'أُرسلت إلى DC9000',
  'view detail': 'التفاصيل',
  'transaction detail': 'تفاصيل الحركة',
  'transfer detail': 'تفاصيل الحوالة',

  // Enquiry forms and their validation
  'trans type (rr = reversals)': 'نوع الحركة (RR = عكسية)',
  'fetch transactions': 'جلب الحركات',
  'fetch transfers': 'جلب الحوالات',
  'fetch transactions first': 'اجلب الحركات أولاً',
  'enter a date range and fetch': 'أدخل نطاق التاريخ ثم نفّذ.',
  'empty row selected — please select a standing order':
    'لم يتم اختيار سجل — الرجاء اختيار أمر ثابت.',
  'empty row selected — please select a transaction':
    'لم يتم اختيار سجل — الرجاء اختيار حركة.',
  'empty row selected — please select a transfer':
    'لم يتم اختيار سجل — الرجاء اختيار حوالة.',
  'account number cannot be empty..please enter': 'رقم الحساب لا يمكن أن يكون فارغاً.. الرجاء الإدخال',
  'branch code should be 4 characters..please enter it again':
    'رمز الفرع يجب أن يكون 4 خانات.. الرجاء إعادة الإدخال',
  'from date is blank or incomplete from date': 'تاريخ البداية فارغ أو غير مكتمل',
  'start date is blank or incomplete': 'تاريخ البداية فارغ أو غير مكتمل',
  'from year cannot be blank...please enter it': 'سنة البداية لا يمكن أن تكون فارغة... الرجاء الإدخال',
  'start month': 'شهر البداية',
  'start year': 'سنة البداية',
  '14 digits': '14 رقماً',

  // Statements
  'online statement printing': 'طباعة كشف حساب فوري',
  'send to printer': 'إرسال إلى الطابعة',

  // Card / cheque header chips. The number is a Latin run, so it is a
  // placeholder rather than text sitting beside the translated word.
  'card {cardno}': 'بطاقة {cardNo}',
  'cheque {chequeno}': 'شيك {chequeNo}',
  '{count} completed request': '{count} طلب مكتمل.',
  '{count} completed requests': '{count} طلبات مكتملة.',

  // Transaction Inquiry — which start point is in force.
  'starting from transaction {trans} — the start date is ignored, and no running balance is carried (the legacy zeroes it for a mid-stream start)':
    'يبدأ من الحركة {trans} — يتم تجاهل تاريخ البداية، ولا يُحمل رصيد جارٍ (النظام السابق يصفّره عند البدء من منتصف السجل).',
  'starting from the date above. the gateway supplies its own end date — the legacy sends none, because the branch pc clock could not be trusted':
    'يبدأ من التاريخ أعلاه. تحدد البوابة تاريخ النهاية بنفسها — النظام السابق لا يرسله، لأن ساعة جهاز الفرع لم تكن موثوقة.',

  // Saudi Post (Wasel) address labels. The legacy table already carries
  // "GPS Number" as رقم واصل and "Unit" as وحدة رقم, which is what confirms
  // this field is the Wasel number rather than part of the street line.
  'saudi post': 'واصل',
  'street name': 'اسم الشارع',
  'street / area name': 'اسم شارع/منطقة',

  // Signatory Detail. The four labels that matched legacy captions were
  // renamed to the legacy's wording instead of being given entries here; these
  // are the ones this build introduced.
  'identity document': 'مستند الهوية',
  'action date': 'تاريخ الإجراء',
  'issue date (hijri)': 'تاريخ الاصدار (هجري)',
  'issue date (gregorian)': 'تاريخ الاصدار (ميلادي)',
  'expiry date (hijri)': 'تاريخ الانتهاء (هجري)',
  'expiry date (gregorian)': 'تاريخ الانتهاء (ميلادي)',

  // The Hijri marker is "هـ" — the trailing character is part of the
  // abbreviation, not the decorative tatweel the extractor strips everywhere
  // else, so it has to be restored here.
  h: 'هـ',
  hijri: 'هـ',

  // Standing Order Detail. The field labels were renamed to
  // frmStandingOrderDetail's own captions rather than given entries here;
  // these are the section headings and the two narrative lines the legacy
  // form has no caption for (it shows only -1 of each pair).
  order: 'الأمر الثابت',
  schedule: 'الجدول الزمني',
  amounts: 'المبالغ',
  payee: 'المستفيد',
  'narratives & remarks': 'الشروح والملاحظات',
  audit: 'سجل التدقيق',
  'populated by the system': 'يعبئها النظام.',
  'dr narrative-2': 'شرح مدين - 2',
  'cr narrative-2': 'شرح دائن - 2',
  'pending approval': 'بانتظار الموافقة',
  confirmed: 'مؤكد',

  // ---- API failure messages ------------------------------------------------
  // technicalMessage() builds one sentence around the action phrase each call
  // site passes, so the frame and the phrases are translated separately.
  'could not {action}. please try again — if it keeps happening, quote reference {reference} to the help desk':
    'تعذّر {action}. الرجاء المحاولة مرة أخرى — وإذا تكرر ذلك فاذكر الرقم المرجعي {reference} لمكتب المساعدة.',
  'fetch the sadad transactions': 'جلب حركات سداد',
  'fetch the transactions': 'جلب الحركات',
  'fetch the transfers': 'جلب الحوالات',
  'generate the historical statement': 'إصدار كشف الحساب القديم',
  'generate the merchant statement': 'إصدار كشف حساب البائع',
  'generate the on-demand statement': 'إصدار كشف الحساب الفوري',
  'load the account details page': 'تحميل صفحة تفاصيل الحساب',
  'load the account information page': 'تحميل صفحة معلومات الحساب',
  'load the account status history': 'تحميل سجل حالة الحساب',
  'load the account update history': 'تحميل سجل تعديلات الحساب',
  'load the accounts for this customer': 'تحميل حسابات هذا العميل',
  'load the blocked amount breakup': 'تحميل تفاصيل المبلغ المحجوز',
  'load the card and pin history': 'تحميل تاريخ البطاقة والرقم السري',
  'load the card update history': 'تحميل سجل تعديلات البطاقة',
  'load the cards': 'تحميل البطاقات',
  'load the cheque book requests': 'تحميل طلبات دفاتر الشيكات',
  'load the customer update history': 'تحميل سجل تعديلات العميل',
  'load the essential documents': 'تحميل المستندات المطلوبة',
  'load the essential documents as they were on that date': 'تحميل المستندات المطلوبة كما كانت في ذلك التاريخ',
  'load the heirs and proxies': 'تحميل الورثة والوكلاء',
  'load the joint holders': 'تحميل الشركاء في الحساب',
  'load the owners and management': 'تحميل الملاك والإدارة',
  'load the reference data': 'تحميل البيانات المرجعية',
  'load the references': 'تحميل المراجع',
  'load the sama status history': 'تحميل سجل حالة ساما',
  'load the signatories': 'تحميل المفوضين بالتوقيع',
  'load the standing orders': 'تحميل الأوامر الثابتة',
  'load the stop cheques': 'تحميل الشيكات الموقوفة',
  'open the account as it was on that date': 'فتح الحساب كما كان في ذلك التاريخ',
  'open the account details': 'فتح تفاصيل الحساب',
  'open the card as that update left it': 'فتح البطاقة كما تركها ذلك التعديل',
  'open the customer profile': 'فتح ملف العميل',
  'open the customer profile as it was on that date': 'فتح ملف العميل كما كان في ذلك التاريخ',
  'open this card': 'فتح هذه البطاقة',
  'open this cheque book history': 'فتح تاريخ دفتر الشيكات هذا',
  'open this heir': 'فتح بيانات هذا الوارث',
  'open this joint holder': 'فتح بيانات هذا الشريك',
  'open this owner': 'فتح بيانات هذا المالك',
  'open this reference': 'فتح بيانات هذا المرجع',
  'open this signatory': 'فتح بيانات هذا المفوض بالتوقيع',
  'open this standing order': 'فتح هذا الأمر الثابت',
  'open this stop cheque': 'فتح هذا الشيك الموقوف',
  'open this transaction': 'فتح هذه الحركة',
  'open this transfer': 'فتح هذه الحوالة',
  'restore your session': 'استعادة جلستك',
  'sign you in': 'تسجيل دخولك',

  // Essential Documents (frmDocuments). The two list headings come from the
  // legacy captions; these are the screen's own copy.
  'documents for sub category': 'مستندات التصنيف الفرعي',
  "what this customer's sama sub-category requires, and what was submitted":
    'ما يتطلبه التصنيف الفرعي لساما لهذا العميل، وما تم تقديمه.',
  'no documents configured for this sub-category': 'لا توجد مستندات محددة لهذا التصنيف الفرعي.',
  'no documents recorded as submitted for this customer':
    'لا توجد مستندات مسجلة كمقدَّمة لهذا العميل.',
  "also on record: {documents} — submitted but not in this sub-category's list":
    'مسجل أيضاً: {documents} — مقدَّمة لكنها ليست ضمن قائمة هذا التصنيف الفرعي.',
  'none recorded': 'لا يوجد',
  'marking documents submitted is a create-time action, not part of this enquiry':
    'تحديد المستندات كمقدَّمة إجراء يتم عند الإنشاء، وليس جزءاً من هذا الاستعلام',

  // ---- Full-app sweep -------------------------------------------------------
  // Where the legacy caption table names the same field, its wording is reused
  // verbatim; the rest is this build's own copy. Keyed on our English rather
  // than renaming the labels, so the English screens are unchanged.
  'a/c status': 'حالة الحساب',
  'additional no': 'رقم إضافي',
  'address 1': 'العنوان',
  'address 2': 'العنوان 2',
  'applicant': 'المرسل',
  'archive file': 'ملف الأرشيف',
  'available during supervisor approval only': 'متاح أثناء موافقة المشرف فقط',
  'available in update mode only': 'متاح في وضع التعديل فقط',
  'balance brought forward': 'الرصيد المرحّل',
  'bankmaster transaction details': 'تفاصيل حركة BankMaster',
  'beneficiary': 'المستفيد',
  'cheque book': 'دفتر الشيكات',
  'commercial': 'تجاري',
  'company name': 'اسم الشركة',
  'credit': 'دائن',
  'credit account': 'الحساب الدائن',
  'current account': 'حساب جاري',
  'customer advice': 'إشعار العميل',
  'date of establishment': 'تاريخ التأسيس',
  'debit': 'مدين',
  'delete cheque book request': 'الغاء طلب دفتر شيكات',
  'diplomatic card no': 'رقم البطاقة الدبلوماسية',
  'employment & income': 'العمل والدخل',
  'fetching': 'جاري الجلب…',
  'foreign shareholding %': 'نسبة مساهمة الاجانب',
  'freezing grace period (days)': 'فترة التجميد (أيام)',
  'generating': 'جاري الإصدار…',
  'govt. shareholding %': 'نسبة مساهمة الدولة',
  'heirs / proxy': 'الورثة والوكلاء',
  'heirs / proxy details': 'بيانات الوريث/الوكيل',
  'hide statement': 'إخفاء كشف الحساب',
  'home address 2': 'عنوان البلد الأم 2',
  'home country': 'البلد الأم',
  'home country address': 'عنوان البلد الأم',
  'individual — other nationality': 'فرد — جنسية أخرى',
  'internet facility': 'خدمة الإنترنت',
  'issue and expiry dates follow the selected calendar (h = hijri, g = gregorian). only the c.r. carries an issuing place': 'تواريخ الإصدار والانتهاء تتبع التقويم المختار (هـ = هجري، م = ميلادي). السجل التجاري وحده يحمل مكان الإصدار.',
  'issue and expiry follow the selected calendar (h = hijri, g = gregorian)': 'تاريخا الإصدار والانتهاء يتبعان التقويم المختار (هـ = هجري، م = ميلادي).',
  'issued upon your request. not a substitute for periodic statement': 'صدر بناءً على طلبكم. لا يغني عن كشف الحساب الدوري',
  'itemised below': 'مفصّل أدناه',
  'joined': 'تاريخ الانضمام',
  'joined on': 'تاريخ الانضمام',
  'joint account holders': 'الشركاء في الحساب',
  'joint cust no': 'رقم عميل مشترك',
  'joint customer number': 'رقم العميل المشترك',
  'joint holder details': 'بيانات الشريك في الحساب',
  'joint holders': 'الشركاء في الحساب',
  'juristic customer': 'عميل اعتباري',
  'juristic — diplomatic': 'اعتباري — دبلوماسي',
  'juristic — non-resident': 'اعتباري — غير مقيم',
  'listed blocks exceed the account total': 'مجموع الحجوزات المدرجة يتجاوز إجمالي الحساب',
  'local address': 'العنوان المحلي',
  'main category+sub category': 'التصنيف الرئيسي + الفرعي',
  'message': 'الرسالة',
  'narrative': 'الشرح',
  'narratives': 'الشروح',
  'narrows the search only when a utility company id is given': 'يضيّق البحث فقط عند إدخال رمز شركة الخدمة',
  'no cards found': 'لا توجد بطاقات.',
  'no cheque book requests for this account': 'لا توجد طلبات دفاتر شيكات لهذا الحساب.',
  'no heirs or proxies recorded for this customer': 'لا يوجد ورثة أو وكلاء مسجلون لهذا العميل.',
  'no joint holders recorded for this customer': 'لا يوجد شركاء مسجلون لهذا العميل.',
  'no matches found': 'لا توجد نتائج مطابقة.',
  'no owners recorded for this customer': 'لا يوجد ملاك مسجلون لهذا العميل.',
  'no records': 'لا توجد سجلات.',
  'no references recorded for this customer': 'لا يوجد معرفون مسجلون لهذا العميل.',
  'no sama status changes recorded for this account': 'لا توجد تغييرات على حالة ساما لهذا الحساب.',
  'no source connected — this enquiry cannot run': 'لا يوجد مصدر متصل — لا يمكن تنفيذ هذا الاستعلام',
  'no source connected — this statement cannot be produced': 'لا يوجد مصدر متصل — لا يمكن إصدار هذا الكشف',
  'no status changes recorded for this account': 'لا توجد تغييرات على حالة هذا الحساب.',
  'no stopped cheques for this account': 'لا توجد شيكات موقوفة لهذا الحساب.',
  'no update history for this card': 'لا يوجد سجل تعديلات لهذه البطاقة.',
  'no update history found': 'لا يوجد سجل تعديلات.',
  'no update history found for this account': 'لا يوجد سجل تعديلات لهذا الحساب.',
  'non-resident juristic customer': 'العملاء الاعتباريون الغير مقيمون',
  'not every block is itemised below': 'ليست كل الحجوزات مفصّلة أدناه',
  'not requested': 'غير مطلوبة.',
  'number of movements': 'عدد الحركات',
  'office address 1': 'عنوان العمل',
  'office address 2': 'عنوان العمل 2',
  'office phone': 'هاتف العمل',
  'on demand statement': 'كشف حساب فوري',
  'organization': 'المنشأة',
  'other account': 'حساب آخر',
  'owner': 'المالك',
  'owner / management': 'المالك والإدارة',
  'owner / management details': 'تفاصيل المالك/والاداره',
  'owner number': 'رقم المالك',
  'page': 'صفحة',
  'page 1 of 2 — registration, company and contact information': 'صفحة 1 من 2 — التسجيل وبيانات المنشأة والاتصال.',
  'page 1 of 3 — identity, personal and contact information': 'صفحة 1 من 3 — الهوية والبيانات الشخصية وبيانات الاتصال.',
  'page 2 of 2 — read-only enquiry, account facilities and service flags': 'صفحة 2 من 2 — استعلام للقراءة فقط، خدمات الحساب ورموز الخدمة.',
  'page 2 of 3 — employment, ownership, home country and approvals': 'صفحة 2 من 3 — العمل والملكية والبلد الأم والموافقات.',
  'page 3 of 3 — account facilities, signature and card request': 'صفحة 3 من 3 — خدمات الحساب والتوقيع وطلب البطاقة.',
  'parent company': 'اسم الشركة الشقيقة',
  'particulars': 'البيان',
  'parties': 'الأطراف',
  'phone (off)': 'هاتف العمل',
  'phone (res.)': 'هاتف المنزل',
  'pp number': 'رقم جواز السفر',
  "primary int'l card": 'البطاقة الدولية الأساسية',
  'proxy issue date': 'تاريخ إصدار الوكالة',
  'proxy number': 'رقم الوكالة',
  'purpose': 'الغرض',
  'read-only enquiry — identity, personal, address and employment': 'استعلام للقراءة فقط — الهوية والبيانات الشخصية والعنوان والعمل.',
  'read-only enquiry — one row of owner / management details in full': 'استعلام للقراءة فقط — سجل واحد من تفاصيل المالك والإدارة بالكامل.',
  'reference': 'المرجع',
  'reference / legal representative': 'المعرف/الممثل القانوني',
  'reference / legal representative details': 'المعرف/تفاصيل الممثل القانوني',
  'reference required for': 'المعرف الى',
  'references': 'المعرفون',
  'references & approvals': 'المراجع والموافقات',
  'register e-statement': 'تسجيل الكشف الإلكتروني',
  'registration documents': 'مستندات التسجيل',
  'relationship & memos': 'العلاقة والملاحظات',
  'requests': 'الطلبات',
  'required for': 'المعرف الى',
  'residence phone': 'هاتف المنزل',
  'resident juristic customer': 'العميل المقيم الاعتباري',
  'saudi shareholding %': 'نسبة مساهمة السعوديون',
  'saving account': 'حساب توفير',
  "secondary int'l card": 'البطاقة الدولية الإضافية',
  'share %': 'نسبة المساهمة',
  'share holding %': 'نسبة المساهمة',
  'signature & service flags': 'رموز التوقيع والخدمات',
  'statement language': 'لغة كشف الحساب',
  'subs. number': 'رقم المشترك',
  'the list also stops at the legacy cap of 31 rows': 'كما تتوقف القائمة عند حد النظام السابق البالغ 31 سجلاً.',
  'this statement has a header but no transaction lines in the archive': 'يحتوي هذا الكشف على ترويسة دون أي حركات في الأرشيف.',
  'trans. ref. no': 'رقم مرجع الحركة',
  'transaction': 'الحركة',
  'transfer': 'الحوالة',
  'update for sama': 'تحديث البيانات كطلب ساما',
  'value of movements': 'قيمة الحركات',
  'vip': 'عميل مميز',

  // Chrome the shared components ask for.
  'fetching from server': 'جاري الجلب من الخادم…',
  'please wait a moment': 'الرجاء الانتظار لحظة…',
  'previous month': 'الشهر السابق',
  'next month': 'الشهر التالي',
  month: 'الشهر',
  year: 'السنة',
  'history — this is the record as of {asof}, not the live profile':
    'أرشيف — هذا هو السجل كما كان في {asOf}، وليس الملف الحالي.',
}

export default AR_EXTRA
