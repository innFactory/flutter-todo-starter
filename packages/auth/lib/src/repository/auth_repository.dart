import 'package:auth/auth.dart';
import 'package:core/core.dart';

/// Facade for all authentication related operations.
abstract interface class AuthRepository {
  /// Try to sign in with credentials. If the operation is successful, the user
  /// stream will emit a new value.
  @useResult
  TaskEither<Failure, Unit> signWithCredentials(
    String email,
    String password,
  );

  /// Sign out. Deletes the current user credentials.
  @useResult
  TaskEither<Failure, Unit> signOut();

  /// Subscribe to updates of the current user. Will emit `None` if there is no
  /// user signed in. Will emit `Some` with the current user if there is a user
  /// signed in.
  ///
  /// The stream will emit the first value after loading and verifying the
  /// credentials.
  Stream<Option<AuthUser>> watchAuthUser();

  @useResult
  TaskEither<Failure, bool> isUserSignedIn();
}
