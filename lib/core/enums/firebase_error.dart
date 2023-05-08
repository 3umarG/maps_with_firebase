import 'package:flutter/material.dart';
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
  missingClient,
}

class FirebaseExceptionType {
  final FirebaseErrorTypes errorType;
  final String message;

  FirebaseExceptionType(this.errorType, this.message);
}

FirebaseExceptionType getExceptionTypeFromMessage(String code) {
  debugPrint(code);
  switch (code) {
    case ExceptionCodes.missingClient :
      return FirebaseExceptionType(FirebaseErrorTypes.missingClient, exceptionMessages[code] ??" Missing Client");
    case ExceptionCodes.invalidPhoneNumber:
      debugPrint("FOUND");
      return FirebaseExceptionType(FirebaseErrorTypes.invalidPhoneNumber,
          exceptionMessages[code]??"Unknown Exception !!");
    case ExceptionCodes.quotaExceeded:
      return FirebaseExceptionType(FirebaseErrorTypes.quotaExceeded,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.appNotAuthorized:
      return FirebaseExceptionType(FirebaseErrorTypes.appNotAuthorized,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.invalidVerificationCode:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidVerificationCode,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.sessionExpired:
      return FirebaseExceptionType(FirebaseErrorTypes.sessionExpired,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.credentialAlreadyInUse:
      return FirebaseExceptionType(FirebaseErrorTypes.credentialAlreadyInUse,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.invalidVerificationId:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidVerificationId,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.missingVerificationCode:
      return FirebaseExceptionType(FirebaseErrorTypes.missingVerificationCode,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.invalidCredential:
      return FirebaseExceptionType(FirebaseErrorTypes.invalidCredential,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.userDisabled:
      return FirebaseExceptionType(FirebaseErrorTypes.userDisabled,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    case ExceptionCodes.userNotFound:
      return FirebaseExceptionType(FirebaseErrorTypes.userNotFound,
          exceptionMessages[code] ?? "Unknown Exception Message !! ");
    default:
      return FirebaseExceptionType(FirebaseErrorTypes.unknownError, code);
  }
}

Map<String, String> exceptionMessages = {
  // FirebaseAuthException
  ExceptionCodes.invalidPhoneNumber : ExceptionMessages.invalidPhoneNumber,
  ExceptionCodes.missingClient : ExceptionMessages.missingClient,
  ExceptionCodes.invalidVerificationCode:
      ExceptionMessages.invalidVerificationCode,
  ExceptionCodes.credentialAlreadyInUse:
      ExceptionMessages.credentialAlreadyInUse,
  ExceptionCodes.invalidVerificationId: ExceptionMessages.invalidVerificationId,
  ExceptionCodes.sessionExpired: ExceptionMessages.sessionExpired,
  ExceptionCodes.missingVerificationCode:
      ExceptionMessages.missingVerificationCode,
  ExceptionCodes.invalidCredential: ExceptionMessages.invalidCredential,
  ExceptionCodes.userDisabled: ExceptionMessages.userDisabled,
  ExceptionCodes.userNotFound: ExceptionMessages.userNotFound,
  ExceptionCodes.quotaExceeded : ExceptionMessages.quotaExceeded,

  // FirebaseException
  ExceptionCodes.signInError: ExceptionMessages.genericSignInError,
};
