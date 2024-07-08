import 'package:country_flags/country_flags.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import '../services/my_locales_provider.dart';
import '../models/my_custom_locale.dart';
import '../notifiers/locale_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class LanguageSelector extends StatelessWidget {
  final Widget customButton;

  const LanguageSelector({
    super.key,
    required this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    MyLocalesProvider provider =
        MyLocalesProvider(localizations: localizations);
    List<MyCustomLocale> myCustomLocalesList = provider.myLocalesList;

    return Consumer<LocaleNotifier>(
      builder: (context, localeNotifier, child) {
        MyCustomLocale currentLocale =
            localeNotifier.currentCustomLocaleFromList(myCustomLocalesList);

        // Ensure currentLocale exists in the list
        // if (!myCustomLocalesList.contains(currentLocale)) {
        //   currentLocale = myCustomLocalesList.first;
        // }

        return DropdownButtonHideUnderline(
          child: DropdownButton2<MyCustomLocale>(
            value: currentLocale,
            customButton: customButton,
            iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: backgroundPagesColors,
              ),
              width: 200,
            ),
            onChanged: (MyCustomLocale? myCustomLocale) {
              if (myCustomLocale != null) {
                localeNotifier.setLocale(myCustomLocale.locale);
              }
            },
            items: myCustomLocalesList.map<DropdownMenuItem<MyCustomLocale>>(
                (MyCustomLocale myCustomLocale) {
              return DropdownMenuItem<MyCustomLocale>(
                value: myCustomLocale,
                child: Wrap(
                  spacing: 20,
                  children: [
                    CountryFlag.fromCountryCode(
                      myCustomLocale.countryCode,
                      shape: const Circle(),
                      height: 30,
                      width: 19,
                    ),
                    Text(
                      myCustomLocale.language,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
