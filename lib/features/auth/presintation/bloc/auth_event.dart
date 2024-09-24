abstract class AuthEvent {}

class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLogInEvent({required this.email, required this.password});
}

class AuthLogOutEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterEvent({required this.email, required this.password});
}
