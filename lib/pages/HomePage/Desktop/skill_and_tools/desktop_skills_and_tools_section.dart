import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/skills_and_tools.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/constants/skills_and_tools.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Desktop/skill_and_tools/desktop_skills_and_tools_painter.dart';

class DesktopSkillsAndToolsSection extends StatelessWidget {
  const DesktopSkillsAndToolsSection({super.key});

  final double horizontalPaddingContainer = 60;

  @override
  Widget build(BuildContext context) {
    const double containerHeight = 520;

    return Stack(
      children: [
        _skillsAndToolsDivider(context, containerHeight),
        _skillsSection(context, containerHeight),
      ],
    );
  }

  Padding _skillsSection(BuildContext context, double containerHeight) {
    return Padding(
      padding: EdgeInsets.only(
        left: desktopHorizontalPadding(context),
        right: desktopHorizontalPadding(context),
        top: horizontalPaddingContainer,
        bottom: 30,
      ),
      child: SizedBox(
        height: (containerHeight * 0.95) - 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _title(context),
            const SizedBox(height: 20),
            _skillsAndTools(context),
          ],
        ),
      ),
    );
  }

  SelectableText _title(BuildContext context) {
    return SelectableText(
      context.loc.skills_and_tools,
      style: GoogleFonts.montserrat(
        fontSize: 40,
        color: Colors.white,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Expanded _skillsAndTools(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool threeRows = screenWidth <= 1300;

    final double factor = _calculateFactor(threeRows, screenWidth);

    final double iconSize = 80 * factor;
    final double sizedBoxWidth = 140 * factor;

    return Expanded(
      child: Center(
        child: Wrap(
          spacing: _calculateSpacing(
            screenWidth,
          ),
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: skillsAndToolsList.map((skillAndTool) {
            return SkillsAndToolWidget(
              skillAndTool: skillAndTool,
              spacer: 8,
              sizedBoxSize: sizedBoxWidth,
              iconSize: iconSize,
              fontSize: 14,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _skillsAndToolsDivider(BuildContext context, double containerHeight) {
    return CustomPaint(
      painter: SkillsAndToolsPainter(
        size: MediaQuery.of(context).size,
        containerHeight: containerHeight,
        paddingTopContainer: horizontalPaddingContainer,
      ),
    );
  }
}

double _calculateFactor(bool threeRows, double screenWidth) {
  late double factor;

  switch (screenWidth) {
    case >= 1500:
      factor = 1;
    case >= 1300:
      factor = 0.9;
    case >= 1000:
      factor = 0.8;
    case < 1000:
      factor = 0.75;
    default:
      factor = 1;
  }

  return factor;
}

double _calculateSpacing(double screenWidth) {
  if (screenWidth >= 1000) {
    return 120;
  } else {
    return 80;
  }
}
