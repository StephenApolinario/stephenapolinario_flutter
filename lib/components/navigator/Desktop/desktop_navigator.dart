import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stephenapolinario_flutter/components/language_selector.dart';
import 'package:stephenapolinario_flutter/components/navigator/Desktop/desktop_navigator_painter.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/models/my_custom_locale.dart';
import 'package:stephenapolinario_flutter/notifiers/locale_notifier.dart';
import 'package:stephenapolinario_flutter/services/my_locales_provider.dart';
import 'package:stephenapolinario_flutter/services/navigator_provider.dart';
import 'package:stephenapolinario_flutter/models/navigation.dart';
import 'package:stephenapolinario_flutter/services/navigation_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DesktopNavigator extends StatelessWidget {
  final BuildContext context;

  const DesktopNavigator({
    super.key,
    required this.context,
  });

  final double paddingTopTitle = 45;
  final double paddingBottomTitle = 10;
  final double paddingTopContainer = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _navigatorDivider(context),
        _navigator(context),
      ],
    );
  }

  Row _navigator(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(context),
        _options(context),
      ],
    );
  }

  Padding _title(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTopTitle,
        left: 50,
        bottom: paddingBottomTitle,
      ),
      child: TextButton(
        onPressed: () => GoRouter.of(context).go(homeRoute),
        child: AutoSizeText(
          siteTitle,
          style: GoogleFonts.montserrat(
            fontSize: _getTitleFontSize(context),
            color: whiteTextColor,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          minFontSize: 1,
        ),
      ),
    );
  }

  Widget _options(BuildContext context) {
    String currentRouteName = ModalRoute.of(context)!.settings.name ?? '';
    AppLocalizations localizations = AppLocalizations.of(context)!;
    NavigatorProvider navigatorProvider =
        NavigatorProvider(localizations: localizations);
    List<NavigationOption> navigatorOptions =
        navigatorProvider.navigationOptions;

    MyLocalesProvider myLocalesProvider =
        MyLocalesProvider(localizations: localizations);
    List<MyCustomLocale> myCustomLocalesList = myLocalesProvider.myLocalesList;
    return Wrap(
      spacing: 20,
      children: [
        ...navigatorOptions.map(
          (option) => Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {
                if (currentRouteName == homeRoute) {
                  if (option.route == projectsRoute) {
                    NavigationService().scrollToDesktopProjectsSection();
                  } else if (option.route == contactRoute) {
                    NavigationService().scrollToDesktopContactSection();
                  } else if (option.route != homeRoute) {
                    GoRouter.of(context).go(option.route);
                  }
                }
                // This is just for when the user is Outside the HomePage
                // If the user CLICKS on the project/contact. (Redirect to HomePage & Scroll)
                // Else, just redirect to the desired page
                else if (currentRouteName != option.route) {
                  if (option.route == projectsRoute) {
                    GoRouter.of(context).go(
                      homeRoute,
                      extra: {'scrollToProjects': true},
                    );
                  } else if (option.route == contactRoute) {
                    GoRouter.of(context).go(
                      homeRoute,
                      extra: {'scrollToContact': true},
                    );
                  } else {
                    GoRouter.of(context).go(option.route);
                  }
                }
              },
              child: AutoSizeText(
                option.name,
                style: GoogleFonts.montserrat(
                  fontSize: _getOptionFontSize(context),
                  color: enabledOptionColor,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                minFontSize: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 30),
          child: LanguageSelector(
            customButton: Center(
              child: CountryFlag.fromCountryCode(
                context
                    .watch<LocaleNotifier>()
                    .currentCustomLocaleFromList(myCustomLocalesList)
                    .countryCode,
                width: 30,
                height: 19,
              ),
            ),
          ),
        ),
      ],
    );
  }

  CustomPaint _navigatorDivider(
    BuildContext context,
  ) {
    const double containerHeight = 90;

    return CustomPaint(
      painter: DesktopNavigatorPainter(
        size: MediaQuery.of(context).size,
        containerHeight: containerHeight,
        paddingTopTitle: paddingTopTitle,
        paddingBottomTitle: paddingBottomTitle,
      ),
    );
  }

  SizedBox aboutMe() {
    return const SizedBox(
      height: 200,
      width: 200,
      child: ColoredBox(
        color: Colors.red,
      ),
    );
  }
}

_getOptionFontSize(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1200 ? 18 : 16;
}

double _getTitleFontSize(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1200 ? 26 : 20;
}
