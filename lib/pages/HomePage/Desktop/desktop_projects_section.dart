import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/projects/desktop_project_card.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/services/projects_provider.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DesktopProjectsSection extends StatefulWidget {
  const DesktopProjectsSection({super.key});

  @override
  State<DesktopProjectsSection> createState() => _DesktopProjectsSectionState();
}

class _DesktopProjectsSectionState extends State<DesktopProjectsSection> {
  late double sectionWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: desktopHorizontalPadding(context),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double sectionHeight = MediaQuery.of(context).size.height * 0.5;
          sectionWidth = constraints.maxWidth;
          return SizedBox(
            height: sectionHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(context),
                _projects(context, sectionHeight, sectionWidth),
              ],
            ),
          );
        },
      ),
    );
  }

  SelectableText _title(BuildContext context) {
    return SelectableText(
      context.loc.projects,
      style: GoogleFonts.montserrat(
        fontSize: 40,
        color: Colors.black,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Expanded _projects(
    BuildContext context,
    double sectionHeight,
    double sectionWidth,
  ) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    ProjectsProvider provider = ProjectsProvider(localizations: localizations);
    List<Project> projects = provider.allProjects;
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...projects.map(
            (currentProject) => DesktopProjectCard(
              sectionHeight: sectionHeight,
              sectionWidth: sectionWidth,
              project: currentProject,
            ),
          ),
        ],
      ),
    );
  }
}
