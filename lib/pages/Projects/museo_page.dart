import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stephenapolinario_flutter/pages/Projects/Mobile/mobile_project_page.dart';
import 'package:stephenapolinario_flutter/services/projects_provider.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';
import 'package:stephenapolinario_flutter/pages/Projects/Desktop/desktop_project_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MuseoPage extends StatelessWidget {
  const MuseoPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    ProjectsProvider provider = ProjectsProvider(localizations: localizations);
    Project project = provider.museum;
    final breakpoint = ResponsiveBreakpoints.of(context);

    if (breakpoint.isDesktop || breakpoint.breakpoint.name == '4K') {
      return DesktopProjectPage(project: project);
    } else if (breakpoint.isMobile ||
        breakpoint.isPhone ||
        breakpoint.isTablet) {
      return MobileProjectPage(project: project);
    } else {
      return const Center(
        child: Text('Error: Unsupported screen size'),
      );
    }
  }
}
