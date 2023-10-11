import 'package:auth/auth.dart';
import 'package:auth/src/infrastructure/auth_repository_impl.dart';
import 'package:core/core.dart';

/// Provides an instance of [AuthRepository].
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) {
    return AuthRepositoryImpl();
  },
);
