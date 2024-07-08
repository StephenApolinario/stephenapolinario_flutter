import 'package:flutter/material.dart' show IconData;

class NavigationOption {
  final String name;
  final String route;
  final IconData icon;

  NavigationOption({
    required this.name,
    required this.route,
    required this.icon,
  });
}
