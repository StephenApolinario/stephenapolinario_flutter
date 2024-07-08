import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';

class HoverProject extends StatefulWidget {
  final AnimationController animationController;
  final double containerHeight;
  final double projectWidth;
  final Project project;

  const HoverProject({
    super.key,
    required this.animationController,
    required this.containerHeight,
    required this.projectWidth,
    required this.project,
  });

  @override
  State<HoverProject> createState() => _HoverProjectState();
}

class _HoverProjectState extends State<HoverProject> {
  late Animation _animationProjectWidth;
  late Animation _animationProjectHoverHeight;
  late Animation _animationHoverImage;
  late double projectHoverWidth;
  late double imageHeight;
  late double titleHeight;
  late double learningHeight;

  @override
  void initState() {
    projectHoverWidth = widget.containerHeight * 0.7;
    imageHeight = widget.containerHeight / 2.5;
    titleHeight = widget.containerHeight / 12;
    learningHeight = widget.containerHeight / 27;

    _animationProjectWidth = Tween<double>(
      begin: widget.projectWidth,
      end: projectHoverWidth,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationProjectHoverHeight = Tween<double>(
      begin: widget.containerHeight,
      end: widget.containerHeight * 1.08,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationHoverImage = Tween<double>(
      begin: 0.1,
      end: 0.6,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!widget.project.inProgress && widget.project.route != null) {
          GoRouter.of(context).go(widget.project.route!);
        }
      },
      child: Container(
        height: _animationProjectHoverHeight.value,
        width: _animationProjectWidth.value,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                widget.project.hoverImage!.path,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(_animationHoverImage.value),
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    context.loc.view_project,
                    style: GoogleFonts.ibmPlexMono(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    minFontSize: 1,
                  ),
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 36,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
