import 'package:auth/auth.dart';
import 'package:core/core.dart';

/// Provides a stream of `Option<AuthUser>`s which is updated whenever the user signs in
/// or out.
final authUserStreamProvider = StreamProvider<Option<AuthUser>>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);

    return authRepository.watchAuthUser();
  },
  dependencies: {authRepositoryProvider},
);
