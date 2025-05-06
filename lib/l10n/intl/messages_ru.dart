// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
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
  String get localeName => 'ru';

  static String m0(error) => "Ошибка проверки авторизации: ${error}";

  static String m1(location, workingHours, phone) =>
      "Адрес: ${location}\nЧасы работы: ${workingHours}\nТелефон: ${phone}";

  static String m2(branchName) => "Заявка на филиал одобрена: ${branchName}";

  static String m3(branchName) =>
      "Вы уверены, что хотите удалить \"${branchName}\"?";

  static String m4(message) => "Ошибка: ${message}";

  static String m5(error) => "Не удалось добавить филиал: ${error}";

  static String m6(error) => "Не удалось создать заявку на филиал: ${error}";

  static String m7(error) => "Не удалось удалить филиал: ${error}";

  static String m8(error) => "Не удалось отредактировать филиал: ${error}";

  static String m9(error) => "Не удалось загрузить филиалы: ${error}";

  static String m10(error) => "Не удалось модерировать филиал: ${error}";

  static String m11(error) =>
      "Не удалось получить данные пользователя: ${error}";

  static String m12(franchiseName) => "Точки франшизы: ${franchiseName}";

  static String m13(error) => "Ошибка входа через Google: ${error}";

  static String m14(error) => "Ошибка входа: ${error}";

  static String m15(error) => "Ошибка выхода: ${error}";

  static String m16(branchName, requesterId) =>
      "Новая заявка на филиал: ${branchName} от ${requesterId}";

  static String m17(error) => "Ошибка регистрации: ${error}";

  static String m18(status) => "Статус: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountExistsDifferentCredential": MessageLookupByLibrary.simpleMessage(
      "Аккаунт существует с другими учетными данными.",
    ),
    "addBranchButton": MessageLookupByLibrary.simpleMessage("Добавить филиал"),
    "addBranchTitle": MessageLookupByLibrary.simpleMessage("Добавить филиал"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Уже есть аккаунт? ",
    ),
    "authCheckError": m0,
    "backButton": MessageLookupByLibrary.simpleMessage("Назад"),
    "branchAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Филиал успешно добавлен",
    ),
    "branchInfo": m1,
    "branchNameLabel": MessageLookupByLibrary.simpleMessage("Название филиала"),
    "branchNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Филиал, который вы пытаетесь редактировать, больше не существует.",
    ),
    "branchRequestApproved": m2,
    "branchRequestSentMessage": MessageLookupByLibrary.simpleMessage(
      "Заявка отправлена на модерацию",
    ),
    "branchUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Филиал успешно обновлен",
    ),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Отмена"),
    "createBranchRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Создать заявку на филиал",
    ),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Создать новый аккаунт",
    ),
    "deleteBranchDialogContent": m3,
    "deleteBranchDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Удалить филиал?",
    ),
    "deleteButton": MessageLookupByLibrary.simpleMessage("Удалить"),
    "editBranchTitle": MessageLookupByLibrary.simpleMessage(
      "Редактировать филиал",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Аккаунт с этой электронной почтой уже существует.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "emailNotFound": MessageLookupByLibrary.simpleMessage(
      "Электронная почта не найдена, пожалуйста, создайте аккаунт.",
    ),
    "enterLocationError": MessageLookupByLibrary.simpleMessage("Введите адрес"),
    "enterNameError": MessageLookupByLibrary.simpleMessage("Введите название"),
    "enterPhoneError": MessageLookupByLibrary.simpleMessage("Введите телефон"),
    "enterRoyaltyError": MessageLookupByLibrary.simpleMessage("Введите роялти"),
    "enterWorkingHoursError": MessageLookupByLibrary.simpleMessage(
      "Введите часы работы",
    ),
    "errorMessage": m4,
    "failedToAddBranch": m5,
    "failedToCreatePendingBranch": m6,
    "failedToDeleteBranch": m7,
    "failedToEditBranch": m8,
    "failedToLoadBranches": m9,
    "failedToModerateBranch": m10,
    "fetchUserError": m11,
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Забыли пароль? "),
    "franchiseBranchesTitle": m12,
    "franchiseDataError": MessageLookupByLibrary.simpleMessage(
      "Ошибка: данные франшизы не переданы",
    ),
    "googleLoginError": m13,
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Полученные учетные данные некорректны или истекли.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Электронная почта недействительна или неправильно отформатирована.",
    ),
    "invalidRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Введите число",
    ),
    "invalidVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Код верификации учетных данных недействителен.",
    ),
    "invalidVerificationId": MessageLookupByLibrary.simpleMessage(
      "Идентификатор верификации учетных данных недействителен.",
    ),
    "locationLabel": MessageLookupByLibrary.simpleMessage("Адрес"),
    "logInLink": MessageLookupByLibrary.simpleMessage("Войти!"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Вход"),
    "loginError": m14,
    "logoutError": m15,
    "myBranchesTitle": MessageLookupByLibrary.simpleMessage("Мои точки"),
    "newBranchRequest": m16,
    "noBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У этой франшизы пока нет точек.",
    ),
    "noUserBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У вас пока нет точек.",
    ),
    "notRegisteredUser": MessageLookupByLibrary.simpleMessage(
      "Не зарегистрированы? ",
    ),
    "operationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Операция не разрешена. Пожалуйста, свяжитесь с поддержкой.",
    ),
    "operationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Операция выполнена успешно",
    ),
    "orContinueWith": MessageLookupByLibrary.simpleMessage("Или продолжить с"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pendingRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Заявки на модерацию",
    ),
    "phoneLabel": MessageLookupByLibrary.simpleMessage("Телефон"),
    "registerNowLink": MessageLookupByLibrary.simpleMessage(
      "Зарегистрироваться!",
    ),
    "registrationButton": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "reportsTab": MessageLookupByLibrary.simpleMessage("Отчёты"),
    "royaltyPercentLabel": MessageLookupByLibrary.simpleMessage("Роялти (%)"),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage(
      "Сохранить изменения",
    ),
    "sendRequestButton": MessageLookupByLibrary.simpleMessage(
      "Отправить заявку",
    ),
    "signInAccount": MessageLookupByLibrary.simpleMessage(
      "Войдите в свой аккаунт",
    ),
    "signUpError": m17,
    "statusLabel": m18,
    "transactionsTab": MessageLookupByLibrary.simpleMessage("Транзакции"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Произошла неизвестная ошибка.",
    ),
    "userCreationFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось создать пользователя",
    ),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "Этот пользователь заблокирован. Пожалуйста, свяжитесь с поддержкой.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Пользователь не найден",
    ),
    "usernameLabel": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "waitingForData": MessageLookupByLibrary.simpleMessage(
      "Ожидание данных...",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, введите более надежный пароль.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("С возвращением!"),
    "workingHoursLabel": MessageLookupByLibrary.simpleMessage(
      "Часы работы (например, 9:00-18:00)",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Неверный пароль, попробуйте еще раз.",
    ),
  };
}
