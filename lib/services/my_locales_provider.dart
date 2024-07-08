import 'package:flutter/material.dart' show Locale;
import 'package:stephenapolinario_flutter/models/my_custom_locale.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class MyLocalesProvider {
  static MyLocalesProvider? _instance;
  late AppLocalizations _localizations;

  MyLocalesProvider._internal(this._localizations);

  factory MyLocalesProvider({required AppLocalizations localizations}) {
    _instance ??= MyLocalesProvider._internal(localizations);
    _instance!._localizations = localizations; // Update localizations
    return _instance!;
  }

  MyCustomLocale get localePortugueseBrazil => MyCustomLocale(
        language: _localizations.portuguese,
        locale: const Locale('pt'),
        countryCode: 'BR',
      );

  MyCustomLocale get localeEnglish => MyCustomLocale(
        language: _localizations.english,
        locale: const Locale('en'),
        countryCode: 'US',
      );

  List<MyCustomLocale> get myLocalesList => [
        localeEnglish,
        localePortugueseBrazil,
      ];
}
