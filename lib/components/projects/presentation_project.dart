import 'dart:ui' show ImageFilter;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';

class PresentationProject extends StatelessWidget {
  final double containerHeight;
  final double projectWidth;
  final Project project;

  const PresentationProject({
    super.key,
    required this.containerHeight,
    required this.projectWidth,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final double imageHeight = containerHeight / 2.5;
    final double titleHeight = containerHeight / 12;
    final double progressHeight = containerHeight / 27;
    return Container(
      height: containerHeight,
      width: projectWidth,
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: imageHeight,
            child: Image.asset(
              project.presentationImage.path,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: imageHeight + titleHeight + progressHeight + 10,
            left: 0,
            right: 0,
            child: _summary(project: project, context: context),
          ),
          if (project.inProgress)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: Container(
                  color: Colors.white.withOpacity(0),
                ),
              ),
            ),
          Positioned(
            top: imageHeight + 20,
            left: 0,
            right: 0,
            height: titleHeight,
            child: _title(project: project, context: context),
          ),
          if (project.inProgress)
            Positioned(
              top: imageHeight + titleHeight + 17,
              left: 0,
              right: 0,
              height: progressHeight,
              child: _learningTitle(context: context),
            ),
        ],
      ),
    );
  }

  Padding _title({
    required Project project,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: AutoSizeText(
        project.title,
        style: GoogleFonts.ibmPlexMono(
          fontSize: 26,
          color: Colors.black,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        maxLines: 2,
      ),
    );
  }

  Padding _learningTitle({
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
      ),
      child: AutoSizeText(
        context.loc.coming_soon,
        style: GoogleFonts.ibmPlexMono(
          fontSize: 16,
          color: Colors.red,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          height: 1,
        ),
        minFontSize: 1,
        maxLines: 1,
      ),
    );
  }

  Padding _summary({required Project project, required BuildContext context}) {
    late int calculatedMaxLines = _maxLines(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      child: AutoSizeText(
        project.presentationSummary,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: GoogleFonts.ibmPlexMono(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        minFontSize: 15,
        maxLines: calculatedMaxLines,
      ),
    );
  }
}

int _maxLines(BuildContext context) {
  late int maxLines;
  final double screenWidth = MediaQuery.of(context).size.width;
  switch (screenWidth) {
    case >= 900:
      maxLines = 7;
    case >= 800:
      maxLines = 6;
    default:
      maxLines = 7;
  }
  return maxLines;
}
