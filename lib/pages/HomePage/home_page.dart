import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Desktop/desktop_home_page.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Mobile/mobile_home_page.dart';

class HomePage extends StatelessWidget {
  final bool scrollToProjects, scrollToContacts;

  const HomePage({
    super.key,
    this.scrollToProjects = false,
    this.scrollToContacts = false,
  });

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    if (breakpoint.isDesktop || breakpoint.breakpoint.name == '4K') {
      return DesktopHomePage(
        scrollToContacts: scrollToContacts,
        scrollToProjects: scrollToProjects,
      );
    } else if (breakpoint.isMobile ||
        breakpoint.isPhone ||
        breakpoint.isTablet) {
      return MobileHomePage(
        scrollToContacts: scrollToContacts,
        scrollToProjects: scrollToProjects,
      );
    } else {
      return const Center(
        child: Text('Error: Unsupported screen size'),
      );
    }
  }
}
