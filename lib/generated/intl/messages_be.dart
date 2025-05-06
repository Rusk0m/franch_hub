// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a be locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'be';

  static String m0(error) => "Памылка праверкі аўтарызацыі: ${error}";

  static String m1(location, workingHours, phone) =>
      "Адрас: ${location}\nГадзіны працы: ${workingHours}\nТэлефон: ${phone}";

  static String m2(branchName) => "Запыт на філіял зацверджаны: ${branchName}";

  static String m3(requesterId) => "Запрошана: ${requesterId}";

  static String m4(status) => "Статус: ${status}";

  static String m5(message) => "Памылка: ${message}";

  static String m6(error) => "Не ўдалося пачаць чат: ${error}";

  static String m7(userName) => "Чат з ${userName}";

  static String m8(city) => "Горад: ${city}";

  static String m9(createdAt) => "Створана: ${createdAt}";

  static String m10(error) => "Памылка дадзеных: ${error}";

  static String m11(branchName) =>
      "Вы ўпэўнены, што хочаце выдаліць \"${branchName}\"?";

  static String m12(description) => "Апісанне: ${description}";

  static String m13(message) => "Памылка: ${message}";

  static String m14(error) => "Не ўдалося дадаць філіял: ${error}";

  static String m15(error) => "Не ўдалося стварыць чакаючы філіял: ${error}";

  static String m16(error) => "Не ўдалося выдаліць філіял: ${error}";

  static String m17(error) => "Не ўдалося адрэдагаваць філіял: ${error}";

  static String m18(error) => "Не ўдалося загрузіць філіялы: ${error}";

  static String m19(error) => "Не ўдалося мадэраваць філіял: ${error}";

  static String m20(error) =>
      "Не ўдалося атрымаць дадзеныя карыстальніка: ${error}";

  static String m21(franchiseName) => "Філіялы франшызы: ${franchiseName}";

  static String m22(franchiseName) => "Франшыза: ${franchiseName}";

  static String m23(ownerId) => "ID уладальніка: ${ownerId}";

  static String m24(status) => "Статус: ${status}";

  static String m25(error) => "Памылка ўваходу праз Google: ${error}";

  static String m26(month, year) => "Паказчыкі ${month}/${year}";

  static String m27(industry) => "Галіна: ${industry}";

  static String m28(location) => "Месцазнаходжанне: ${location}";

  static String m29(error) => "Памылка ўваходу: ${error}";

  static String m30(error) => "Памылка выхаду: ${error}";

  static String m31(branchName, requesterId) =>
      "Новы запыт на філіял: ${branchName} ад ${requesterId}";

  static String m32(phone) => "Тэлефон: ${phone}";

  static String m33(month, year) => "Дэталі справаздачы ${month}/${year}";

  static String m34(error) => "Памылка рэгістрацыі: ${error}";

  static String m35(status) => "Статус: ${status}";

  static String m36(workingHours) => "Гадзіны працы: ${workingHours}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountExistsDifferentCredential": MessageLookupByLibrary.simpleMessage(
      "Акаўнт існуе з іншымі ўліковымі дадзенымі.",
    ),
    "addBranchButton": MessageLookupByLibrary.simpleMessage("Дадаць філіял"),
    "addBranchTitle": MessageLookupByLibrary.simpleMessage("Дадаць філіял"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Ужо ёсць акаўнт? ",
    ),
    "authCheckError": m0,
    "autonomyRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Каэфіцыент аўтаноміі",
    ),
    "backButton": MessageLookupByLibrary.simpleMessage("Назад"),
    "branchAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Філіял паспяхова дададзены",
    ),
    "branchIndicatorsTitle": MessageLookupByLibrary.simpleMessage(
      "Паказчыкі філіяла",
    ),
    "branchInfo": m1,
    "branchModerationSuccess": MessageLookupByLibrary.simpleMessage(
      "Мадэрацыя філіяла паспяховая",
    ),
    "branchNameLabel": MessageLookupByLibrary.simpleMessage("Назва філіяла"),
    "branchNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Філіял, які вы спрабуеце адрэдагаваць, больш не існуе.",
    ),
    "branchReportsTitle": MessageLookupByLibrary.simpleMessage(
      "Справаздачы філіяла",
    ),
    "branchRequestApproved": m2,
    "branchRequestSentMessage": MessageLookupByLibrary.simpleMessage(
      "Запыт адпраўлены на мадэрацыю",
    ),
    "branchRequestedByLabel": m3,
    "branchStatusLabel": m4,
    "branchUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Філіял паспяхова абноўлены",
    ),
    "breakevenPointLabel": MessageLookupByLibrary.simpleMessage(
      "Пункт бясстратнасці",
    ),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Адмяніць"),
    "cashInflowLabel": MessageLookupByLibrary.simpleMessage(
      "Плынь грашовых сродкаў",
    ),
    "cashOutflowLabel": MessageLookupByLibrary.simpleMessage(
      "Адток грашовых сродкаў",
    ),
    "chatError": m5,
    "chatFailedError": m6,
    "chatPageTitle": m7,
    "cityLabel": m8,
    "cityRequiredError": MessageLookupByLibrary.simpleMessage(
      "Горад абавязковы",
    ),
    "closeButton": MessageLookupByLibrary.simpleMessage("Закрыць"),
    "createBranchRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Стварыць запыт на філіял",
    ),
    "createFranchiseTitle": MessageLookupByLibrary.simpleMessage(
      "Стварыць франшызу",
    ),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Стварыць новы акаўнт",
    ),
    "createdAtLabel": m9,
    "currentRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Бягучы каэфіцыент ліквіднасці",
    ),
    "currentUserNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Бягучы карыстальнік не знойдзены",
    ),
    "dataError": m10,
    "debtLoadLabel": MessageLookupByLibrary.simpleMessage("Даўгавая нагрузка"),
    "deleteBranchDialogContent": m11,
    "deleteBranchDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Выдаліць філіял?",
    ),
    "deleteButton": MessageLookupByLibrary.simpleMessage("Выдаліць"),
    "descriptionLabel": m12,
    "descriptionRequiredError": MessageLookupByLibrary.simpleMessage(
      "Апісанне абавязковае",
    ),
    "editBranchTitle": MessageLookupByLibrary.simpleMessage(
      "Рэдагаваць філіял",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Акаўнт з гэтай электроннай поштай ужо існуе.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электронная пошта"),
    "emailNotFound": MessageLookupByLibrary.simpleMessage(
      "Электронная пошта не знойдзена, стварыце акаўнт.",
    ),
    "enterLocationError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце адрас",
    ),
    "enterNameError": MessageLookupByLibrary.simpleMessage("Увядзіце назву"),
    "enterPhoneError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце нумар тэлефона",
    ),
    "enterRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце раялці",
    ),
    "enterWorkingHoursError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце гадзіны працы",
    ),
    "errorMessage": m13,
    "exploreFranchiseTitle": MessageLookupByLibrary.simpleMessage(
      "Даследуйце нашу франшызу",
    ),
    "exploreOpportunities": MessageLookupByLibrary.simpleMessage(
      "Даследуйце лепшыя магчымасці",
    ),
    "failedToAddBranch": m14,
    "failedToCreatePendingBranch": m15,
    "failedToDeleteBranch": m16,
    "failedToEditBranch": m17,
    "failedToLoadBranches": m18,
    "failedToModerateBranch": m19,
    "fetchUserError": m20,
    "findPerfectFranchise": MessageLookupByLibrary.simpleMessage(
      "Знайдзіце сваю ідэальную франшызу",
    ),
    "fixedCostsLabel": MessageLookupByLibrary.simpleMessage(
      "Фіксаваныя выдаткі",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Забылі пароль? "),
    "franchHubTitle": MessageLookupByLibrary.simpleMessage("Franch Hub"),
    "franchiseBranchesTitle": m21,
    "franchiseDataError": MessageLookupByLibrary.simpleMessage(
      "Памылка: Дадзеныя франшызы не прадастаўлены",
    ),
    "franchiseLabel": m22,
    "franchiseModerationSuccess": MessageLookupByLibrary.simpleMessage(
      "Мадэрацыя франшызы паспяховая",
    ),
    "franchiseOverviewTitle": MessageLookupByLibrary.simpleMessage(
      "Агляд франшызы",
    ),
    "franchiseOwnerIdLabel": m23,
    "franchiseOwnerNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Уладальнік франшызы не знойдзены",
    ),
    "franchiseSentForModeration": MessageLookupByLibrary.simpleMessage(
      "Франшыза адпраўлена на мадэрацыю",
    ),
    "franchiseStatusLabel": m24,
    "googleLoginError": m25,
    "indicatorsDetailsTitle": m26,
    "industryLabel": m27,
    "industryRequiredError": MessageLookupByLibrary.simpleMessage(
      "Галіна абавязковая",
    ),
    "initialInvestmentLabel": MessageLookupByLibrary.simpleMessage(
      "Пачатковыя інвестыцыі",
    ),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Атрыманыя ўліковыя дадзеныя няправільныя або скончыліся.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Электронная пошта несапраўдная або няправільна адфарматаваная.",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце сапраўднае лік",
    ),
    "invalidNumberFormatError": MessageLookupByLibrary.simpleMessage(
      "Несапраўдны фармат ліку",
    ),
    "invalidRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце сапраўднае лік",
    ),
    "invalidRoyaltyPercentError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце сапраўдны працэнт (0-100)",
    ),
    "invalidStartupCostError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце сапраўднае лік",
    ),
    "invalidVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Код вэрыфікацыі ўліковых дадзеных несапраўдны.",
    ),
    "invalidVerificationId": MessageLookupByLibrary.simpleMessage(
      "ID вэрыфікацыі ўліковых дадзеных несапраўдны.",
    ),
    "inventoryLabel": MessageLookupByLibrary.simpleMessage("Запасы"),
    "liabilitiesLabel": MessageLookupByLibrary.simpleMessage("Абавязацельствы"),
    "locationLabel": m28,
    "logInLink": MessageLookupByLibrary.simpleMessage("Увайсці!"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Уваход"),
    "loginError": m29,
    "logoutError": m30,
    "moderationTitle": MessageLookupByLibrary.simpleMessage("Мадэрацыя"),
    "myBranchesTitle": MessageLookupByLibrary.simpleMessage("Мае філіялы"),
    "myFranchisesTitle": MessageLookupByLibrary.simpleMessage("Мае франшызы"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Назва"),
    "nameRequiredError": MessageLookupByLibrary.simpleMessage(
      "Назва абавязковая",
    ),
    "netCashFlowLabel": MessageLookupByLibrary.simpleMessage(
      "Чысты грашовы паток",
    ),
    "netProfitLabel": MessageLookupByLibrary.simpleMessage("Чысты прыбытак"),
    "newBranchRequest": m31,
    "newFinancialReportTitle": MessageLookupByLibrary.simpleMessage(
      "Новая фінансавая справаздача",
    ),
    "noBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "Гэтая франшыза пакуль не мае філіялаў.",
    ),
    "noFranchisesAvailable": MessageLookupByLibrary.simpleMessage(
      "Франшызы адсутнічаюць",
    ),
    "noFranchisesYet": MessageLookupByLibrary.simpleMessage(
      "У вас пакуль няма франшыз.",
    ),
    "noIndicatorsData": MessageLookupByLibrary.simpleMessage(
      "Дадзеныя па паказчыках адсутнічаюць",
    ),
    "noMessagesYet": MessageLookupByLibrary.simpleMessage(
      "Паведамленняў пакуль няма",
    ),
    "noPendingBranchRequests": MessageLookupByLibrary.simpleMessage(
      "Няма запытаў на філіялы",
    ),
    "noPendingFranchiseRequests": MessageLookupByLibrary.simpleMessage(
      "Няма запытаў на франшызы",
    ),
    "noReportsAvailable": MessageLookupByLibrary.simpleMessage(
      "Справаздачы адсутнічаюць",
    ),
    "noUserBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У вас пакуль няма філіялаў.",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage(
      "Карыстальнікі не знойдзены",
    ),
    "notRegisteredUser": MessageLookupByLibrary.simpleMessage(
      "Не зарэгістраваны карыстальнік? ",
    ),
    "operationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Аперацыя не дазволена. Звярніцеся ў падтрымку.",
    ),
    "operationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Аперацыя паспяхова завершана",
    ),
    "orContinueWith": MessageLookupByLibrary.simpleMessage("Або працягнуць з"),
    "ownCapitalLabel": MessageLookupByLibrary.simpleMessage("Уласны капітал"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pendingRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Чакаючыя запыты",
    ),
    "phoneLabel": m32,
    "pleaseLogIn": MessageLookupByLibrary.simpleMessage(
      "Калі ласка, увайдзіце",
    ),
    "pleaseLogInToViewUsers": MessageLookupByLibrary.simpleMessage(
      "Калі ласка, увайдзіце, каб праглядзець карыстальнікаў",
    ),
    "quickRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Каэфіцыент хуткай ліквіднасці",
    ),
    "registerNowLink": MessageLookupByLibrary.simpleMessage(
      "Зарэгістравацца зараз!",
    ),
    "registrationButton": MessageLookupByLibrary.simpleMessage("Рэгістрацыя"),
    "reportDetailsTitle": m33,
    "reportSubmittedSuccess": MessageLookupByLibrary.simpleMessage(
      "Справаздача паспяхова адпраўлена",
    ),
    "reportsTab": MessageLookupByLibrary.simpleMessage("Справаздачы"),
    "requiredFieldError": MessageLookupByLibrary.simpleMessage(
      "Абавязковае поле",
    ),
    "respondNowButton": MessageLookupByLibrary.simpleMessage("Адказаць зараз"),
    "returnOnAssetsLabel": MessageLookupByLibrary.simpleMessage(
      "Рэнтабельнасць актываў",
    ),
    "returnOnSalesLabel": MessageLookupByLibrary.simpleMessage(
      "Рэнтабельнасць продажаў",
    ),
    "revenueLabel": MessageLookupByLibrary.simpleMessage("Даход"),
    "roiByMonths": MessageLookupByLibrary.simpleMessage("ROI па месяцах"),
    "roiLabel": MessageLookupByLibrary.simpleMessage(
      "Вяртанне інвестыцый (ROI)",
    ),
    "royaltyPaymentLabel": MessageLookupByLibrary.simpleMessage(
      "Плацёж раялці",
    ),
    "royaltyPercentLabel": MessageLookupByLibrary.simpleMessage("Раялці (%)"),
    "royaltyPercentLabelFranchise": MessageLookupByLibrary.simpleMessage(
      "Працэнт раялці (%)",
    ),
    "royaltyPercentLabelReport": MessageLookupByLibrary.simpleMessage(
      "Раялці (%)",
    ),
    "royaltyPercentRequiredError": MessageLookupByLibrary.simpleMessage(
      "Працэнт раялці абавязковы",
    ),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage("Захаваць змены"),
    "searchHint": MessageLookupByLibrary.simpleMessage("Пошук"),
    "selectUserToChatTitle": MessageLookupByLibrary.simpleMessage(
      "Выберыце карыстальніка для чата",
    ),
    "sendRequestButton": MessageLookupByLibrary.simpleMessage(
      "Адправіць запыт",
    ),
    "signInAccount": MessageLookupByLibrary.simpleMessage(
      "Увайдзіце ў свой акаўнт",
    ),
    "signUpError": m34,
    "startupCostLabel": MessageLookupByLibrary.simpleMessage(
      "Пачатковыя выдаткі (RUB)",
    ),
    "startupCostRequiredError": MessageLookupByLibrary.simpleMessage(
      "Пачатковыя выдаткі абавязковыя",
    ),
    "statusLabel": m35,
    "submitForModerationButton": MessageLookupByLibrary.simpleMessage(
      "Адправіць на мадэрацыю",
    ),
    "submitReportButton": MessageLookupByLibrary.simpleMessage(
      "Адправіць справаздачу",
    ),
    "totalAssetsLabel": MessageLookupByLibrary.simpleMessage("Агульныя актывы"),
    "transactionsTab": MessageLookupByLibrary.simpleMessage("Транзакцыі"),
    "typeMessageHint": MessageLookupByLibrary.simpleMessage(
      "Увядзіце паведамленне...",
    ),
    "unitPriceLabel": MessageLookupByLibrary.simpleMessage("Цана за адзінку"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Адбылася невядомая памылка.",
    ),
    "userCreationFailed": MessageLookupByLibrary.simpleMessage(
      "Не ўдалося стварыць карыстальніка",
    ),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "Гэты карыстальнік заблакаваны. Звярніцеся ў падтрымку.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Карыстальнік не знойдзены",
    ),
    "usernameLabel": MessageLookupByLibrary.simpleMessage("Імя карыстальніка"),
    "variableCostsLabel": MessageLookupByLibrary.simpleMessage(
      "Пераменныя выдаткі",
    ),
    "waitingForData": MessageLookupByLibrary.simpleMessage(
      "Чаканне дадзеных...",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Увядзіце больш надзейны пароль.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("З вяртаннем!"),
    "workingHoursLabel": m36,
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Няправільны пароль, паспрабуйце зноў.",
    ),
    "youAreFranchiseOwnerError": MessageLookupByLibrary.simpleMessage(
      "Вы з\'яўляецеся ўладальнікам франшызы",
    ),
  };
}
