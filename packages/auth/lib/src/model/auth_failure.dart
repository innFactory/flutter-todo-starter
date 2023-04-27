/// The base class for all auth failures.
abstract class AuthFailure {
  const AuthFailure();
}

/// The user has entered invalid credentials.
class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure();
}
