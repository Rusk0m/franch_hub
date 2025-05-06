// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign up error: {error}`
  String signUpError(Object error) {
    return Intl.message(
      'Sign up error: $error',
      name: 'signUpError',
      desc: 'Error message shown when sign up fails with a specific error',
      args: [error],
    );
  }

  /// `Login error: {error}`
  String loginError(Object error) {
    return Intl.message(
      'Login error: $error',
      name: 'loginError',
      desc: 'Error message shown when login fails with a specific error',
      args: [error],
    );
  }

  /// `Google login error: {error}`
  String googleLoginError(Object error) {
    return Intl.message(
      'Google login error: $error',
      name: 'googleLoginError',
      desc: 'Error message shown when Google login fails with a specific error',
      args: [error],
    );
  }

  /// `Logout error: {error}`
  String logoutError(Object error) {
    return Intl.message(
      'Logout error: $error',
      name: 'logoutError',
      desc: 'Error message shown when logout fails with a specific error',
      args: [error],
    );
  }

  /// `Authentication check error: {error}`
  String authCheckError(Object error) {
    return Intl.message(
      'Authentication check error: $error',
      name: 'authCheckError',
      desc: 'Error message shown when checking authentication status fails',
      args: [error],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: 'Error message when a user is not found',
      args: [],
    );
  }

  /// `Failed to fetch user: {error}`
  String fetchUserError(Object error) {
    return Intl.message(
      'Failed to fetch user: $error',
      name: 'fetchUserError',
      desc: 'Error message when fetching user data fails',
      args: [error],
    );
  }

  /// `User creation failed`
  String get userCreationFailed {
    return Intl.message(
      'User creation failed',
      name: 'userCreationFailed',
      desc: 'Error message when user creation fails',
      args: [],
    );
  }

  /// `An unknown exception occurred.`
  String get unknownError {
    return Intl.message(
      'An unknown exception occurred.',
      name: 'unknownError',
      desc: 'Generic error message for unknown exceptions',
      args: [],
    );
  }

  /// `Email is not valid or badly formatted.`
  String get invalidEmail {
    return Intl.message(
      'Email is not valid or badly formatted.',
      name: 'invalidEmail',
      desc: 'Error message when the email is invalid',
      args: [],
    );
  }

  /// `An account already exists for that email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'An account already exists for that email.',
      name: 'emailAlreadyInUse',
      desc: 'Error message when the email is already in use',
      args: [],
    );
  }

  /// `Operation is not allowed. Please contact support.`
  String get operationNotAllowed {
    return Intl.message(
      'Operation is not allowed. Please contact support.',
      name: 'operationNotAllowed',
      desc: 'Error message when the operation is not allowed',
      args: [],
    );
  }

  /// `Please enter a stronger password.`
  String get weakPassword {
    return Intl.message(
      'Please enter a stronger password.',
      name: 'weakPassword',
      desc: 'Error message when the password is too weak',
      args: [],
    );
  }

  /// `This user has been disabled. Please contact support for help.`
  String get userDisabled {
    return Intl.message(
      'This user has been disabled. Please contact support for help.',
      name: 'userDisabled',
      desc: 'Error message when the user account is disabled',
      args: [],
    );
  }

  /// `Email is not found, please create an account.`
  String get emailNotFound {
    return Intl.message(
      'Email is not found, please create an account.',
      name: 'emailNotFound',
      desc: 'Error message when the email is not found',
      args: [],
    );
  }

  /// `Incorrect password, please try again.`
  String get wrongPassword {
    return Intl.message(
      'Incorrect password, please try again.',
      name: 'wrongPassword',
      desc: 'Error message when the password is incorrect',
      args: [],
    );
  }

  /// `Account exists with different credentials.`
  String get accountExistsDifferentCredential {
    return Intl.message(
      'Account exists with different credentials.',
      name: 'accountExistsDifferentCredential',
      desc: 'Error message when the account exists with different credentials',
      args: [],
    );
  }

  /// `The credential received is malformed or has expired.`
  String get invalidCredential {
    return Intl.message(
      'The credential received is malformed or has expired.',
      name: 'invalidCredential',
      desc: 'Error message when the credential is invalid',
      args: [],
    );
  }

  /// `The credential verification code received is invalid.`
  String get invalidVerificationCode {
    return Intl.message(
      'The credential verification code received is invalid.',
      name: 'invalidVerificationCode',
      desc: 'Error message when the verification code is invalid',
      args: [],
    );
  }

  /// `The credential verification ID received is invalid.`
  String get invalidVerificationId {
    return Intl.message(
      'The credential verification ID received is invalid.',
      name: 'invalidVerificationId',
      desc: 'Error message when the verification ID is invalid',
      args: [],
    );
  }

  /// `Welcome Back!`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'welcomeBack',
      desc: 'Greeting text on the authentication page',
      args: [],
    );
  }

  /// `Create a new account`
  String get createNewAccount {
    return Intl.message(
      'Create a new account',
      name: 'createNewAccount',
      desc: 'Text shown when in registration mode',
      args: [],
    );
  }

  /// `Sing in your account`
  String get signInAccount {
    return Intl.message(
      'Sing in your account',
      name: 'signInAccount',
      desc: 'Text shown when in login mode',
      args: [],
    );
  }

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
      desc: 'Label for the username input field',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: 'Label for the email input field',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: 'Label for the password input field',
      args: [],
    );
  }

  /// `Forgot password? `
  String get forgotPassword {
    return Intl.message(
      'Forgot password? ',
      name: 'forgotPassword',
      desc: 'Text for the forgot password link',
      args: [],
    );
  }

  /// `Registration`
  String get registrationButton {
    return Intl.message(
      'Registration',
      name: 'registrationButton',
      desc: 'Text for the registration button',
      args: [],
    );
  }

  /// `Login`
  String get loginButton {
    return Intl.message(
      'Login',
      name: 'loginButton',
      desc: 'Text for the login button',
      args: [],
    );
  }

  /// `Or Continue With`
  String get orContinueWith {
    return Intl.message(
      'Or Continue With',
      name: 'orContinueWith',
      desc: 'Text for the divider before alternative login options',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: 'Text prompting to switch to login',
      args: [],
    );
  }

  /// `Not a registered user? `
  String get notRegisteredUser {
    return Intl.message(
      'Not a registered user? ',
      name: 'notRegisteredUser',
      desc: 'Text prompting to switch to registration',
      args: [],
    );
  }

  /// `LogIn!`
  String get logInLink {
    return Intl.message(
      'LogIn!',
      name: 'logInLink',
      desc: 'Text for the login link',
      args: [],
    );
  }

  /// `Register Now!`
  String get registerNowLink {
    return Intl.message(
      'Register Now!',
      name: 'registerNowLink',
      desc: 'Text for the registration link',
      args: [],
    );
  }

  /// `Error: {message}`
  String errorMessage(Object message) {
    return Intl.message(
      'Error: $message',
      name: 'errorMessage',
      desc: 'Generic error message with a specific message',
      args: [message],
    );
  }

  /// `Franchise branches: {franchiseName}`
  String franchiseBranchesTitle(Object franchiseName) {
    return Intl.message(
      'Franchise branches: $franchiseName',
      name: 'franchiseBranchesTitle',
      desc:
          'Title for the franchise branches page, displaying the franchise name',
      args: [franchiseName],
    );
  }

  /// `My branches`
  String get myBranchesTitle {
    return Intl.message(
      'My branches',
      name: 'myBranchesTitle',
      desc: 'Title for the user\'s branches page',
      args: [],
    );
  }

  /// `Add branch`
  String get addBranchTitle {
    return Intl.message(
      'Add branch',
      name: 'addBranchTitle',
      desc: 'Title for the add branch page when adding directly',
      args: [],
    );
  }

  /// `Create branch request`
  String get createBranchRequestTitle {
    return Intl.message(
      'Create branch request',
      name: 'createBranchRequestTitle',
      desc: 'Title for the add branch page when creating a request',
      args: [],
    );
  }

  /// `Edit branch`
  String get editBranchTitle {
    return Intl.message(
      'Edit branch',
      name: 'editBranchTitle',
      desc: 'Title for the edit branch page',
      args: [],
    );
  }

  /// `Branch name`
  String get branchNameLabel {
    return Intl.message(
      'Branch name',
      name: 'branchNameLabel',
      desc: 'Label for the branch name input field',
      args: [],
    );
  }

  /// `Address`
  String get locationLabel {
    return Intl.message(
      'Address',
      name: 'locationLabel',
      desc: 'Label for the address input field',
      args: [],
    );
  }

  /// `Royalty (%)`
  String get royaltyPercentLabel {
    return Intl.message(
      'Royalty (%)',
      name: 'royaltyPercentLabel',
      desc: 'Label for the royalty percentage input field',
      args: [],
    );
  }

  /// `Working hours (e.g., 9:00-18:00)`
  String get workingHoursLabel {
    return Intl.message(
      'Working hours (e.g., 9:00-18:00)',
      name: 'workingHoursLabel',
      desc: 'Label for the working hours input field',
      args: [],
    );
  }

  /// `Phone`
  String get phoneLabel {
    return Intl.message(
      'Phone',
      name: 'phoneLabel',
      desc: 'Label for the phone input field',
      args: [],
    );
  }

  /// `Please enter a name`
  String get enterNameError {
    return Intl.message(
      'Please enter a name',
      name: 'enterNameError',
      desc: 'Error message when the branch name is empty',
      args: [],
    );
  }

  /// `Please enter an address`
  String get enterLocationError {
    return Intl.message(
      'Please enter an address',
      name: 'enterLocationError',
      desc: 'Error message when the address is empty',
      args: [],
    );
  }

  /// `Please enter royalty`
  String get enterRoyaltyError {
    return Intl.message(
      'Please enter royalty',
      name: 'enterRoyaltyError',
      desc: 'Error message when the royalty percentage is empty',
      args: [],
    );
  }

  /// `Please enter a valid number`
  String get invalidRoyaltyError {
    return Intl.message(
      'Please enter a valid number',
      name: 'invalidRoyaltyError',
      desc: 'Error message when the royalty percentage is not a number',
      args: [],
    );
  }

  /// `Please enter working hours`
  String get enterWorkingHoursError {
    return Intl.message(
      'Please enter working hours',
      name: 'enterWorkingHoursError',
      desc: 'Error message when the working hours are empty',
      args: [],
    );
  }

  /// `Please enter a phone number`
  String get enterPhoneError {
    return Intl.message(
      'Please enter a phone number',
      name: 'enterPhoneError',
      desc: 'Error message when the phone number is empty',
      args: [],
    );
  }

  /// `Send request`
  String get sendRequestButton {
    return Intl.message(
      'Send request',
      name: 'sendRequestButton',
      desc: 'Button text for sending a branch request',
      args: [],
    );
  }

  /// `Add branch`
  String get addBranchButton {
    return Intl.message(
      'Add branch',
      name: 'addBranchButton',
      desc: 'Button text for adding a branch directly',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChangesButton {
    return Intl.message(
      'Save changes',
      name: 'saveChangesButton',
      desc: 'Button text for saving branch changes',
      args: [],
    );
  }

  /// `This franchise has no branches yet.`
  String get noBranchesMessage {
    return Intl.message(
      'This franchise has no branches yet.',
      name: 'noBranchesMessage',
      desc: 'Message when there are no branches for a franchise',
      args: [],
    );
  }

  /// `You don't have any branches yet.`
  String get noUserBranchesMessage {
    return Intl.message(
      'You don\'t have any branches yet.',
      name: 'noUserBranchesMessage',
      desc: 'Message when the user has no branches',
      args: [],
    );
  }

  /// `Pending requests`
  String get pendingRequestsTitle {
    return Intl.message(
      'Pending requests',
      name: 'pendingRequestsTitle',
      desc: 'Title for the pending branch requests section',
      args: [],
    );
  }

  /// `Status: {status}`
  String statusLabel(Object status) {
    return Intl.message(
      'Status: $status',
      name: 'statusLabel',
      desc: 'Label for displaying the status of a pending branch',
      args: [status],
    );
  }

  /// `Delete branch?`
  String get deleteBranchDialogTitle {
    return Intl.message(
      'Delete branch?',
      name: 'deleteBranchDialogTitle',
      desc: 'Title for the delete branch confirmation dialog',
      args: [],
    );
  }

  /// `Are you sure you want to delete "{branchName}"?`
  String deleteBranchDialogContent(Object branchName) {
    return Intl.message(
      'Are you sure you want to delete "$branchName"?',
      name: 'deleteBranchDialogContent',
      desc: 'Content for the delete branch confirmation dialog',
      args: [branchName],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: 'Button text for canceling an action',
      args: [],
    );
  }

  /// `Delete`
  String get deleteButton {
    return Intl.message(
      'Delete',
      name: 'deleteButton',
      desc: 'Button text for confirming deletion',
      args: [],
    );
  }

  /// `Back`
  String get backButton {
    return Intl.message(
      'Back',
      name: 'backButton',
      desc: 'Button text for going back',
      args: [],
    );
  }

  /// `Operation completed successfully`
  String get operationSuccessMessage {
    return Intl.message(
      'Operation completed successfully',
      name: 'operationSuccessMessage',
      desc: 'Success message for a completed operation',
      args: [],
    );
  }

  /// `Request sent for moderation`
  String get branchRequestSentMessage {
    return Intl.message(
      'Request sent for moderation',
      name: 'branchRequestSentMessage',
      desc: 'Success message when a branch request is sent',
      args: [],
    );
  }

  /// `Branch added successfully`
  String get branchAddedMessage {
    return Intl.message(
      'Branch added successfully',
      name: 'branchAddedMessage',
      desc: 'Success message when a branch is added',
      args: [],
    );
  }

  /// `Branch updated successfully`
  String get branchUpdatedMessage {
    return Intl.message(
      'Branch updated successfully',
      name: 'branchUpdatedMessage',
      desc: 'Success message when a branch is updated',
      args: [],
    );
  }

  /// `New branch request: {branchName} by {requesterId}`
  String newBranchRequest(Object branchName, Object requesterId) {
    return Intl.message(
      'New branch request: $branchName by $requesterId',
      name: 'newBranchRequest',
      desc:
          'System message for notifying franchise owner of a new branch request',
      args: [branchName, requesterId],
    );
  }

  /// `Branch request approved: {branchName}`
  String branchRequestApproved(Object branchName) {
    return Intl.message(
      'Branch request approved: $branchName',
      name: 'branchRequestApproved',
      desc:
          'System message for notifying franchisee of branch request approval',
      args: [branchName],
    );
  }

  /// `Error: Franchise data not provided`
  String get franchiseDataError {
    return Intl.message(
      'Error: Franchise data not provided',
      name: 'franchiseDataError',
      desc: 'Error message when franchise data is missing',
      args: [],
    );
  }

  /// `The branch you are trying to edit no longer exists.`
  String get branchNotFoundError {
    return Intl.message(
      'The branch you are trying to edit no longer exists.',
      name: 'branchNotFoundError',
      desc: 'Error message when the branch to edit does not exist',
      args: [],
    );
  }

  /// `Failed to create pending branch: {error}`
  String failedToCreatePendingBranch(Object error) {
    return Intl.message(
      'Failed to create pending branch: $error',
      name: 'failedToCreatePendingBranch',
      desc: 'Error message when creating a pending branch fails',
      args: [error],
    );
  }

  /// `Failed to load branches: {error}`
  String failedToLoadBranches(Object error) {
    return Intl.message(
      'Failed to load branches: $error',
      name: 'failedToLoadBranches',
      desc: 'Error message when loading branches fails',
      args: [error],
    );
  }

  /// `Failed to add branch: {error}`
  String failedToAddBranch(Object error) {
    return Intl.message(
      'Failed to add branch: $error',
      name: 'failedToAddBranch',
      desc: 'Error message when adding a branch fails',
      args: [error],
    );
  }

  /// `Failed to delete branch: {error}`
  String failedToDeleteBranch(Object error) {
    return Intl.message(
      'Failed to delete branch: $error',
      name: 'failedToDeleteBranch',
      desc: 'Error message when deleting a branch fails',
      args: [error],
    );
  }

  /// `Failed to edit branch: {error}`
  String failedToEditBranch(Object error) {
    return Intl.message(
      'Failed to edit branch: $error',
      name: 'failedToEditBranch',
      desc: 'Error message when editing a branch fails',
      args: [error],
    );
  }

  /// `Failed to moderate branch: {error}`
  String failedToModerateBranch(Object error) {
    return Intl.message(
      'Failed to moderate branch: $error',
      name: 'failedToModerateBranch',
      desc: 'Error message when moderating a branch fails',
      args: [error],
    );
  }

  /// `Reports`
  String get reportsTab {
    return Intl.message(
      'Reports',
      name: 'reportsTab',
      desc: 'Tab text for the reports section',
      args: [],
    );
  }

  /// `Transactions`
  String get transactionsTab {
    return Intl.message(
      'Transactions',
      name: 'transactionsTab',
      desc: 'Tab text for the transactions section',
      args: [],
    );
  }

  /// `Address: {location}\nWorking hours: {workingHours}\nPhone: {phone}`
  String branchInfo(Object location, Object workingHours, Object phone) {
    return Intl.message(
      'Address: $location\nWorking hours: $workingHours\nPhone: $phone',
      name: 'branchInfo',
      desc: 'Subtitle for branch information in the list',
      args: [location, workingHours, phone],
    );
  }

  /// `Waiting for data...`
  String get waitingForData {
    return Intl.message(
      'Waiting for data...',
      name: 'waitingForData',
      desc: 'Message shown while waiting for data',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'be'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
