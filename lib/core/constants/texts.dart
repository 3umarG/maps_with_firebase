abstract class AppTexts {
  static const loginScreenRoute = '/login';
  static const otpScreenRoute = '/otp';
  static const homeScreenRoute = '/home';
}

abstract class ExceptionMessages {
  static const String missingClient = "This request is missing a valid app identifier";
  static const String invalidPhoneNumber =
      "The provided phone number is invalid.";
  static const String quotaExceeded =
      "The SMS quota for this project has been exceeded.";
  static const String appNotAuthorized =
      "This app is not authorized to use Firebase Authentication with phone number verification.";
  static const String invalidVerificationCode =
      "The verification code entered is invalid.";
  static const String sessionExpired =
      "The phone verification session has expired. Please try again.";
  static const String unknownError =
      "An unknown error occurred while verifying the phone number.";
  static const String credentialAlreadyInUse =
      "The provided credential is already associated with a user account.";
  static const String invalidVerificationId =
      "The verification ID used to create the phone auth credential is invalid.";
  static const String sessionAuthExpired =
      "The phone auth session has expired. Please retry the operation.";
  static const String missingVerificationCode =
      "The phone auth credential was created with an empty verification code.";
  static const String invalidCredential =
      "The credential is malformed or has expired.";
  static const String userDisabled =
      "The user corresponding to the given credential has been disabled.";
  static const String userNotFound =
      "There is no user corresponding to the given credential.";
  static const String genericSignInError =
      "An error occurred during the sign-in process.";
}

abstract class ExceptionCodes {
  // FirebaseAuthException
  static const missingClient = "missing-client-identifier";
  static const String quotaExceeded = "quota-exceeded";
  static const String appNotAuthorized = "app-not-authorized";
  static const String invalidPhoneNumber = "invalid-phone-number";
  static const String invalidVerificationCode = "invalid-verification-code";
  static const String credentialAlreadyInUse = "credential-already-in-use";
  static const String invalidVerificationId = "invalid-verification-id";
  static const String sessionExpired = "session-expired";
  static const String missingVerificationCode = "missing-verification-code";
  static const String invalidCredential = "invalid-credential";
  static const String userDisabled = "user-disabled";
  static const String userNotFound = "user-not-found";

  // FirebaseException
  static const String signInError = "sign-in-error";

  // Additional Exceptions
  static const String accountExistsWithDifferentCredential =
      "account-exists-with-different-credential";
  static const String emailAlreadyInUse = "email-already-in-use";
  static const String operationNotAllowed = "operation-not-allowed";
  static const String wrongPassword = "wrong-password";
}
