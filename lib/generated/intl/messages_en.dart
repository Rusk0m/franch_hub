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

  static String m3(requesterId) => "Requested by: ${requesterId}";

  static String m4(status) => "Status: ${status}";

  static String m5(message) => "Error: ${message}";

  static String m6(error) => "Failed to start chat: ${error}";

  static String m7(userName) => "Chat with ${userName}";

  static String m8(city) => "City: ${city}";

  static String m9(createdAt) => "Created At: ${createdAt}";

  static String m10(error) => "Data error: ${error}";

  static String m11(branchName) =>
      "Are you sure you want to delete \"${branchName}\"?";

  static String m12(description) => "Description: ${description}";

  static String m13(message) => "Error: ${message}";

  static String m14(error) => "Failed to add branch: ${error}";

  static String m15(error) => "Failed to create pending branch: ${error}";

  static String m16(error) => "Failed to delete branch: ${error}";

  static String m17(error) => "Failed to edit branch: ${error}";

  static String m18(error) => "Failed to load branches: ${error}";

  static String m19(error) => "Failed to moderate branch: ${error}";

  static String m20(error) => "Failed to fetch user: ${error}";

  static String m21(franchiseName) => "Franchise branches: ${franchiseName}";

  static String m22(franchiseName) => "Franchise: ${franchiseName}";

  static String m23(ownerId) => "Owner ID: ${ownerId}";

  static String m24(status) => "Status: ${status}";

  static String m25(error) => "Google login error: ${error}";

  static String m26(month, year) => "Indicators ${month}/${year}";

  static String m27(industry) => "Industry: ${industry}";

  static String m28(location) => "Location: ${location}";

  static String m29(error) => "Login error: ${error}";

  static String m30(error) => "Logout error: ${error}";

  static String m31(branchName, requesterId) =>
      "New branch request: ${branchName} by ${requesterId}";

  static String m32(phone) => "Phone: ${phone}";

  static String m33(month, year) => "Report details ${month}/${year}";

  static String m34(error) => "Sign up error: ${error}";

  static String m35(status) => "Status: ${status}";

  static String m36(workingHours) => "Working Hours: ${workingHours}";

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
    "autonomyRatioLabel": MessageLookupByLibrary.simpleMessage(
      "Autonomy ratio",
    ),
    "backButton": MessageLookupByLibrary.simpleMessage("Back"),
    "branchAddedMessage": MessageLookupByLibrary.simpleMessage(
      "Branch added successfully",
    ),
    "branchIndicatorsTitle": MessageLookupByLibrary.simpleMessage(
      "Branch indicators",
    ),
    "branchInfo": m1,
    "branchModerationSuccess": MessageLookupByLibrary.simpleMessage(
      "Branch moderation successful",
    ),
    "branchNameLabel": MessageLookupByLibrary.simpleMessage("Branch name"),
    "branchNotFoundError": MessageLookupByLibrary.simpleMessage(
      "The branch you are trying to edit no longer exists.",
    ),
    "branchReportsTitle": MessageLookupByLibrary.simpleMessage(
      "Branch reports",
    ),
    "branchRequestApproved": m2,
    "branchRequestSentMessage": MessageLookupByLibrary.simpleMessage(
      "Request sent for moderation",
    ),
    "branchRequestedByLabel": m3,
    "branchStatusLabel": m4,
    "branchUpdatedMessage": MessageLookupByLibrary.simpleMessage(
      "Branch updated successfully",
    ),
    "breakevenPointLabel": MessageLookupByLibrary.simpleMessage(
      "Breakeven point",
    ),
    "cancelButton": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cashInflowLabel": MessageLookupByLibrary.simpleMessage("Cash inflow"),
    "cashOutflowLabel": MessageLookupByLibrary.simpleMessage("Cash outflow"),
    "chatError": m5,
    "chatFailedError": m6,
    "chatPageTitle": m7,
    "cityLabel": m8,
    "cityRequiredError": MessageLookupByLibrary.simpleMessage(
      "City is required",
    ),
    "closeButton": MessageLookupByLibrary.simpleMessage("Close"),
    "createBranchRequestTitle": MessageLookupByLibrary.simpleMessage(
      "Create branch request",
    ),
    "createFranchiseTitle": MessageLookupByLibrary.simpleMessage(
      "Create Franchise",
    ),
    "createNewAccount": MessageLookupByLibrary.simpleMessage(
      "Create a new account",
    ),
    "createdAtLabel": m9,
    "currentRatioLabel": MessageLookupByLibrary.simpleMessage("Current ratio"),
    "currentUserNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Current user not found",
    ),
    "dataError": m10,
    "debtLoadLabel": MessageLookupByLibrary.simpleMessage("Debt load"),
    "deleteBranchDialogContent": m11,
    "deleteBranchDialogTitle": MessageLookupByLibrary.simpleMessage(
      "Delete branch?",
    ),
    "deleteButton": MessageLookupByLibrary.simpleMessage("Delete"),
    "descriptionLabel": m12,
    "descriptionRequiredError": MessageLookupByLibrary.simpleMessage(
      "Description is required",
    ),
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
    "errorMessage": m13,
    "exploreFranchiseTitle": MessageLookupByLibrary.simpleMessage(
      "Explore Our Franchise",
    ),
    "exploreOpportunities": MessageLookupByLibrary.simpleMessage(
      "Explore top opportunities",
    ),
    "failedToAddBranch": m14,
    "failedToCreatePendingBranch": m15,
    "failedToDeleteBranch": m16,
    "failedToEditBranch": m17,
    "failedToLoadBranches": m18,
    "failedToModerateBranch": m19,
    "fetchUserError": m20,
    "findPerfectFranchise": MessageLookupByLibrary.simpleMessage(
      "Find Your Perfect Franchise",
    ),
    "fixedCostsLabel": MessageLookupByLibrary.simpleMessage("Fixed costs"),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot password? "),
    "franchHubTitle": MessageLookupByLibrary.simpleMessage("Franch Hub"),
    "franchiseBranchesTitle": m21,
    "franchiseDataError": MessageLookupByLibrary.simpleMessage(
      "Error: Franchise data not provided",
    ),
    "franchiseLabel": m22,
    "franchiseModerationSuccess": MessageLookupByLibrary.simpleMessage(
      "Franchise moderation successful",
    ),
    "franchiseOverviewTitle": MessageLookupByLibrary.simpleMessage(
      "Franchise Overview",
    ),
    "franchiseOwnerIdLabel": m23,
    "franchiseOwnerNotFoundError": MessageLookupByLibrary.simpleMessage(
      "Franchise owner not found",
    ),
    "franchiseSentForModeration": MessageLookupByLibrary.simpleMessage(
      "Franchise sent for moderation",
    ),
    "franchiseStatusLabel": m24,
    "googleLoginError": m25,
    "indicatorsDetailsTitle": m26,
    "industryLabel": m27,
    "industryRequiredError": MessageLookupByLibrary.simpleMessage(
      "Industry is required",
    ),
    "initialInvestmentLabel": MessageLookupByLibrary.simpleMessage(
      "Initial investment",
    ),
    "invalidCredential": MessageLookupByLibrary.simpleMessage(
      "The credential received is malformed or has expired.",
    ),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Email is not valid or badly formatted.",
    ),
    "invalidNumberError": MessageLookupByLibrary.simpleMessage(
      "Enter a valid number",
    ),
    "invalidNumberFormatError": MessageLookupByLibrary.simpleMessage(
      "Invalid number format",
    ),
    "invalidRoyaltyError": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid number",
    ),
    "invalidRoyaltyPercentError": MessageLookupByLibrary.simpleMessage(
      "Enter a valid percentage (0-100)",
    ),
    "invalidStartupCostError": MessageLookupByLibrary.simpleMessage(
      "Enter a valid number",
    ),
    "invalidVerificationCode": MessageLookupByLibrary.simpleMessage(
      "The credential verification code received is invalid.",
    ),
    "invalidVerificationId": MessageLookupByLibrary.simpleMessage(
      "The credential verification ID received is invalid.",
    ),
    "inventoryLabel": MessageLookupByLibrary.simpleMessage("Inventory"),
    "liabilitiesLabel": MessageLookupByLibrary.simpleMessage("Liabilities"),
    "locationLabel": m28,
    "logInLink": MessageLookupByLibrary.simpleMessage("LogIn!"),
    "loginButton": MessageLookupByLibrary.simpleMessage("Login"),
    "loginError": m29,
    "logoutError": m30,
    "moderationTitle": MessageLookupByLibrary.simpleMessage("Moderation"),
    "myBranchesTitle": MessageLookupByLibrary.simpleMessage("My branches"),
    "myFranchisesTitle": MessageLookupByLibrary.simpleMessage("My Franchises"),
    "nameLabel": MessageLookupByLibrary.simpleMessage("Name"),
    "nameRequiredError": MessageLookupByLibrary.simpleMessage(
      "Name is required",
    ),
    "netCashFlowLabel": MessageLookupByLibrary.simpleMessage("Net cash flow"),
    "netProfitLabel": MessageLookupByLibrary.simpleMessage("Net profit"),
    "newBranchRequest": m31,
    "newFinancialReportTitle": MessageLookupByLibrary.simpleMessage(
      "New financial report",
    ),
    "noBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "This franchise has no branches yet.",
    ),
    "noFranchisesAvailable": MessageLookupByLibrary.simpleMessage(
      "No franchises available",
    ),
    "noFranchisesYet": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any franchises yet.",
    ),
    "noIndicatorsData": MessageLookupByLibrary.simpleMessage(
      "No indicators data",
    ),
    "noMessagesYet": MessageLookupByLibrary.simpleMessage("No messages yet"),
    "noPendingBranchRequests": MessageLookupByLibrary.simpleMessage(
      "No pending branch requests",
    ),
    "noPendingFranchiseRequests": MessageLookupByLibrary.simpleMessage(
      "No pending franchise requests",
    ),
    "noReportsAvailable": MessageLookupByLibrary.simpleMessage(
      "No reports available",
    ),
    "noUserBranchesMessage": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any branches yet.",
    ),
    "noUsersFound": MessageLookupByLibrary.simpleMessage("No users found"),
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
    "ownCapitalLabel": MessageLookupByLibrary.simpleMessage("Own capital"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "pendingRequestsTitle": MessageLookupByLibrary.simpleMessage(
      "Pending requests",
    ),
    "phoneLabel": m32,
    "pleaseLogIn": MessageLookupByLibrary.simpleMessage("Please log in"),
    "pleaseLogInToViewUsers": MessageLookupByLibrary.simpleMessage(
      "Please log in to view users",
    ),
    "quickRatioLabel": MessageLookupByLibrary.simpleMessage("Quick ratio"),
    "registerNowLink": MessageLookupByLibrary.simpleMessage("Register Now!"),
    "registrationButton": MessageLookupByLibrary.simpleMessage("Registration"),
    "reportDetailsTitle": m33,
    "reportSubmittedSuccess": MessageLookupByLibrary.simpleMessage(
      "Report submitted successfully",
    ),
    "reportsTab": MessageLookupByLibrary.simpleMessage("Reports"),
    "requiredFieldError": MessageLookupByLibrary.simpleMessage(
      "Required field",
    ),
    "respondNowButton": MessageLookupByLibrary.simpleMessage("Respond Now"),
    "returnOnAssetsLabel": MessageLookupByLibrary.simpleMessage(
      "Return on assets",
    ),
    "returnOnSalesLabel": MessageLookupByLibrary.simpleMessage(
      "Return on sales",
    ),
    "revenueLabel": MessageLookupByLibrary.simpleMessage("Revenue"),
    "roiByMonths": MessageLookupByLibrary.simpleMessage("ROI by months"),
    "roiLabel": MessageLookupByLibrary.simpleMessage(
      "Return on Investment (ROI)",
    ),
    "royaltyPaymentLabel": MessageLookupByLibrary.simpleMessage(
      "Royalty payment",
    ),
    "royaltyPercentLabel": MessageLookupByLibrary.simpleMessage("Royalty (%)"),
    "royaltyPercentLabelFranchise": MessageLookupByLibrary.simpleMessage(
      "Royalty Percent (%)",
    ),
    "royaltyPercentLabelReport": MessageLookupByLibrary.simpleMessage(
      "Royalty (%)",
    ),
    "royaltyPercentRequiredError": MessageLookupByLibrary.simpleMessage(
      "Royalty percent is required",
    ),
    "saveChangesButton": MessageLookupByLibrary.simpleMessage("Save changes"),
    "searchHint": MessageLookupByLibrary.simpleMessage("Search"),
    "selectUserToChatTitle": MessageLookupByLibrary.simpleMessage(
      "Select User to Chat",
    ),
    "sendRequestButton": MessageLookupByLibrary.simpleMessage("Send request"),
    "signInAccount": MessageLookupByLibrary.simpleMessage(
      "Sing in your account",
    ),
    "signUpError": m34,
    "startupCostLabel": MessageLookupByLibrary.simpleMessage(
      "Startup Cost (RUB)",
    ),
    "startupCostRequiredError": MessageLookupByLibrary.simpleMessage(
      "Startup cost is required",
    ),
    "statusLabel": m35,
    "submitForModerationButton": MessageLookupByLibrary.simpleMessage(
      "Submit for Moderation",
    ),
    "submitReportButton": MessageLookupByLibrary.simpleMessage("Submit report"),
    "totalAssetsLabel": MessageLookupByLibrary.simpleMessage("Total assets"),
    "transactionsTab": MessageLookupByLibrary.simpleMessage("Transactions"),
    "typeMessageHint": MessageLookupByLibrary.simpleMessage(
      "Type a message...",
    ),
    "unitPriceLabel": MessageLookupByLibrary.simpleMessage("Unit price"),
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
    "variableCostsLabel": MessageLookupByLibrary.simpleMessage(
      "Variable costs",
    ),
    "waitingForData": MessageLookupByLibrary.simpleMessage(
      "Waiting for data...",
    ),
    "weakPassword": MessageLookupByLibrary.simpleMessage(
      "Please enter a stronger password.",
    ),
    "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back!"),
    "workingHoursLabel": m36,
    "wrongPassword": MessageLookupByLibrary.simpleMessage(
      "Incorrect password, please try again.",
    ),
    "youAreFranchiseOwnerError": MessageLookupByLibrary.simpleMessage(
      "You are the franchise owner",
    ),
  };
}
