import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';

class MobileProjectCard extends StatelessWidget {
  final Project project;

  const MobileProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _image(context),
        const SizedBox(height: 10),
        _description(context),
      ],
    );
  }

  Stack _image(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double calculatedFactor = screenWidth >= 700
        ? 0.6
        : screenWidth >= 400
            ? 0.8
            : 1;
    return Stack(
      children: [
        FractionallySizedBox(
          widthFactor: calculatedFactor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              height: 175,
              width: double.infinity,
              fit: BoxFit.fill,
              project.presentationImage.path,
            ),
          ),
        ),
        if (project.inProgress)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Column _description(BuildContext context) {
    return Column(
      children: [
        _title(context),
        const SizedBox(height: 10),
        _summary(),
        const SizedBox(height: 10),
        _button(context),
        const SizedBox(height: 50),
      ],
    );
  }

  Column _title(BuildContext context) {
    return Column(
      children: [
        Text(
          project.title,
          style: GoogleFonts.montserrat(
            fontSize: 22,
            color: Colors.black,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (project.inProgress)
          Text(
            '\n ${context.loc.coming_soon}',
            style: GoogleFonts.montserrat(
              height: 0,
              color: Colors.red,
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          )
      ],
    );
  }

  Stack _summary() {
    return Stack(
      children: [
        SelectableText(
          project.presentationSummary,
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            color: Colors.black,
            letterSpacing: 1,
          ),
        ),
        if (project.inProgress)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Stack _button(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: ElevatedButton(
            onPressed: () {
              if (!project.inProgress && project.route != '') {
                GoRouter.of(context).go(project.route!);
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(3),
                )),
            child: Text(
              context.loc.view_project,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        if (project.inProgress)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
