import 'package:auth/src/model/auth_user.dart';
import 'package:core/core.dart';

/// Facade for all authentication related operations.
abstract class AuthRepository {
  /// Try to sign in with credentials. If the operation is successful, the user
  /// stream will emit a new value.
  TaskEither<AuthFailure, Unit> signWithCredentials(
    String email,
    String password,
  );

  /// Sign out. Deletes the current user credentials.
  Task<Unit> signOut();

  /// Subscribe to updates of the current user. Will emit `None` if there is no
  /// user signed in. Will emit `Some` with the current user if there is a user
  /// signed in.
  ///
  /// The stream will emit the first value after loading and verifying the
  /// credentials.
  Stream<Option<AuthUser>> watchAuthUser();
}
