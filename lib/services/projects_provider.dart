import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/gen/assets.gen.dart' show Assets;
import 'package:stephenapolinario_flutter/models/projects.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectsProvider {
  static ProjectsProvider? _instance;
  late AppLocalizations _localizations;

  ProjectsProvider._internal(this._localizations);

  factory ProjectsProvider({required AppLocalizations localizations}) {
    _instance ??= ProjectsProvider._internal(localizations);
    _instance!._localizations = localizations; // Update localizations
    return _instance!;
  }

  Project get museum => Project(
        title: 'Museo',
        expandedTitle: _localizations.museo_title,
        presentationImage: Assets.images.projects.museo.presentation,
        hoverImage: Assets.images.projects.museo.hover,
        centerImage: Assets.images.projects.museo.mockup,
        spotlightImage: Assets.images.projects.museo.spotlight,
        type: _localizations.museo_type,
        presentationSummary: _localizations.museo_presentation_summary,
        summary: _localizations.museo_summary,
        roleText: _localizations.museo_role,
        teamText: _localizations.museo_team,
        projectPurposeAndGoalText: _localizations.museo_project_purpose,
        spotlightText: _localizations.museo_spotlight,
        lessonsText: _localizations.museo_lessons,
        route: museoRoute,
        codeLink: Uri.parse('https://github.com/stephenapolinario/Museo'),
        stacks: ['Flutter', 'MongoDB', 'AWS S3', 'Node JS', 'Typescript'],
      );

  Project get courses => Project(
        title: 'Courses',
        expandedTitle: _localizations.courses_title,
        presentationImage: Assets.images.projects.courses.presentation,
        hoverImage: Assets.images.projects.courses.hover,
        centerImage: Assets.images.projects.courses.mockupNoBackground,
        spotlightImage: Assets.images.projects.courses.spotlight,
        spotlightText: _localizations.courses_spotlight,
        type: _localizations.courses_type,
        presentationSummary: _localizations.courses_presentation_summary,
        summary: _localizations.courses_summary,
        projectPurposeAndGoalText: _localizations.courses_project_purpose,
        lessonsText: _localizations.courses_lessons,
        route: coursesRoute,
        stacks: [
          'Laravel',
          'MongoDB',
          'AWS',
          'Python',
        ],
      );

  Project get projectZ => Project(
        title: 'Project Z',
        presentationImage: Assets.images.projects.business.presentation,
        hoverImage: Assets.images.projects.business.presentation,
        presentationSummary: _localizations.business_presentation_summary,
        inProgress: true,
      );

  // Let the courses "Coming Soon"(inProgress) for last.
  List<Project> get allProjects => [
        museum,
        courses,
        projectZ,
      ];
}
