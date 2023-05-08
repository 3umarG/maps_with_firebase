import 'package:maps_tutorial/core/constants/texts.dart';

enum FirebaseErrorTypes {

  /// Timeout
  timeOut,

  /// This exception is thrown when the phone number provided is not valid.
  invalidPhoneNumber,

  /// The SMS quota for this project has been exceeded.
  /// لقد تجاوزت الحد المسموح به من رسائل التحقق
  quotaExceeded,

  /// This app is not authorized to use Firebase Authentication with phone number verification.
  appNotAuthorized,

  /// This exception is thrown when the verification code entered is not valid.
  /// انتهت صلاحية كود ال otp
  invalidVerificationCode,

  /// This exception is thrown when the phone verification session has expired,
  /// typically after a certain timeout period.
  sessionExpired,

  /// Another exceptions without any cause
  unknownError,


  // New enum types
  credentialAlreadyInUse,
  invalidVerificationId,
  sessionAuthExpired,
  missingVerificationCode,
  invalidCredential,
  userDisabled,
  userNotFound,
  genericSignInError,
}

class FirebaseExceptionType {
  final FirebaseErrorTypes errorType;
  final String message;

  FirebaseExceptionType(this.errorType, this.message);
}

FirebaseExceptionType getExceptionTypeFromMessage(String message) {
  switch (message) {
    case ExceptionMessages.invalidPhoneNumber:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidPhoneNumber, message);
    case ExceptionMessages.quotaExceeded:
      return FirebaseExceptionType(FirebaseErrorTypes.quotaExceeded, message);
    case ExceptionMessages.appNotAuthorized:
      return FirebaseExceptionType(FirebaseErrorTypes.appNotAuthorized, message);
    case ExceptionMessages.invalidVerificationCode:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidVerificationCode, message);
    case ExceptionMessages.sessionExpired:
      return FirebaseExceptionType(FirebaseErrorTypes.sessionExpired, message);
    case ExceptionMessages.credentialAlreadyInUse:
      return FirebaseExceptionType(FirebaseErrorTypes.credentialAlreadyInUse, message);
    case ExceptionMessages.invalidVerificationId:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidVerificationId, message);
    case ExceptionMessages.sessionAuthExpired:
      return FirebaseExceptionType(FirebaseErrorTypes.sessionExpired, message);
    case ExceptionMessages.missingVerificationCode:
      return FirebaseExceptionType(FirebaseErrorTypes.missingVerificationCode, message);
    case ExceptionMessages.invalidCredential:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidCredential, message);
    case ExceptionMessages.userDisabled:
      return FirebaseExceptionType(FirebaseErrorTypes.userDisabled, message);
    case ExceptionMessages.userNotFound:
      return FirebaseExceptionType(FirebaseErrorTypes.userNotFound, message);
    case ExceptionMessages.genericSignInError:
      return FirebaseExceptionType(FirebaseErrorTypes.genericSignInError, message);
    default:
      return FirebaseExceptionType(FirebaseErrorTypes.unknownError, message);
  }
}
