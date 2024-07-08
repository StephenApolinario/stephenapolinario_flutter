import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/constants/skills_and_tools.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/utils/url_launcher.dart';

class MobileSkillsAndToolsSection extends StatelessWidget {
  const MobileSkillsAndToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobileHorizontalPadding(context),
      ),
      child: Column(
        children: [
          _title(context),
          const SizedBox(height: 10),
          _skills(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  SelectableText _title(BuildContext context) {
    return SelectableText(
      context.loc.skills_and_tools,
      style: GoogleFonts.montserrat(
        fontSize: 28,
        color: Colors.black,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Wrap _skills(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 8.0,
      alignment: WrapAlignment.center,
      children: skillsAndToolsList.map((skillAndTool) {
        return ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 40,
          ),
          child: GestureDetector(
            onTap: () async => myLaunchUrl(url: skillAndTool.url),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(18, 30, 39, 1),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      skillAndTool.name,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (skillAndTool.studying)
                      Text(
                        context.loc.studying_skill,
                        style: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
