import 'package:core/core.dart';
import 'package:flutter/widgets.dart';

export 'package:flutter_i18n/flutter_i18n.dart'
    show FlutterI18nDelegate, FileTranslationLoader;
export 'package:flutter_i18n/loaders/decoders/json_decode_strategy.dart';

/// Facade for translation logic.
abstract class I18n {
  factory I18n.of(BuildContext context) => I18nImpl(context);

  String translate(
    String key, {
    String? fallbackKey,
    Map<String, String>? params,
  });

  String plural(String key, int pluralValue);
}

extension I18nContext on BuildContext {
  String translate(
    String key, {
    String? fallbackKey,
    Map<String, String>? params,
  }) =>
      I18n.of(this).translate(key, fallbackKey: fallbackKey, params: params);

  String plural(String key, int pluralValue) =>
      I18n.of(this).plural(key, pluralValue);
}

@sealed
class I18nImpl implements I18n {
  I18nImpl(this.context);

  final BuildContext context;

  @override
  String plural(String key, int pluralValue) {
    return FlutterI18n.plural(context, key, pluralValue);
  }

  @override
  String translate(
    String key, {
    String? fallbackKey,
    Map<String, String>? params,
  }) {
    return FlutterI18n.translate(
      context,
      key,
      fallbackKey: fallbackKey,
      translationParams: params,
    );
  }
}
