import 'package:core/src/i18n.dart';

abstract class Failure {
  String get code;

  String translate(I18n i18n);
}

enum AuthFailure with EnumFailure {
  invalidCredentials,
  unknown,
  offline;

  @override
  String translate(I18n i18n) {
    switch (this) {
      case AuthFailure.unknown:
        return i18n.translate('authFailure.unknown');
      case AuthFailure.offline:
        return i18n.translate('authFailure.offline');
      case AuthFailure.invalidCredentials:
        return i18n.translate('authFailure.invalidCredentials');
    }
  }
}

mixin EnumFailure on Enum implements Failure {
  @override
  String get code => name;
}

enum Failures with EnumFailure {
  offline,
  auth,
  database,
  unknown,
  formIsEmpty,
  notFound;

  @override
  String translate(I18n i18n) {
    switch (this) {
      case Failures.unknown:
        return i18n.translate('failures.unknown');
      case Failures.offline:
        return i18n.translate('failures.offline');
      case Failures.auth:
        return i18n.translate('failures.auth');
      case Failures.database:
        return i18n.translate('failures.database');
      case Failures.notFound:
        return i18n.translate('failures.notFound');
      case Failures.formIsEmpty:
        return i18n.translate('failures.formIsEmpty');
    }
  }
}
