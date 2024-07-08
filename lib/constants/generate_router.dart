import 'package:flutter/material.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/pages/Projects/courses_page.dart';
import 'package:stephenapolinario_flutter/pages/About/about_page.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/home_page.dart';
import 'package:stephenapolinario_flutter/pages/Projects/museo_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomePage(),
          settings: const RouteSettings(name: homeRoute),
        );
      case aboutRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const AboutPage(),
          settings: const RouteSettings(name: aboutRoute),
        );
      case museoRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MuseoPage(),
          settings: const RouteSettings(name: museoRoute),
        );
      case coursesRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CoursesPage(),
          settings: const RouteSettings(name: coursesRoute),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      );
    });
  }
}
