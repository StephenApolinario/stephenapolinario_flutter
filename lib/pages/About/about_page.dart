import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stephenapolinario_flutter/pages/About/Desktop/desktop_about_page.dart';
import 'package:stephenapolinario_flutter/pages/About/Mobile/mobile_about_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = ResponsiveBreakpoints.of(context);

    if (breakpoint.isDesktop || breakpoint.breakpoint.name == '4K') {
      return const DesktopAboutPage();
    } else if (breakpoint.isMobile ||
        breakpoint.isPhone ||
        breakpoint.isTablet) {
      return const MobileAboutPage();
    } else {
      return const Center(
        child: Text('Error: Unsupported screen size'),
      );
    }
  }
}
