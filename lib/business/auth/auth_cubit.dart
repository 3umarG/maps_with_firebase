import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maps_tutorial/core/enums/firebase_error.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? verificationId;

  Future<void> submitPhone(String phone) async {
    emit(AuthLoadingState());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phone',
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      timeout: const Duration(seconds: 6),
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  /// This function called in some Android Devices
  /// that have the auto check the messages , then get the received code
  /// and make Credential by itself to use it to sign in
  void verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    debugPrint("verificationCompleted()");
    await signIn(phoneAuthCredential);
  }

  /// Any exception the firebase throw will handle by this function
  /// ex : the phone number is not correct.
  void verificationFailed(FirebaseAuthException error) {
    debugPrint("verificationFailed() : ${error.message!}");
    debugPrint("verificationFailed() : ${error.code}");
    final exceptionType = getExceptionTypeFromMessage(error.code.trim());
    debugPrint(exceptionType.errorType.name);
    emit(AuthErrorState(exceptionType));
  }

  /// This method is used when the code is received
  /// that means your phone is correct , and you received code for OTP
  void codeSent(String verificationId, int? forceResendingToken) {
    debugPrint("Code Sent");
    this.verificationId = verificationId;
    emit(AuthPhoneNumberSubmittedState());
  }

  ///On Android devices which support automatic SMS code resolution,
  /// this handler will be called if the device has not automatically resolved an SMS message within a certain timeframe.
  /// Once the timeframe has passed,
  /// the device will no longer attempt to resolve any incoming messages.
  void codeAutoRetrievalTimeout(String verificationId) {
    debugPrint("codeAutoRetrievalTimeout()");
    emit(AuthErrorState(
        FirebaseExceptionType(FirebaseErrorTypes.timeOut, "Time Out !!!")));
  }

  Future<void> signIn(PhoneAuthCredential phoneAuthCredential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      emit(AuthOTPVerifiedState());
    } on FirebaseException catch (e) {
      final excType = getExceptionTypeFromMessage(e.message!);
      emit(AuthErrorState(excType));
    }
  }

  /// This function called when you submit the OTP manually
  /// if the Android device doesn't trigger the received OTP
  Future<void> submitOTP(String otpCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: otpCode);

      await signIn(credential);
    } on FirebaseException catch (e) {
      final excType = getExceptionTypeFromMessage(e.message!);
      emit(AuthErrorState(excType));
    }
  }

  Future<void> logOut() async {
    emit(AuthLoadingState());
    await FirebaseAuth.instance.signOut();
    emit(AuthLoggedOutState());
  }

  User getLoggedUser() => FirebaseAuth.instance.currentUser!;
}
