import 'package:flutter/material.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/models/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class NavigatorProvider {
  static NavigatorProvider? _instance;
  late AppLocalizations _localizations;

  NavigatorProvider._internal(this._localizations);

  factory NavigatorProvider({required AppLocalizations localizations}) {
    _instance ??= NavigatorProvider._internal(localizations);
    _instance!._localizations = localizations; // Update localizations
    return _instance!;
  }

  NavigationOption get navigationOptionHome => NavigationOption(
        name: _localizations.home,
        icon: Icons.home,
        route: homeRoute,
      );

  NavigationOption get navigationOptionAbout => NavigationOption(
        name: _localizations.about,
        icon: Icons.person_4_sharp,
        route: aboutRoute,
      );

  NavigationOption get navigationOptionProjects => NavigationOption(
        name: _localizations.projects,
        icon: Icons.star_rate_sharp,
        route: projectsRoute,
      );

  NavigationOption get navigationOptionContact => NavigationOption(
        name: _localizations.contact,
        icon: Icons.perm_contact_calendar,
        route: contactRoute,
      );

  List<NavigationOption> get navigationOptions => [
        navigationOptionHome,
        navigationOptionAbout,
        navigationOptionProjects,
        navigationOptionContact,
      ];
}
