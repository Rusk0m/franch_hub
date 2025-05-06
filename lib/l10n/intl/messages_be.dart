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

  static String m2(branchName) => "Заяўка на філіял зацверджана: ${branchName}";

  static String m3(branchName) =>
      "Вы ўпэўнены, што хочаце выдаліць \"${branchName}\"?";

  static String m4(message) => "Памылка: ${message}";

  static String m5(error) => "Не ўдалося дадаць філіял: ${error}";

  static String m6(error) => "Не ўдалося стварыць заяўку на філіял: ${error}";

  static String m7(error) => "Не ўдалося выдаліць філіял: ${error}";

  static String m8(error) => "Не ўдалося адрэдагаваць філіял: ${error}";

  static String m9(error) => "Не ўдалося загрузіць філіялы: ${error}";

  static String m10(error) => "Не ўдалося мадэраваць філіял: ${error}";

  static String m11(error) =>
      "Не ўдалося атрымаць даныя карыстальніка: ${error}";

  static String m12(franchiseName) => "Пункты франшыз: ${franchiseName}";

  static String m13(error) => "Памылка ўваходу праз Google: ${error}";

  static String m14(error) => "Памылка ўваходу: ${error}";

  static String m15(error) => "Памылка выхаду: ${error}";

  static String m16(branchName, requesterId) =>
      "Новая заяўка на філіял: ${branchName} ад ${requesterId}";

  static String m17(error) => "Памылка рэгістрацыі: ${error}";

  static String m18(status) => "Статус: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountExistsDifferentCredential": MessageLookupByLibrary.simpleMessage(
      "Уліковы запіс існуе з іншымі ўліковымі данымі.",
    ),
    "addBranchButton": MessageLookupByLibrary.simpleMessage("Дадаць філіял"),
    "addBranchTitle": MessageLookupByLibrary.simpleMessage("Дадаць філіял"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Ужо ёсць уліковы запіс? ",
    ),
    "authCheckError": m0,
    "backButton": MessageLookupByLibrary.simpleMessage("Назад"),
    "branchAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Філіял паспяхова дададзены",
    ),
    "branchInfo": m1,
    "branchNameLabel": MessageLookupByLibrary.simpleMessage("Назва філіяла"),
    "branchNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Філіял, які вы спрабуеце рэдагаваць, больш не існуе.",
    ),
    "branchRequestApproved": m2,
    "branchRequestSentMessage": MessageLookupByLibrary.simpleMessage(
      "Заяўка адпраўлена на мадэрацыю",
    ),
    "branchUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Філіял паспяхова абноўлены",
    ),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Адмена"),
    "createBranchRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Стварыць заяўку на філіял",
    ),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Стварыць новы ўліковы запіс",
    ),
    "deleteBranchDialogContent": m3,
    "deleteBranchDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Выдаліць філіял?",
    ),
    "deleteButton": MessageLookupByLibrary.simpleMessage("Выдаліць"),
    "editBranchTitle": MessageLookupByLibrary.simpleMessage(
      "Рэдагаваць філіял",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Уліковы запіс з гэтай электроннай поштай ужо існуе.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электронная пошта"),
    "emailNotFound": MessageLookupByLibrary.simpleMessage(
      "Электронная пошта не знойдзена, калі ласка, стварыце ўліковы запіс.",
    ),
    "enterLocationError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце адрас",
    ),
    "enterNameError": MessageLookupByLibrary.simpleMessage("Увядзіце назву"),
    "enterPhoneError": MessageLookupByLibrary.simpleMessage("Увядзіце тэлефон"),
    "enterRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце раялці",
    ),
    "enterWorkingHoursError": MessageLookupByLibrary.simpleMessage(
      "Увядзіце гадзіны працы",
    ),
    "errorMessage": m4,
    "failedToAddBranch": m5,
    "failedToCreatePendingBranch": m6,
    "failedToDeleteBranch": m7,
    "failedToEditBranch": m8,
    "failedToLoadBranches": m9,
    "failedToModerateBranch": m10,
    "fetchUserError": m11,
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Забылі пароль? "),
    "franchiseBranchesTitle": m12,
    "franchiseDataError": MessageLookupByLibrary.simpleMessage(
      "Памылка: даныя франшыз не перададзены",
    ),
    "googleLoginError": m13,
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Атрыманыя ўліковыя даныя некарэктныя або скончыліся.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Электронная пошта некарэктная або няправільна адфарматаваная.",
    ),
    "invalidRoyaltyError": MessageLookupByLibrary.simpleMessage("Увядзіце лік"),
    "invalidVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Код верыфікацыі ўліковых даных некарэктны.",
    ),
    "invalidVerificationId": MessageLookupByLibrary.simpleMessage(
      "Ідэнтыфікатар верыфікацыі ўліковых даных некарэктны.",
    ),
    "locationLabel": MessageLookupByLibrary.simpleMessage("Адрас"),
    "logInLink": MessageLookupByLibrary.simpleMessage("Увайсці!"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Уваход"),
    "loginError": m14,
    "logoutError": m15,
    "myBranchesTitle": MessageLookupByLibrary.simpleMessage("Мае пункты"),
    "newBranchRequest": m16,
    "noBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У гэтай франшызы пакуль няма пунктаў.",
    ),
    "noUserBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У вас пакуль няма пунктаў.",
    ),
    "notRegisteredUser": MessageLookupByLibrary.simpleMessage(
      "Не зарэгістраваны? ",
    ),
    "operationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Аперацыя не дазволена. Калі ласка, звярніцеся ў службу падтрымкі.",
    ),
    "operationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Аперацыя выканана паспяхова",
    ),
    "orContinueWith": MessageLookupByLibrary.simpleMessage("Або працягнуць з"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pendingRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Заяўкі на мадэрацыю",
    ),
    "phoneLabel": MessageLookupByLibrary.simpleMessage("Тэлефон"),
    "registerNowLink": MessageLookupByLibrary.simpleMessage("Зарэгістравацца!"),
    "registrationButton": MessageLookupByLibrary.simpleMessage("Рэгістрацыя"),
    "reportsTab": MessageLookupByLibrary.simpleMessage("Справаздачы"),
    "royaltyPercentLabel": MessageLookupByLibrary.simpleMessage("Раялці (%)"),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage("Захаваць змены"),
    "sendRequestButton": MessageLookupByLibrary.simpleMessage(
      "Адправіць заяўку",
    ),
    "signInAccount": MessageLookupByLibrary.simpleMessage(
      "Увайдзіце ў свой уліковы запіс",
    ),
    "signUpError": m17,
    "statusLabel": m18,
    "transactionsTab": MessageLookupByLibrary.simpleMessage("Транзакцыі"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Адбылася невядомая памылка.",
    ),
    "userCreationFailed": MessageLookupByLibrary.simpleMessage(
      "Не ўдалося стварыць карыстальніка",
    ),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "Гэты карыстальнік заблакаваны. Калі ласка, звярніцеся ў службу падтрымкі.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Карыстальнік не знойдзены",
    ),
    "usernameLabel": MessageLookupByLibrary.simpleMessage("Імя карыстальніка"),
    "waitingForData": MessageLookupByLibrary.simpleMessage("Чаканне даных..."),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Калі ласка, увядзіце больш надзейны пароль.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("З вяртаннем!"),
    "workingHoursLabel": MessageLookupByLibrary.simpleMessage(
      "Гадзіны працы (напр., 9:00-18:00)",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Няправільны пароль, паспрабуйце яшчэ раз.",
    ),
  };
}
