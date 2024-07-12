import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/language_selector.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/navigation.dart';
import 'package:stephenapolinario_flutter/services/navigation_service.dart';
import 'package:stephenapolinario_flutter/services/navigator_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class MobileNavigator extends StatelessWidget {
  const MobileNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRouteName =
        GoRouter.of(context).routeInformationProvider.value.uri.toString();

    AppLocalizations localizations = AppLocalizations.of(context)!;
    NavigatorProvider provider =
        NavigatorProvider(localizations: localizations);
    List<NavigationOption> navigatorOptions = provider.navigationOptions;
    return Drawer(
      backgroundColor: backgroundPagesColors,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              context.loc.navigation,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ...navigatorOptions.map(
            (NavigationOption option) {
              return ListTile(
                leading: Icon(
                  option.icon,
                  color: Colors.black,
                ),
                title: Text(
                  option.name,
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                onTap: () {
                  if (currentRouteName == homeRoute) {
                    if (option.route == homeRoute) {
                      NavigationService().scrollToMobileAboutSection();
                      Navigator.pop(context);
                    }
                    if (option.route == projectsRoute) {
                      NavigationService().scrollToMobileProjectsSection();
                      Navigator.pop(context);
                    } else if (option.route == contactRoute) {
                      NavigationService().scrollToMobileContactSection();
                      Navigator.pop(context);
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
                    }
                  } else {
                    GoRouter.of(context).go(option.route);
                  }
                },
              );
            },
          ),
          LanguageSelector(
            customButton: ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.black,
              ),
              title: Text(
                context.loc.language,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
