import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/projects/mobile_project_card.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';
import 'package:stephenapolinario_flutter/services/projects_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileProjectsSection extends StatelessWidget {
  const MobileProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    ProjectsProvider provider = ProjectsProvider(localizations: localizations);
    List<Project> projects = provider.allProjects;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobileHorizontalPadding(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(context),
          const SizedBox(height: 20),
          ..._projects(projects),
        ],
      ),
    );
  }

  SelectableText _title(BuildContext context) {
    return SelectableText(
      context.loc.projects,
      style: GoogleFonts.montserrat(
        fontSize: 28,
        color: Colors.black,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<MobileProjectCard> _projects(List<Project> projects) {
    return projects
        .map(
          (project) => MobileProjectCard(project: project),
        )
        .toList();
  }
}
