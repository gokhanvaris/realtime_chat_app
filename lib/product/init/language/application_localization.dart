import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:realtime_chat_app/product/utility/constants/locale.dart';

@immutable

/// Product localization manager
final class AppLocalization extends EasyLocalization {
  /// ProductLocalization need to [child] for a wrap locale item
  AppLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedItems,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedItems = [
    Locales.tr.locale,
    Locales.en.locale,
  ];

  static const String _translationPath = 'asset/translations';

  /// Change project language by using [Locales]
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}
