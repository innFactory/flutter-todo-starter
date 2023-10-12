import 'dart:async';

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

final authChangeNotifierProvider = Provider.autoDispose(
  (ref) {
    return AuthChangeNotifier(
      authRepository: ref.watch(authRepositoryProvider),
    )..init();
  },
);

class AuthChangeNotifier extends ChangeNotifier {
  AuthChangeNotifier({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  StreamSubscription<Option<AuthUser>>? _subscription;

  Future<void> init() async {
    _subscription = _authRepository
        .watchAuthUser()
        // Skip the first event because initially we invoke the AuthGuard to
        // load the state and this first event would be the same as the current
        // state and therefore unnecessarily trigger a route stack reevaluation.
        .skip(1)
        .listen((user) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
