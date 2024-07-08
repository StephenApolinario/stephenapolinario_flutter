import 'package:flutter/material.dart' show Locale;

class MyCustomLocale {
  final String language, countryCode;
  final Locale locale;

  MyCustomLocale({
    required this.language,
    required this.locale,
    required this.countryCode,
  });
}
