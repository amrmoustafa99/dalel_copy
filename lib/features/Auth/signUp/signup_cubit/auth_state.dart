abstract class AuthState {}

class AuthIniatlState extends AuthState {}

class AuthILoadingState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailuerState extends AuthState {
  final String error;

  AuthFailuerState({required this.error});
}

class AuthTermsAndConditionState extends AuthState {}

class AuthChangeVisibilityState extends AuthState {}

final class SigninLoadingState extends AuthState {}

final class SigninSuccessState extends AuthState {}

final class SigninFailureState extends AuthState {
  final String errMessage;

  SigninFailureState({required this.errMessage});
}
