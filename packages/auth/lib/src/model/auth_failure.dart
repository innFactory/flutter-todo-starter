import 'package:core/core.dart';

/// The base class for all auth failures.
sealed class AuthFailure extends Failure {
  const AuthFailure(super.key);
}

/// The user has entered invalid credentials.
final class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure() : super('invalidCredentialsFailure');
}
