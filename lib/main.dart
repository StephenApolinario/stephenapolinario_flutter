import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/notifiers/locale_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stephenapolinario_flutter/pages/About/about_page.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/home_page.dart';
import 'package:stephenapolinario_flutter/pages/Projects/courses_page.dart';
import 'package:stephenapolinario_flutter/pages/Projects/museo_page.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  usePathUrlStrategy();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  onException: (context, state, router) {
    router.go(homeRoute);
  },
  routes: <RouteBase>[
    GoRoute(
      path: homeRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        final Map<String, dynamic>? extra =
            state.extra as Map<String, dynamic>?;

        final bool scrollToProjects = extra?['scrollToProjects'] ?? false;
        final bool scrollToContacts = extra?['scrollToContact'] ?? false;

        return CustomTransitionPage(
          key: state.pageKey,
          child: HomePage(
            scrollToProjects: scrollToProjects,
            scrollToContacts: scrollToContacts,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              child,
        );
      },
    ),
    GoRoute(
      path: mainRoute,
      redirect: (context, state) => homeRoute,
    ),
    GoRoute(
      path: aboutRoute,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AboutPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
    GoRoute(
      path: museoRoute,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const MuseoPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
    GoRoute(
      path: coursesRoute,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const CoursesPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            child,
      ),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleNotifier>(
      builder: (context, localeNotifier, child) => MaterialApp.router(
        locale: localeNotifier.locale,
        routerConfig: _router,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
          child: child!,
        ),
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        title: siteTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
