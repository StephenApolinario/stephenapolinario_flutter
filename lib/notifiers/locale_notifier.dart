import 'package:flutter/material.dart';
import 'package:stephenapolinario_flutter/models/my_custom_locale.dart';

class LocaleNotifier extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  MyCustomLocale currentCustomLocaleFromList(
      List<MyCustomLocale> myCustomLocalesList) {
    return myCustomLocalesList.firstWhere(
      (locale) => locale.locale == _locale,
      orElse: () => myCustomLocalesList.first,
    );
  }
}
