import 'package:flutter/widgets.dart';
import 'package:stephenapolinario_flutter/components/projects/hover_project.dart';
import 'package:stephenapolinario_flutter/components/projects/presentation_project.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';

class DesktopProjectCard extends StatefulWidget {
  final double sectionHeight, sectionWidth;
  final Project project;

  const DesktopProjectCard({
    super.key,
    required this.sectionHeight,
    required this.sectionWidth,
    required this.project,
  });

  @override
  State<DesktopProjectCard> createState() => _DesktopProjectCardState();
}

class _DesktopProjectCardState extends State<DesktopProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation _animationOpacity;
  late double containerHeight;
  late double projectWidth;
  bool isHovering = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _calculateDimensions();

    _animationOpacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DesktopProjectCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-calculate dimensions when the sectionWidth changes
    if (widget.sectionWidth != oldWidget.sectionWidth) {
      _calculateDimensions();
    }
  }

  void _calculateDimensions() {
    projectWidth = widget.sectionWidth * 0.75 * 0.25;
    containerHeight = projectWidth / 0.65;
  }

  void _onEnter(PointerEvent event) {
    if (!widget.project.inProgress && !isHovering) {
      setState(() {
        isHovering = true;
      });
      animationController.forward();
    }
  }

  void _onExit(PointerEvent event) {
    if (!widget.project.inProgress && isHovering) {
      setState(() {
        isHovering = false;
      });
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Create a Carroussel for more than 3 projects.
    final factor = _calculateFactor(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        cursor: SystemMouseCursors.click,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Stack(
              children: [
                PresentationProject(
                  containerHeight: containerHeight * factor,
                  projectWidth: projectWidth * factor,
                  project: widget.project,
                ),
                Opacity(
                  opacity: _animationOpacity.value,
                  child: Visibility(
                    visible: isHovering || animationController.isAnimating,
                    child: HoverProject(
                      containerHeight: containerHeight * factor,
                      projectWidth: projectWidth * factor,
                      project: widget.project,
                      animationController: animationController,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

double _calculateFactor(BuildContext context) {
  late double factor;
  final screenWidth = MediaQuery.of(context).size.width;

  switch (screenWidth) {
    case >= 1300:
      factor = 1;
    case >= 1200:
      factor = 1.1;
    case >= 1100:
      factor = 1.15;
    case >= 1000:
      factor = 1.3;
    case <= 1000:
      factor = 1.4;
    default:
      factor = 1;
  }
  return factor;
}
