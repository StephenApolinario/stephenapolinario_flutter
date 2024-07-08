import 'package:flutter/material.dart';
import 'package:stephenapolinario_flutter/components/navigator/Desktop/desktop_navigator.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Desktop/desktop_about_me_section.dart';
import 'package:stephenapolinario_flutter/components/bottomBar/Desktop/desktop_bottom_bar.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Desktop/contact_section/desktop_contact_section.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Desktop/desktop_projects_section.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Desktop/skill_and_tools/desktop_skills_and_tools_section.dart';
import 'package:stephenapolinario_flutter/services/navigation_service.dart';

class DesktopHomePage extends StatefulWidget {
  final bool scrollToProjects, scrollToContacts;

  const DesktopHomePage({
    super.key,
    this.scrollToProjects = false,
    this.scrollToContacts = false,
  });

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollToProjects) {
        NavigationService().scrollToDesktopProjectsSection();
      } else if (widget.scrollToContacts) {
        NavigationService().scrollToDesktopContactSection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPagesColors,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DesktopNavigator(
              context: context,
            ),
            const DesktopAboutMeSection(),
            const DesktopSkillsAndToolsSection(),
            Container(
              key: NavigationService.instance.desktopProjectsKey,
              child: const DesktopProjectsSection(),
            ),
            Container(
              key: NavigationService.instance.desktopContactKey,
              child: const DesktopContactSection(),
            ),
            const DesktopBottomBar(),
          ],
        ),
      ),
    );
  }
}
