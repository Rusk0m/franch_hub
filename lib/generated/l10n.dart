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

  /// `Sign in your account`
  String get signInAccount {
    return Intl.message(
      'Sign in your account',
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

  /// `The branch you are trying to edit no longer exists.`
  String get branchNotFoundError {
    return Intl.message(
      'The branch you are trying to edit no longer exists.',
      name: 'branchNotFoundError',
      desc: 'Error message when the branch to edit does not exist',
      args: [],
    );
  }

  /// `Chat with {userName}`
  String chatPageTitle(Object userName) {
    return Intl.message(
      'Chat with $userName',
      name: 'chatPageTitle',
      desc: 'Title for the chat page, displaying the other user\'s name',
      args: [userName],
    );
  }

  /// `Type a message...`
  String get typeMessageHint {
    return Intl.message(
      'Type a message...',
      name: 'typeMessageHint',
      desc: 'Hint text for the message input field',
      args: [],
    );
  }

  /// `No messages yet`
  String get noMessagesYet {
    return Intl.message(
      'No messages yet',
      name: 'noMessagesYet',
      desc: 'Message shown when there are no messages in the chat',
      args: [],
    );
  }

  /// `Error: {message}`
  String chatError(Object message) {
    return Intl.message(
      'Error: $message',
      name: 'chatError',
      desc: 'Error message shown when there is an issue with the chat',
      args: [message],
    );
  }

  /// `Select User to Chat`
  String get selectUserToChatTitle {
    return Intl.message(
      'Select User to Chat',
      name: 'selectUserToChatTitle',
      desc: 'Title for the users list page',
      args: [],
    );
  }

  /// `Please log in to view users`
  String get pleaseLogInToViewUsers {
    return Intl.message(
      'Please log in to view users',
      name: 'pleaseLogInToViewUsers',
      desc: 'Message shown when the user is not authenticated',
      args: [],
    );
  }

  /// `No users found`
  String get noUsersFound {
    return Intl.message(
      'No users found',
      name: 'noUsersFound',
      desc: 'Message shown when no users are available to chat with',
      args: [],
    );
  }

  /// `Branch reports`
  String get branchReportsTitle {
    return Intl.message(
      'Branch reports',
      name: 'branchReportsTitle',
      desc: 'Title for the branch reports page',
      args: [],
    );
  }

  /// `No reports available`
  String get noReportsAvailable {
    return Intl.message(
      'No reports available',
      name: 'noReportsAvailable',
      desc: 'Message shown when there are no financial reports',
      args: [],
    );
  }

  /// `Report details {month}/{year}`
  String reportDetailsTitle(Object month, Object year) {
    return Intl.message(
      'Report details $month/$year',
      name: 'reportDetailsTitle',
      desc: 'Title for the report details dialog',
      args: [month, year],
    );
  }

  /// `Revenue`
  String get revenueLabel {
    return Intl.message(
      'Revenue',
      name: 'revenueLabel',
      desc: 'Label for the revenue field',
      args: [],
    );
  }

  /// `Net profit`
  String get netProfitLabel {
    return Intl.message(
      'Net profit',
      name: 'netProfitLabel',
      desc: 'Label for the net profit field',
      args: [],
    );
  }

  /// `Total assets`
  String get totalAssetsLabel {
    return Intl.message(
      'Total assets',
      name: 'totalAssetsLabel',
      desc: 'Label for the total assets field',
      args: [],
    );
  }

  /// `Own capital`
  String get ownCapitalLabel {
    return Intl.message(
      'Own capital',
      name: 'ownCapitalLabel',
      desc: 'Label for the own capital field',
      args: [],
    );
  }

  /// `Liabilities`
  String get liabilitiesLabel {
    return Intl.message(
      'Liabilities',
      name: 'liabilitiesLabel',
      desc: 'Label for the liabilities field',
      args: [],
    );
  }

  /// `Inventory`
  String get inventoryLabel {
    return Intl.message(
      'Inventory',
      name: 'inventoryLabel',
      desc: 'Label for the inventory field',
      args: [],
    );
  }

  /// `Initial investment`
  String get initialInvestmentLabel {
    return Intl.message(
      'Initial investment',
      name: 'initialInvestmentLabel',
      desc: 'Label for the initial investment field',
      args: [],
    );
  }

  /// `Fixed costs`
  String get fixedCostsLabel {
    return Intl.message(
      'Fixed costs',
      name: 'fixedCostsLabel',
      desc: 'Label for the fixed costs field',
      args: [],
    );
  }

  /// `Unit price`
  String get unitPriceLabel {
    return Intl.message(
      'Unit price',
      name: 'unitPriceLabel',
      desc: 'Label for the unit price field',
      args: [],
    );
  }

  /// `Variable costs`
  String get variableCostsLabel {
    return Intl.message(
      'Variable costs',
      name: 'variableCostsLabel',
      desc: 'Label for the variable costs field',
      args: [],
    );
  }

  /// `Cash inflow`
  String get cashInflowLabel {
    return Intl.message(
      'Cash inflow',
      name: 'cashInflowLabel',
      desc: 'Label for the cash inflow field',
      args: [],
    );
  }

  /// `Cash outflow`
  String get cashOutflowLabel {
    return Intl.message(
      'Cash outflow',
      name: 'cashOutflowLabel',
      desc: 'Label for the cash outflow field',
      args: [],
    );
  }

  /// `Royalty (%)`
  String get royaltyPercentLabelReport {
    return Intl.message(
      'Royalty (%)',
      name: 'royaltyPercentLabelReport',
      desc: 'Label for the royalty percentage field in reports',
      args: [],
    );
  }

  /// `Close`
  String get closeButton {
    return Intl.message(
      'Close',
      name: 'closeButton',
      desc: 'Button text for closing a dialog',
      args: [],
    );
  }

  /// `Branch indicators`
  String get branchIndicatorsTitle {
    return Intl.message(
      'Branch indicators',
      name: 'branchIndicatorsTitle',
      desc: 'Title for the branch indicators page',
      args: [],
    );
  }

  /// `No indicators data`
  String get noIndicatorsData {
    return Intl.message(
      'No indicators data',
      name: 'noIndicatorsData',
      desc: 'Message shown when there are no economic indicators',
      args: [],
    );
  }

  /// `ROI by months`
  String get roiByMonths {
    return Intl.message(
      'ROI by months',
      name: 'roiByMonths',
      desc: 'Title for the ROI chart section',
      args: [],
    );
  }

  /// `Indicators {month}/{year}`
  String indicatorsDetailsTitle(Object month, Object year) {
    return Intl.message(
      'Indicators $month/$year',
      name: 'indicatorsDetailsTitle',
      desc: 'Title for the indicators details dialog',
      args: [month, year],
    );
  }

  /// `Return on Investment (ROI)`
  String get roiLabel {
    return Intl.message(
      'Return on Investment (ROI)',
      name: 'roiLabel',
      desc: 'Label for the ROI field',
      args: [],
    );
  }

  /// `Breakeven point`
  String get breakevenPointLabel {
    return Intl.message(
      'Breakeven point',
      name: 'breakevenPointLabel',
      desc: 'Label for the breakeven point field',
      args: [],
    );
  }

  /// `Quick ratio`
  String get quickRatioLabel {
    return Intl.message(
      'Quick ratio',
      name: 'quickRatioLabel',
      desc: 'Label for the quick ratio field',
      args: [],
    );
  }

  /// `Return on assets`
  String get returnOnAssetsLabel {
    return Intl.message(
      'Return on assets',
      name: 'returnOnAssetsLabel',
      desc: 'Label for the return on assets field',
      args: [],
    );
  }

  /// `Debt load`
  String get debtLoadLabel {
    return Intl.message(
      'Debt load',
      name: 'debtLoadLabel',
      desc: 'Label for the debt load field',
      args: [],
    );
  }

  /// `Current ratio`
  String get currentRatioLabel {
    return Intl.message(
      'Current ratio',
      name: 'currentRatioLabel',
      desc: 'Label for the current ratio field',
      args: [],
    );
  }

  /// `Return on sales`
  String get returnOnSalesLabel {
    return Intl.message(
      'Return on sales',
      name: 'returnOnSalesLabel',
      desc: 'Label for the return on sales field',
      args: [],
    );
  }

  /// `Autonomy ratio`
  String get autonomyRatioLabel {
    return Intl.message(
      'Autonomy ratio',
      name: 'autonomyRatioLabel',
      desc: 'Label for the autonomy ratio field',
      args: [],
    );
  }

  /// `Royalty payment`
  String get royaltyPaymentLabel {
    return Intl.message(
      'Royalty payment',
      name: 'royaltyPaymentLabel',
      desc: 'Label for the royalty payment field',
      args: [],
    );
  }

  /// `Net cash flow`
  String get netCashFlowLabel {
    return Intl.message(
      'Net cash flow',
      name: 'netCashFlowLabel',
      desc: 'Label for the net cash flow field',
      args: [],
    );
  }

  /// `New financial report`
  String get newFinancialReportTitle {
    return Intl.message(
      'New financial report',
      name: 'newFinancialReportTitle',
      desc: 'Title for the submit financial report page',
      args: [],
    );
  }

  /// `Submit report`
  String get submitReportButton {
    return Intl.message(
      'Submit report',
      name: 'submitReportButton',
      desc: 'Button text for submitting a financial report',
      args: [],
    );
  }

  /// `Required field`
  String get requiredFieldError {
    return Intl.message(
      'Required field',
      name: 'requiredFieldError',
      desc: 'Error message when a field is empty',
      args: [],
    );
  }

  /// `Enter a valid number`
  String get invalidNumberError {
    return Intl.message(
      'Enter a valid number',
      name: 'invalidNumberError',
      desc: 'Error message when the input is not a valid number',
      args: [],
    );
  }

  /// `Invalid number format`
  String get invalidNumberFormatError {
    return Intl.message(
      'Invalid number format',
      name: 'invalidNumberFormatError',
      desc: 'Error message when the number is NaN or infinite',
      args: [],
    );
  }

  /// `Report submitted successfully`
  String get reportSubmittedSuccess {
    return Intl.message(
      'Report submitted successfully',
      name: 'reportSubmittedSuccess',
      desc: 'Success message when a report is submitted',
      args: [],
    );
  }

  /// `Data error: {error}`
  String dataError(Object error) {
    return Intl.message(
      'Data error: $error',
      name: 'dataError',
      desc: 'Error message when there is an issue with the input data',
      args: [error],
    );
  }

  /// `Please log in`
  String get pleaseLogIn {
    return Intl.message(
      'Please log in',
      name: 'pleaseLogIn',
      desc: 'Message shown when the user is not authenticated',
      args: [],
    );
  }

  /// `Create Franchise`
  String get createFranchiseTitle {
    return Intl.message(
      'Create Franchise',
      name: 'createFranchiseTitle',
      desc: 'Title for the create franchise page',
      args: [],
    );
  }

  /// `Franchise sent for moderation`
  String get franchiseSentForModeration {
    return Intl.message(
      'Franchise sent for moderation',
      name: 'franchiseSentForModeration',
      desc: 'Success message when a franchise is sent for moderation',
      args: [],
    );
  }

  /// `Name`
  String get nameLabel {
    return Intl.message(
      'Name',
      name: 'nameLabel',
      desc: 'Label for the name input field',
      args: [],
    );
  }

  /// `Description`
  String get descriptionLabel {
    return Intl.message(
      'Description',
      name: 'descriptionLabel',
      desc: 'Label for the description input field',
      args: [],
    );
  }

  /// `Industry`
  String get industryLabel {
    return Intl.message(
      'Industry',
      name: 'industryLabel',
      desc: 'Label for the industry input field',
      args: [],
    );
  }

  /// `City`
  String get cityLabel {
    return Intl.message(
      'City',
      name: 'cityLabel',
      desc: 'Label for the city input field',
      args: [],
    );
  }

  /// `Startup Cost (RUB)`
  String get startupCostLabelfirst {
    return Intl.message(
      'Startup Cost (RUB)',
      name: 'startupCostLabelfirst',
      desc: 'Label for the startup cost input field',
      args: [],
    );
  }

  /// `Стартовые затраты: {currency}{amount}`
  String startupCostLabel(Object currency, Object amount) {
    return Intl.message(
      'Стартовые затраты: $currency$amount',
      name: 'startupCostLabel',
      desc: 'Метка для поля стартовых затрат с валютой и суммой',
      args: [currency, amount],
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

  /// `Royalty Percent (%)`
  String get royaltyPercentLabelFranchise {
    return Intl.message(
      'Royalty Percent (%)',
      name: 'royaltyPercentLabelFranchise',
      desc: 'Label for the royalty percentage field in franchise creation',
      args: [],
    );
  }

  /// `Name is required`
  String get nameRequiredError {
    return Intl.message(
      'Name is required',
      name: 'nameRequiredError',
      desc: 'Error message when the name is empty',
      args: [],
    );
  }

  /// `Description is required`
  String get descriptionRequiredError {
    return Intl.message(
      'Description is required',
      name: 'descriptionRequiredError',
      desc: 'Error message when the description is empty',
      args: [],
    );
  }

  /// `Industry is required`
  String get industryRequiredError {
    return Intl.message(
      'Industry is required',
      name: 'industryRequiredError',
      desc: 'Error message when the industry is empty',
      args: [],
    );
  }

  /// `City is required`
  String get cityRequiredError {
    return Intl.message(
      'City is required',
      name: 'cityRequiredError',
      desc: 'Error message when the city is empty',
      args: [],
    );
  }

  /// `Startup cost is required`
  String get startupCostRequiredError {
    return Intl.message(
      'Startup cost is required',
      name: 'startupCostRequiredError',
      desc: 'Error message when the startup cost is empty',
      args: [],
    );
  }

  /// `Enter a valid number`
  String get invalidStartupCostError {
    return Intl.message(
      'Enter a valid number',
      name: 'invalidStartupCostError',
      desc: 'Error message when the startup cost is not a valid number',
      args: [],
    );
  }

  /// `Royalty percent is required`
  String get royaltyPercentRequiredError {
    return Intl.message(
      'Royalty percent is required',
      name: 'royaltyPercentRequiredError',
      desc: 'Error message when the royalty percentage is empty',
      args: [],
    );
  }

  /// `Enter a valid percentage (0-100)`
  String get invalidRoyaltyPercentError {
    return Intl.message(
      'Enter a valid percentage (0-100)',
      name: 'invalidRoyaltyPercentError',
      desc: 'Error message when the royalty percentage is not within 0-100',
      args: [],
    );
  }

  /// `Submit for Moderation`
  String get submitForModerationButton {
    return Intl.message(
      'Submit for Moderation',
      name: 'submitForModerationButton',
      desc: 'Button text for submitting a franchise for moderation',
      args: [],
    );
  }

  /// `Franch Hub`
  String get franchHubTitle {
    return Intl.message(
      'Franch Hub',
      name: 'franchHubTitle',
      desc: 'Title for the application',
      args: [],
    );
  }

  /// `Search`
  String get searchHint {
    return Intl.message(
      'Search',
      name: 'searchHint',
      desc: 'Hint text for the search field',
      args: [],
    );
  }

  /// `Find Your Perfect Franchise`
  String get findPerfectFranchise {
    return Intl.message(
      'Find Your Perfect Franchise',
      name: 'findPerfectFranchise',
      desc: 'Text to attract users to search for franchises',
      args: [],
    );
  }

  /// `Explore top opportunities`
  String get exploreOpportunities {
    return Intl.message(
      'Explore top opportunities',
      name: 'exploreOpportunities',
      desc: 'Text to promote exploring franchises',
      args: [],
    );
  }

  /// `Explore Our Franchise`
  String get exploreFranchiseTitle {
    return Intl.message(
      'Explore Our Franchise',
      name: 'exploreFranchiseTitle',
      desc: 'Title for the explore franchise page',
      args: [],
    );
  }

  /// `No franchises available`
  String get noFranchisesAvailable {
    return Intl.message(
      'No franchises available',
      name: 'noFranchisesAvailable',
      desc: 'Message when there are no available franchises',
      args: [],
    );
  }

  /// `Franchise Overview`
  String get franchiseOverviewTitle {
    return Intl.message(
      'Franchise Overview',
      name: 'franchiseOverviewTitle',
      desc: 'Title for the franchise overview page',
      args: [],
    );
  }

  /// `Failed to start chat: {error}`
  String chatFailedError(Object error) {
    return Intl.message(
      'Failed to start chat: $error',
      name: 'chatFailedError',
      desc: 'Error message when starting a chat fails',
      args: [error],
    );
  }

  /// `Current user not found`
  String get currentUserNotFoundError {
    return Intl.message(
      'Current user not found',
      name: 'currentUserNotFoundError',
      desc: 'Error message when the current user is not found',
      args: [],
    );
  }

  /// `Franchise owner not found`
  String get franchiseOwnerNotFoundError {
    return Intl.message(
      'Franchise owner not found',
      name: 'franchiseOwnerNotFoundError',
      desc: 'Error message when the franchise owner is not found',
      args: [],
    );
  }

  /// `You are the franchise owner`
  String get youAreFranchiseOwnerError {
    return Intl.message(
      'You are the franchise owner',
      name: 'youAreFranchiseOwnerError',
      desc: 'Error message when the user is the franchise owner',
      args: [],
    );
  }

  /// `Respond Now`
  String get respondNowButton {
    return Intl.message(
      'Respond Now',
      name: 'respondNowButton',
      desc: 'Button text for responding immediately',
      args: [],
    );
  }

  /// `My Franchises`
  String get myFranchisesTitle {
    return Intl.message(
      'My Franchises',
      name: 'myFranchisesTitle',
      desc: 'Title for the user\'s franchises page',
      args: [],
    );
  }

  /// `You don't have any franchises yet.`
  String get noFranchisesYet {
    return Intl.message(
      'You don\'t have any franchises yet.',
      name: 'noFranchisesYet',
      desc: 'Message when the user has no franchises',
      args: [],
    );
  }

  /// `Moderation`
  String get moderationTitle {
    return Intl.message(
      'Moderation',
      name: 'moderationTitle',
      desc: 'Title for the moderation page',
      args: [],
    );
  }

  /// `No pending franchise requests`
  String get noPendingFranchiseRequests {
    return Intl.message(
      'No pending franchise requests',
      name: 'noPendingFranchiseRequests',
      desc: 'Message when there are no pending franchise requests',
      args: [],
    );
  }

  /// `No pending branch requests`
  String get noPendingBranchRequests {
    return Intl.message(
      'No pending branch requests',
      name: 'noPendingBranchRequests',
      desc: 'Message when there are no pending branch requests',
      args: [],
    );
  }

  /// `Branch moderation successful`
  String get branchModerationSuccess {
    return Intl.message(
      'Branch moderation successful',
      name: 'branchModerationSuccess',
      desc: 'Success message when branch moderation is successful',
      args: [],
    );
  }

  /// `Franchise moderation successful`
  String get franchiseModerationSuccess {
    return Intl.message(
      'Franchise moderation successful',
      name: 'franchiseModerationSuccess',
      desc: 'Success message when franchise moderation is successful',
      args: [],
    );
  }

  /// `Created At: {createdAt}`
  String createdAtLabel(Object createdAt) {
    return Intl.message(
      'Created At: $createdAt',
      name: 'createdAtLabel',
      desc: 'Label for displaying the creation date',
      args: [createdAt],
    );
  }

  /// `Status: {status}`
  String franchiseStatusLabel(Object status) {
    return Intl.message(
      'Status: $status',
      name: 'franchiseStatusLabel',
      desc: 'Label for displaying the franchise status',
      args: [status],
    );
  }

  /// `Owner ID: {ownerId}`
  String franchiseOwnerIdLabel(Object ownerId) {
    return Intl.message(
      'Owner ID: $ownerId',
      name: 'franchiseOwnerIdLabel',
      desc: 'Label for displaying the franchise owner ID',
      args: [ownerId],
    );
  }

  /// `Franchise`
  String get franchiseLabel {
    return Intl.message(
      'Franchise',
      name: 'franchiseLabel',
      desc: 'Label for displaying the franchise name',
      args: [],
    );
  }

  /// `Location`
  String get locationLabel {
    return Intl.message(
      'Location',
      name: 'locationLabel',
      desc: 'Label for displaying the location',
      args: [],
    );
  }

  /// `Working Hours`
  String get workingHoursLabel {
    return Intl.message(
      'Working Hours',
      name: 'workingHoursLabel',
      desc: 'Label for displaying the working hours',
      args: [],
    );
  }

  /// `Phone`
  String get phoneLabel {
    return Intl.message(
      'Phone',
      name: 'phoneLabel',
      desc: 'Label for displaying the phone number',
      args: [],
    );
  }

  /// `Status`
  String get branchStatusLabel {
    return Intl.message(
      'Status',
      name: 'branchStatusLabel',
      desc: 'Label for displaying the branch status',
      args: [],
    );
  }

  /// `Requested by`
  String get branchRequestedByLabel {
    return Intl.message(
      'Requested by',
      name: 'branchRequestedByLabel',
      desc: 'Label for displaying the requester ID of the branch',
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
