import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/bottomBar/Mobile/mobile_bottom_bar.dart';
import 'package:stephenapolinario_flutter/components/navigator/Mobile/mobile_navigator.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';
import 'package:stephenapolinario_flutter/constants/my_text_style.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/projects.dart';
import 'package:stephenapolinario_flutter/utils/url_launcher.dart';

class MobileProjectPage extends StatelessWidget {
  final Project project;

  const MobileProjectPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MobileNavigator(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          siteTitle,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _projectSection(context),
            const SizedBox(height: 30),
            const MobileBottomBar(),
          ],
        ),
      ),
    );
  }

  Padding _projectSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: desktopHorizontalPadding(context) * 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _myTitleText(context),
          _summaryText(context),
          _typeStackAndLiveRow(context),
          const SizedBox(height: 20),
          if (project.teamText != null && project.roleText != null)
            _roleAndTeam(context),
          const SizedBox(height: 20),
          _imageCenter(context),
          const SizedBox(height: 20),
          _projectPorpouseAndGoal(context),
          const SizedBox(height: 20),
          _spotlight(context),
          const SizedBox(height: 20),
          _lessons(context),
        ],
      ),
    );
  }

  SelectableText _myTitleText(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${project.expandedTitle} \n',
            style: MyTextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 28,
            ).greyText,
          ),
          TextSpan(
            text: '${_calculateTotalWordCount(context)} Minutes Read\n',
            style: MyTextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ).greyText,
          )
        ],
      ),
    );
  }

  SelectableText _summaryText(BuildContext context) {
    return SelectableText(
      '${project.summary} \n',
      textAlign: TextAlign.justify,
      style: MyTextStyle().greyText,
    );
  }

  Center _typeStackAndLiveRow(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SelectableText(
            context.loc.type,
            style: MyTextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ).greyText,
          ),
          const SizedBox(height: 10),
          SelectableText(
            project.type!,
            style: MyTextStyle().greyText,
          ),
          const SizedBox(height: 20),
          SelectableText(
            context.loc.stack,
            style: MyTextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ).greyText,
          ),
          ...List.generate(project.stacks!.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(text: '• ', style: MyTextStyle().greyText),
                    TextSpan(
                      text: project.stacks![index],
                      style: MyTextStyle().greyText,
                    )
                  ],
                ),
              ),
            );
          }),
          if (project.codeLink != null) ...[
            const SizedBox(height: 20),
            SelectableText(
              context.loc.code,
              style: MyTextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ).greyText,
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: 'Github',
                style: GoogleFonts.montserrat(
                  color: myTextLinkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    myLaunchUrl(url: project.codeLink!);
                  },
              ),
            ),
          ]
        ],
      ),
    );
  }

  Column _roleAndTeam(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          context.loc.my_role,
          style: MyTextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ).greyText,
        ),
        const SizedBox(height: 10),
        SelectableText(
          textAlign: TextAlign.justify,
          project.roleText!,
          style: MyTextStyle().greyText,
        ),
        const SizedBox(height: 20),
        SelectableText(
          context.loc.team,
          style: MyTextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ).greyText,
        ),
        const SizedBox(height: 10),
        SelectableText(
          textAlign: TextAlign.justify,
          project.teamText!,
          style: MyTextStyle().greyText,
        ),
      ],
    );
  }

  ClipRRect _imageCenter(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        project.centerImage!.path,
        fit: BoxFit.fill,
      ),
    );
  }

  Column _projectPorpouseAndGoal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          context.loc.project_porpouse_and_goal,
          style: MyTextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ).greyText,
        ),
        const SizedBox(height: 10),
        SelectableText(
          textAlign: TextAlign.justify,
          project.projectPurposeAndGoalText!,
          style: MyTextStyle().greyText,
        ),
      ],
    );
  }

  Column _spotlight(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 225,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              project.spotlightImage!.path,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SelectableText(
          context.loc.spotlight,
          style: MyTextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ).greyText,
        ),
        const SizedBox(height: 10),
        SelectableText(
          project.spotlightText!,
          textAlign: TextAlign.justify,
          style: MyTextStyle().greyText,
        ),
      ],
    );
  }

  Column _lessons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SelectableText(
          context.loc.lessons,
          style: MyTextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ).greyText,
        ),
        const SizedBox(height: 10),
        SelectableText(
          textAlign: TextAlign.justify,
          project.lessonsText!,
          style: MyTextStyle().greyText,
        ),
      ],
    );
  }

  int _countWords(String text) {
    RegExp regExp = RegExp(" ");
    int lenght = regExp.allMatches(text).length + 1;
    return lenght;
  }

  int _calculateTotalWordCount(BuildContext context) {
    int totalWords = 0;

    // Adding words from all the text sections
    totalWords += _countWords(project.expandedTitle!);
    totalWords += _countWords('XX Minutes Read');
    totalWords += _countWords(project.summary!);
    totalWords += _countWords(context.loc.type);
    totalWords += _countWords(project.type!);
    totalWords += _countWords(context.loc.stack);
    project.stacks?.forEach((stack) {
      totalWords += _countWords(stack);
    });
    totalWords += _countWords(context.loc.code);
    totalWords += _countWords('Github');

    if (project.roleText != null && project.teamText != null) {
      totalWords += _countWords(context.loc.my_role);
      totalWords += _countWords(project.roleText!);
      totalWords += _countWords(context.loc.team);
      totalWords += _countWords(project.teamText!);
    }

    totalWords += _countWords(context.loc.project_porpouse_and_goal);
    totalWords += _countWords(project.projectPurposeAndGoalText!);
    totalWords += _countWords(context.loc.spotlight);
    totalWords += _countWords(project.spotlightText!);
    totalWords += _countWords(context.loc.lessons);
    totalWords += _countWords(project.lessonsText!);

    return (totalWords / 200).ceil();
  }
}
