// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(error) => "Authentication check error: ${error}";

  static String m1(location, workingHours, phone) =>
      "Address: ${location}\nWorking hours: ${workingHours}\nPhone: ${phone}";

  static String m2(branchName) => "Branch request approved: ${branchName}";

  static String m3(branchName) =>
      "Are you sure you want to delete \"${branchName}\"?";

  static String m4(message) => "Error: ${message}";

  static String m5(error) => "Failed to add branch: ${error}";

  static String m6(error) => "Failed to create pending branch: ${error}";

  static String m7(error) => "Failed to delete branch: ${error}";

  static String m8(error) => "Failed to edit branch: ${error}";

  static String m9(error) => "Failed to load branches: ${error}";

  static String m10(error) => "Failed to moderate branch: ${error}";

  static String m11(error) => "Failed to fetch user: ${error}";

  static String m12(franchiseName) => "Franchise branches: ${franchiseName}";

  static String m13(error) => "Google login error: ${error}";

  static String m14(error) => "Login error: ${error}";

  static String m15(error) => "Logout error: ${error}";

  static String m16(branchName, requesterId) =>
      "New branch request: ${branchName} by ${requesterId}";

  static String m17(error) => "Sign up error: ${error}";

  static String m18(status) => "Status: ${status}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountExistsDifferentCredential": MessageLookupByLibrary.simpleMessage(
      "Account exists with different credentials.",
    ),
    "addBranchButton": MessageLookupByLibrary.simpleMessage("Add branch"),
    "addBranchTitle": MessageLookupByLibrary.simpleMessage("Add branch"),
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account? ",
    ),
    "authCheckError": m0,
    "backButton": MessageLookupByLibrary.simpleMessage("Back"),
    "branchAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Branch added successfully",
    ),
    "branchInfo": m1,
    "branchNameLabel": MessageLookupByLibrary.simpleMessage("Branch name"),
    "branchNotFoundError": MessageLookupByLibrary.simpleMessage(
      "The branch you are trying to edit no longer exists.",
    ),
    "branchRequestApproved": m2,
    "branchRequestSentMessage": MessageLookupByLibrary.simpleMessage(
      "Request sent for moderation",
    ),
    "branchUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Branch updated successfully",
    ),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
    "createBranchRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Create branch request",
    ),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Create a new account",
    ),
    "deleteBranchDialogContent": m3,
    "deleteBranchDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Delete branch?",
    ),
    "deleteButton": MessageLookupByLibrary.simpleMessage("Delete"),
    "editBranchTitle": MessageLookupByLibrary.simpleMessage("Edit branch"),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "An account already exists for that email.",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailNotFound": MessageLookupByLibrary.simpleMessage(
      "Email is not found, please create an account.",
    ),
    "enterLocationError": MessageLookupByLibrary.simpleMessage(
      "Please enter an address",
    ),
    "enterNameError": MessageLookupByLibrary.simpleMessage(
      "Please enter a name",
    ),
    "enterPhoneError": MessageLookupByLibrary.simpleMessage(
      "Please enter a phone number",
    ),
    "enterRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Please enter royalty",
    ),
    "enterWorkingHoursError": MessageLookupByLibrary.simpleMessage(
      "Please enter working hours",
    ),
    "errorMessage": m4,
    "failedToAddBranch": m5,
    "failedToCreatePendingBranch": m6,
    "failedToDeleteBranch": m7,
    "failedToEditBranch": m8,
    "failedToLoadBranches": m9,
    "failedToModerateBranch": m10,
    "fetchUserError": m11,
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password? "),
    "franchiseBranchesTitle": m12,
    "franchiseDataError": MessageLookupByLibrary.simpleMessage(
      "Error: Franchise data not provided",
    ),
    "googleLoginError": m13,
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "The credential received is malformed or has expired.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Email is not valid or badly formatted.",
    ),
    "invalidRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid number",
    ),
    "invalidVerificationCode": MessageLookupByLibrary.simpleMessage(
      "The credential verification code received is invalid.",
    ),
    "invalidVerificationId": MessageLookupByLibrary.simpleMessage(
      "The credential verification ID received is invalid.",
    ),
    "locationLabel": MessageLookupByLibrary.simpleMessage("Address"),
    "logInLink": MessageLookupByLibrary.simpleMessage("LogIn!"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "loginError": m14,
    "logoutError": m15,
    "myBranchesTitle": MessageLookupByLibrary.simpleMessage("My branches"),
    "newBranchRequest": m16,
    "noBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "This franchise has no branches yet.",
    ),
    "noUserBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any branches yet.",
    ),
    "notRegisteredUser": MessageLookupByLibrary.simpleMessage(
      "Not a registered user? ",
    ),
    "operationNotAllowed": MessageLookupByLibrary.simpleMessage(
      "Operation is not allowed. Please contact support.",
    ),
    "operationSuccessMessage": MessageLookupByLibrary.simpleMessage(
      "Operation completed successfully",
    ),
    "orContinueWith": MessageLookupByLibrary.simpleMessage("Or Continue With"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "pendingRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Pending requests",
    ),
    "phoneLabel": MessageLookupByLibrary.simpleMessage("Phone"),
    "registerNowLink": MessageLookupByLibrary.simpleMessage("Register Now!"),
    "registrationButton": MessageLookupByLibrary.simpleMessage("Registration"),
    "reportsTab": MessageLookupByLibrary.simpleMessage("Reports"),
    "royaltyPercentLabel": MessageLookupByLibrary.simpleMessage("Royalty (%)"),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage("Save changes"),
    "sendRequestButton": MessageLookupByLibrary.simpleMessage("Send request"),
    "signInAccount": MessageLookupByLibrary.simpleMessage(
      "Sing in your account",
    ),
    "signUpError": m17,
    "statusLabel": m18,
    "transactionsTab": MessageLookupByLibrary.simpleMessage("Transactions"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unknown exception occurred.",
    ),
    "userCreationFailed": MessageLookupByLibrary.simpleMessage(
      "User creation failed",
    ),
    "userDisabled": MessageLookupByLibrary.simpleMessage(
      "This user has been disabled. Please contact support for help.",
    ),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
    "usernameLabel": MessageLookupByLibrary.simpleMessage("Username"),
    "waitingForData": MessageLookupByLibrary.simpleMessage(
      "Waiting for data...",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter a stronger password.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
    "workingHoursLabel": MessageLookupByLibrary.simpleMessage(
      "Working hours (e.g., 9:00-18:00)",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Incorrect password, please try again.",
    ),
  };
}
