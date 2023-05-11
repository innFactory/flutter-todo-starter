import 'dart:async';

import 'package:auth/src/model/auth_user.dart';
import 'package:auth/src/repository/auth_repository.dart';
import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef SharedPreferencesBuilder = FutureOr<SharedPreferences> Function();

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required SharedPreferencesBuilder sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @visibleForTesting
  static const prefKeyPrefix = 'auth_';
  @visibleForTesting
  static const prefKeySignedIn = '${prefKeyPrefix}signed_in';

  final SharedPreferencesBuilder _sharedPreferences;
  final StreamController<Option<AuthUser>> _authUserStreamController =
      StreamController<Option<AuthUser>>.broadcast();

  @override
  Task<Unit> signOut() {
    return Task(() async {
      final prefs = await _sharedPreferences();
      await prefs.setBool(prefKeySignedIn, false);
      return unit;
    }).chainFirst((_) => _emitAuthUser(none()));
  }

  @override
  TaskEither<AuthFailure, Unit> signWithCredentials(
    String email,
    String password,
  ) {
    return TaskEither<AuthFailure, Option<AuthUser>>(() async {
      if (email == 'email' && password == 'password') {
        final prefs = await _sharedPreferences();
        await prefs.setBool(prefKeySignedIn, true);

        final user = Some(
          AuthUser(
            id: const AuthUserId('id'),
            email: email,
          ),
        );

        return Right(user);
      } else {
        return const Left(AuthFailure.invalidCredentials);
      }
    }).flatMap((user) => TaskEither.fromTask(_emitAuthUser(user)));
  }

  @override
  Stream<Option<AuthUser>> watchAuthUser() async* {
    final prefs = await _sharedPreferences();

    final isAuthenticated = prefs.getBool(prefKeySignedIn);

    if (isAuthenticated == true) {
      yield const Some(
        AuthUser(
          id: AuthUserId('id'),
          email: 'email',
        ),
      );
    } else {
      yield none();
    }

    yield* _authUserStreamController.stream;
  }

  Task<Unit> _emitAuthUser(Option<AuthUser> authUser) {
    return Task(() async {
      _authUserStreamController.add(authUser);
      return unit;
    });
  }
}
