part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthOTPVerifiedState extends AuthState {}

class AuthErrorState extends AuthState {
  final FirebaseExceptionType exception;
  AuthErrorState(this.exception);
}

class AuthPhoneNumberSubmittedState extends AuthState {}

class AuthLoggedOutState extends AuthState{}
