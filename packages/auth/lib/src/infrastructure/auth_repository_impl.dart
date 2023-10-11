import 'dart:async';

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:kv_store/kv_store.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    KVStore kvStore = const SimpleKVStore(),
  }) : _kvStore = kvStore;

  @visibleForTesting
  static const prefKeyPrefix = 'auth_';
  @visibleForTesting
  static const prefKeySignedIn = '${prefKeyPrefix}signed_in';

  final KVStore _kvStore;
  final StreamController<Option<AuthUser>> _authUserStreamController =
      StreamController<Option<AuthUser>>.broadcast();

  @override
  TaskEither<Failure, Unit> signOut() {
    return _kvStore
        .setBool(prefKeySignedIn, false)
        .andThen(_emitAuthUser(none()).toTaskEither);
  }

  @override
  TaskEither<Failure, Unit> signWithCredentials(
    String email,
    String password,
  ) {
    return TaskEither<Failure, Option<AuthUser>>(() async {
      if (email == 'email' && password == 'password') {
        final user = Some(
          AuthUser(
            id: const AuthUserId('id'),
            email: email,
          ),
        );

        return right(user);
      } else {
        return left(const InvalidCredentialsFailure());
      }
    })
        .flatMap(
          (user) => _kvStore.setBool(prefKeySignedIn, true).andThen(() {
            return TaskEither.fromTask(_emitAuthUser(user));
          }),
        )
        .mapLeft((l) => const InvalidCredentialsFailure());
  }

  @override
  Stream<Option<AuthUser>> watchAuthUser() async* {
    final isAuthenticatedEither = await _kvStore.getBool(prefKeySignedIn).run();

    final isAuthenticated = isAuthenticatedEither.getOrElse((_) => false);

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

  @override
  TaskEither<Failure, bool> isUserSignedIn() {
    return _kvStore.getBool(prefKeySignedIn);
  }
}
