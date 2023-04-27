import 'package:core/core.dart';

class AuthUserId extends ValueId<String> {
  const AuthUserId(super.value);
}

class AuthUser extends Equatable {
  const AuthUser({
    required this.id,
    required this.email,
  });

  final AuthUserId id;
  final String email;

  @override
  List<Object?> get props => [id, email];
}
