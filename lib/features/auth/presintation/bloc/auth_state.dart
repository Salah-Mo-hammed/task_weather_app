abstract class AuthState {
    final String? id;
  const AuthState({this.id});
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateSuccess extends AuthState {

  final String? userId;
  const AuthStateSuccess(this.userId):super(id:userId);
}

class AuthStateException extends AuthState {
  const AuthStateException();
}

class AuthStateLogOut extends AuthState {
  const AuthStateLogOut();
}
