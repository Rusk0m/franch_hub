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

  static String m2(branchName) => "Запрос на филиал одобрен: ${branchName}";

  static String m3(requesterId) => "Запрошено: ${requesterId}";

  static String m4(status) => "Статус: ${status}";

  static String m5(message) => "Ошибка: ${message}";

  static String m6(error) => "Не удалось начать чат: ${error}";

  static String m7(userName) => "Чат с ${userName}";

  static String m8(city) => "Город: ${city}";

  static String m9(createdAt) => "Создано: ${createdAt}";

  static String m10(error) => "Ошибка данных: ${error}";

  static String m11(branchName) =>
      "Вы уверены, что хотите удалить \"${branchName}\"?";

  static String m12(description) => "Описание: ${description}";

  static String m13(message) => "Ошибка: ${message}";

  static String m14(error) => "Не удалось добавить филиал: ${error}";

  static String m15(error) => "Не удалось создать ожидающий филиал: ${error}";

  static String m16(error) => "Не удалось удалить филиал: ${error}";

  static String m17(error) => "Не удалось отредактировать филиал: ${error}";

  static String m18(error) => "Не удалось загрузить филиалы: ${error}";

  static String m19(error) => "Не удалось модерировать филиал: ${error}";

  static String m20(error) =>
      "Не удалось получить данные пользователя: ${error}";

  static String m21(franchiseName) => "Филиалы франшизы: ${franchiseName}";

  static String m22(franchiseName) => "Франшиза: ${franchiseName}";

  static String m23(ownerId) => "ID владельца: ${ownerId}";

  static String m24(status) => "Статус: ${status}";

  static String m25(error) => "Ошибка входа через Google: ${error}";

  static String m26(month, year) => "Показатели ${month}/${year}";

  static String m27(industry) => "Отрасль: ${industry}";

  static String m28(location) => "Местоположение: ${location}";

  static String m29(error) => "Ошибка входа: ${error}";

  static String m30(error) => "Ошибка выхода: ${error}";

  static String m31(branchName, requesterId) =>
      "Новый запрос на филиал: ${branchName} от ${requesterId}";

  static String m32(phone) => "Телефон: ${phone}";

  static String m33(month, year) => "Детали отчета ${month}/${year}";

  static String m34(error) => "Ошибка регистрации: ${error}";

  static String m35(status) => "Статус: ${status}";

  static String m36(workingHours) => "Часы работы: ${workingHours}";

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
    "autonomyRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Коэффициент автономии",
    ),
    "backButton": MessageLookupByLibrary.simpleMessage("Назад"),
    "branchAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Филиал успешно добавлен",
    ),
    "branchIndicatorsTitle": MessageLookupByLibrary.simpleMessage(
      "Показатели филиала",
    ),
    "branchInfo": m1,
    "branchModerationSuccess": MessageLookupByLibrary.simpleMessage(
      "Модерация филиала успешна",
    ),
    "branchNameLabel": MessageLookupByLibrary.simpleMessage("Название филиала"),
    "branchNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Филиал, который вы пытаетесь отредактировать, больше не существует.",
    ),
    "branchReportsTitle": MessageLookupByLibrary.simpleMessage(
      "Отчеты филиала",
    ),
    "branchRequestApproved": m2,
    "branchRequestSentMessage": MessageLookupByLibrary.simpleMessage(
      "Запрос отправлен на модерацию",
    ),
    "branchRequestedByLabel": m3,
    "branchStatusLabel": m4,
    "branchUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Филиал успешно обновлен",
    ),
    "breakevenPointLabel": MessageLookupByLibrary.simpleMessage(
      "Точка безубыточности",
    ),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Отмена"),
    "cashInflowLabel": MessageLookupByLibrary.simpleMessage(
      "Приток денежных средств",
    ),
    "cashOutflowLabel": MessageLookupByLibrary.simpleMessage(
      "Отток денежных средств",
    ),
    "chatError": m5,
    "chatFailedError": m6,
    "chatPageTitle": m7,
    "cityLabel": m8,
    "cityRequiredError": MessageLookupByLibrary.simpleMessage(
      "Город обязателен",
    ),
    "closeButton": MessageLookupByLibrary.simpleMessage("Закрыть"),
    "createBranchRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Создать запрос на филиал",
    ),
    "createFranchiseTitle": MessageLookupByLibrary.simpleMessage(
      "Создать франшизу",
    ),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Создать новый аккаунт",
    ),
    "createdAtLabel": m9,
    "currentRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Текущий коэффициент ликвидности",
    ),
    "currentUserNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Текущий пользователь не найден",
    ),
    "dataError": m10,
    "debtLoadLabel": MessageLookupByLibrary.simpleMessage("Долговая нагрузка"),
    "deleteBranchDialogContent": m11,
    "deleteBranchDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Удалить филиал?",
    ),
    "deleteButton": MessageLookupByLibrary.simpleMessage("Удалить"),
    "descriptionLabel": m12,
    "descriptionRequiredError": MessageLookupByLibrary.simpleMessage(
      "Описание обязательно",
    ),
    "editBranchTitle": MessageLookupByLibrary.simpleMessage(
      "Редактировать филиал",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Аккаунт с этой электронной почтой уже существует.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "emailNotFound": MessageLookupByLibrary.simpleMessage(
      "Электронная почта не найдена, создайте аккаунт.",
    ),
    "enterLocationError": MessageLookupByLibrary.simpleMessage("Введите адрес"),
    "enterNameError": MessageLookupByLibrary.simpleMessage("Введите название"),
    "enterPhoneError": MessageLookupByLibrary.simpleMessage(
      "Введите номер телефона",
    ),
    "enterRoyaltyError": MessageLookupByLibrary.simpleMessage("Введите роялти"),
    "enterWorkingHoursError": MessageLookupByLibrary.simpleMessage(
      "Введите часы работы",
    ),
    "errorMessage": m13,
    "exploreFranchiseTitle": MessageLookupByLibrary.simpleMessage(
      "Исследуйте нашу франшизу",
    ),
    "exploreOpportunities": MessageLookupByLibrary.simpleMessage(
      "Исследуйте лучшие возможности",
    ),
    "failedToAddBranch": m14,
    "failedToCreatePendingBranch": m15,
    "failedToDeleteBranch": m16,
    "failedToEditBranch": m17,
    "failedToLoadBranches": m18,
    "failedToModerateBranch": m19,
    "fetchUserError": m20,
    "findPerfectFranchise": MessageLookupByLibrary.simpleMessage(
      "Найдите свою идеальную франшизу",
    ),
    "fixedCostsLabel": MessageLookupByLibrary.simpleMessage(
      "Фиксированные затраты",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Забыли пароль? "),
    "franchHubTitle": MessageLookupByLibrary.simpleMessage("Franch Hub"),
    "franchiseBranchesTitle": m21,
    "franchiseDataError": MessageLookupByLibrary.simpleMessage(
      "Ошибка: Данные франшизы не предоставлены",
    ),
    "franchiseLabel": m22,
    "franchiseModerationSuccess": MessageLookupByLibrary.simpleMessage(
      "Модерация франшизы успешна",
    ),
    "franchiseOverviewTitle": MessageLookupByLibrary.simpleMessage(
      "Обзор франшизы",
    ),
    "franchiseOwnerIdLabel": m23,
    "franchiseOwnerNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Владелец франшизы не найден",
    ),
    "franchiseSentForModeration": MessageLookupByLibrary.simpleMessage(
      "Франшиза отправлена на модерацию",
    ),
    "franchiseStatusLabel": m24,
    "googleLoginError": m25,
    "indicatorsDetailsTitle": m26,
    "industryLabel": m27,
    "industryRequiredError": MessageLookupByLibrary.simpleMessage(
      "Отрасль обязательна",
    ),
    "initialInvestmentLabel": MessageLookupByLibrary.simpleMessage(
      "Начальные инвестиции",
    ),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "Полученные учетные данные неверны или истекли.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Электронная почта недействительна или неправильно отформатирована.",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Введите действительное число",
    ),
    "invalidNumberFormatError": MessageLookupByLibrary.simpleMessage(
      "Недействительный формат числа",
    ),
    "invalidRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Введите действительное число",
    ),
    "invalidRoyaltyPercentError": MessageLookupByLibrary.simpleMessage(
      "Введите действительный процент (0-100)",
    ),
    "invalidStartupCostError": MessageLookupByLibrary.simpleMessage(
      "Введите действительное число",
    ),
    "invalidVerificationCode": MessageLookupByLibrary.simpleMessage(
      "Код верификации учетных данных недействителен.",
    ),
    "invalidVerificationId": MessageLookupByLibrary.simpleMessage(
      "ID верификации учетных данных недействителен.",
    ),
    "inventoryLabel": MessageLookupByLibrary.simpleMessage("Запасы"),
    "liabilitiesLabel": MessageLookupByLibrary.simpleMessage("Обязательства"),
    "locationLabel": m28,
    "logInLink": MessageLookupByLibrary.simpleMessage("Войти!"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Вход"),
    "loginError": m29,
    "logoutError": m30,
    "moderationTitle": MessageLookupByLibrary.simpleMessage("Модерация"),
    "myBranchesTitle": MessageLookupByLibrary.simpleMessage("Мои филиалы"),
    "myFranchisesTitle": MessageLookupByLibrary.simpleMessage("Мои франшизы"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Название"),
    "nameRequiredError": MessageLookupByLibrary.simpleMessage(
      "Название обязательно",
    ),
    "netCashFlowLabel": MessageLookupByLibrary.simpleMessage(
      "Чистый денежный поток",
    ),
    "netProfitLabel": MessageLookupByLibrary.simpleMessage("Чистая прибыль"),
    "newBranchRequest": m31,
    "newFinancialReportTitle": MessageLookupByLibrary.simpleMessage(
      "Новый финансовый отчет",
    ),
    "noBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У этой франшизы пока нет филиалов.",
    ),
    "noFranchisesAvailable": MessageLookupByLibrary.simpleMessage(
      "Франшизы отсутствуют",
    ),
    "noFranchisesYet": MessageLookupByLibrary.simpleMessage(
      "У вас пока нет франшиз.",
    ),
    "noIndicatorsData": MessageLookupByLibrary.simpleMessage(
      "Данные по показателям отсутствуют",
    ),
    "noMessagesYet": MessageLookupByLibrary.simpleMessage("Сообщений пока нет"),
    "noPendingBranchRequests": MessageLookupByLibrary.simpleMessage(
      "Нет заявок на филиалы",
    ),
    "noPendingFranchiseRequests": MessageLookupByLibrary.simpleMessage(
      "Нет заявок на франшизы",
    ),
    "noReportsAvailable": MessageLookupByLibrary.simpleMessage(
      "Отчеты отсутствуют",
    ),
    "noUserBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "У вас пока нет филиалов.",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage(
      "Пользователи не найдены",
    ),
    "notRegisteredUser": MessageLookupByLibrary.simpleMessage(
      "Не зарегистрированный пользователь? ",
    ),
    "operationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Операция не разрешена. Обратитесь в поддержку.",
    ),
    "operationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Операция успешно завершена",
    ),
    "orContinueWith": MessageLookupByLibrary.simpleMessage("Или продолжить с"),
    "ownCapitalLabel": MessageLookupByLibrary.simpleMessage(
      "Собственный капитал",
    ),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Пароль"),
    "pendingRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Ожидающие запросы",
    ),
    "phoneLabel": m32,
    "pleaseLogIn": MessageLookupByLibrary.simpleMessage("Пожалуйста, войдите"),
    "pleaseLogInToViewUsers": MessageLookupByLibrary.simpleMessage(
      "Пожалуйста, войдите, чтобы просмотреть пользователей",
    ),
    "quickRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Коэффициент быстрой ликвидности",
    ),
    "registerNowLink": MessageLookupByLibrary.simpleMessage(
      "Зарегистрироваться сейчас!",
    ),
    "registrationButton": MessageLookupByLibrary.simpleMessage("Регистрация"),
    "reportDetailsTitle": m33,
    "reportSubmittedSuccess": MessageLookupByLibrary.simpleMessage(
      "Отчет успешно отправлен",
    ),
    "reportsTab": MessageLookupByLibrary.simpleMessage("Отчеты"),
    "requiredFieldError": MessageLookupByLibrary.simpleMessage(
      "Обязательное поле",
    ),
    "respondNowButton": MessageLookupByLibrary.simpleMessage("Ответить сейчас"),
    "returnOnAssetsLabel": MessageLookupByLibrary.simpleMessage(
      "Рентабельность активов",
    ),
    "returnOnSalesLabel": MessageLookupByLibrary.simpleMessage(
      "Рентабельность продаж",
    ),
    "revenueLabel": MessageLookupByLibrary.simpleMessage("Выручка"),
    "roiByMonths": MessageLookupByLibrary.simpleMessage("ROI по месяцам"),
    "roiLabel": MessageLookupByLibrary.simpleMessage(
      "Возврат инвестиций (ROI)",
    ),
    "royaltyPaymentLabel": MessageLookupByLibrary.simpleMessage(
      "Платеж роялти",
    ),
    "royaltyPercentLabel": MessageLookupByLibrary.simpleMessage("Роялти (%)"),
    "royaltyPercentLabelFranchise": MessageLookupByLibrary.simpleMessage(
      "Процент роялти (%)",
    ),
    "royaltyPercentLabelReport": MessageLookupByLibrary.simpleMessage(
      "Роялти (%)",
    ),
    "royaltyPercentRequiredError": MessageLookupByLibrary.simpleMessage(
      "Процент роялти обязателен",
    ),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage(
      "Сохранить изменения",
    ),
    "searchHint": MessageLookupByLibrary.simpleMessage("Поиск"),
    "selectUserToChatTitle": MessageLookupByLibrary.simpleMessage(
      "Выберите пользователя для чата",
    ),
    "sendRequestButton": MessageLookupByLibrary.simpleMessage(
      "Отправить запрос",
    ),
    "signInAccount": MessageLookupByLibrary.simpleMessage(
      "Войдите в свой аккаунт",
    ),
    "signUpError": m34,
    "startupCostLabel": MessageLookupByLibrary.simpleMessage(
      "Стартовые затраты (RUB)",
    ),
    "startupCostRequiredError": MessageLookupByLibrary.simpleMessage(
      "Стартовые затраты обязательны",
    ),
    "statusLabel": m35,
    "submitForModerationButton": MessageLookupByLibrary.simpleMessage(
      "Отправить на модерацию",
    ),
    "submitReportButton": MessageLookupByLibrary.simpleMessage(
      "Отправить отчет",
    ),
    "totalAssetsLabel": MessageLookupByLibrary.simpleMessage("Общие активы"),
    "transactionsTab": MessageLookupByLibrary.simpleMessage("Транзакции"),
    "typeMessageHint": MessageLookupByLibrary.simpleMessage(
      "Введите сообщение...",
    ),
    "unitPriceLabel": MessageLookupByLibrary.simpleMessage("Цена за единицу"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Произошла неизвестная ошибка.",
    ),
    "userCreationFailed": MessageLookupByLibrary.simpleMessage(
      "Не удалось создать пользователя",
    ),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "Этот пользователь заблокирован. Обратитесь в поддержку.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Пользователь не найден",
    ),
    "usernameLabel": MessageLookupByLibrary.simpleMessage("Имя пользователя"),
    "variableCostsLabel": MessageLookupByLibrary.simpleMessage(
      "Переменные затраты",
    ),
    "waitingForData": MessageLookupByLibrary.simpleMessage(
      "Ожидание данных...",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Введите более надежный пароль.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("С возвращением!"),
    "workingHoursLabel": m36,
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Неверный пароль, попробуйте снова.",
    ),
    "youAreFranchiseOwnerError": MessageLookupByLibrary.simpleMessage(
      "Вы являетесь владельцем франшизы",
    ),
  };
}
