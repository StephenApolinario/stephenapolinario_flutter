import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/navigator/Mobile/mobile_navigator.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Mobile/mobile_about_me_section.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Mobile/mobile_contact_section.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Mobile/mobile_projects_section.dart';
import 'package:stephenapolinario_flutter/pages/HomePage/Mobile/mobile_skills_and_tools_section.dart';
import 'package:stephenapolinario_flutter/services/navigation_service.dart';
import 'package:stephenapolinario_flutter/components/bottomBar/Mobile/mobile_bottom_bar.dart';

class MobileHomePage extends StatefulWidget {
  final bool scrollToAbout, scrollToProjects, scrollToContacts;

  const MobileHomePage({
    super.key,
    this.scrollToAbout = false,
    this.scrollToProjects = false,
    this.scrollToContacts = false,
  });

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollToProjects) {
        NavigationService().scrollToMobileProjectsSection();
      } else if (widget.scrollToContacts) {
        NavigationService().scrollToMobileContactSection();
      } else if (widget.scrollToAbout) {
        NavigationService().scrollToMobileAboutSection();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPagesColors,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        title: Text(
          siteTitle,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      drawer: const MobileNavigator(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              key: NavigationService.instance.mobileAboutMeKey,
              child: const MobileAboutMeSection(),
            ),
            const MobileSkillsAndToolsSection(),
            // MobileProjectsSection(),
            Container(
              key: NavigationService.instance.mobileProjectsKey,
              child: const MobileProjectsSection(),
            ),
            Container(
              key: NavigationService.instance.mobileContactKey,
              child: const MobileContactSection(),
            ),
            const MobileBottomBar(),
          ],
        ),
      ),
    );
  }
}
