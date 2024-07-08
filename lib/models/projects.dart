import 'package:stephenapolinario_flutter/gen/assets.gen.dart'
    show AssetGenImage;

class Project {
  final String title, presentationSummary;
  final AssetGenImage presentationImage;
  final AssetGenImage? hoverImage, centerImage, spotlightImage;
  final bool inProgress;
  final String? route,
      roleText,
      teamText,
      projectPurposeAndGoalText,
      spotlightText,
      lessonsText,
      summary,
      expandedTitle,
      type;
  final List? stacks;
  final Uri? codeLink;

  Project({
    required this.title,
    required this.presentationSummary,
    required this.presentationImage,
    this.expandedTitle,
    this.summary,
    this.type,
    this.hoverImage,
    this.centerImage,
    this.spotlightImage,
    this.roleText,
    this.teamText,
    this.projectPurposeAndGoalText,
    this.spotlightText,
    this.lessonsText,
    this.codeLink,
    this.stacks,
    this.route,
    this.inProgress = false,
  }) : assert(
          inProgress ||
              (route != null ||
                  roleText != null ||
                  teamText != null ||
                  projectPurposeAndGoalText != null ||
                  spotlightText != null ||
                  lessonsText != null),
          'There are missings parameters for project the project that isnt progress',
        );
}
