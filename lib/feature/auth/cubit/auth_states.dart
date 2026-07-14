abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  final String token;
  final String? message;
  AuthSuccessState(this.message, {required this.token});
}

class AuthFailureState extends AuthStates {
  final String errorMessage;
  AuthFailureState({required this.errorMessage});
}
class AuthLoggedOutState extends AuthStates {}
