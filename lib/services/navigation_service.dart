import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();

  factory NavigationService() => _instance;

  static NavigationService get instance => _instance;

  final GlobalKey desktopProjectsKey = GlobalKey();
  final GlobalKey desktopContactKey = GlobalKey();

  final GlobalKey mobileAboutMeKey = GlobalKey();
  final GlobalKey mobileProjectsKey = GlobalKey();
  final GlobalKey mobileContactKey = GlobalKey();

  void scrollToDesktopProjectsSection() {
    _scrollToSection(desktopProjectsKey);
  }

  void scrollToDesktopContactSection() {
    _scrollToSection(desktopContactKey);
  }

  void scrollToMobileAboutSection() {
    _scrollToSection(mobileAboutMeKey);
  }

  void scrollToMobileProjectsSection() {
    _scrollToSection(mobileProjectsKey);
  }

  void scrollToMobileContactSection() {
    _scrollToSection(mobileContactKey);
  }

  void _scrollToSection(GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeOut,
      );
    }
  }
}
