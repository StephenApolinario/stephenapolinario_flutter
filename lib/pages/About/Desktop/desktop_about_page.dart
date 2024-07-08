import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/bottomBar/Desktop/desktop_bottom_bar.dart';
import 'package:stephenapolinario_flutter/components/navigator/Desktop/desktop_navigator.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';
import 'package:stephenapolinario_flutter/constants/my_text_style.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/utils/url_launcher.dart';

class DesktopAboutPage extends StatelessWidget {
  const DesktopAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            DesktopNavigator(
              context: context,
            ),
            const SizedBox(height: 20),
            _aboutMeSection(context),
            const SizedBox(height: 30),
            const DesktopBottomBar(),
          ],
        ),
      ),
    );
  }

  Padding _aboutMeSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: desktopHorizontalPadding(context) * 1.5,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _aboutMeTitle(context),
            _lookingForMyCV(context),
            ..._myQuickStore(context),
            ..._asADeveloper(context),
            ..._asAPerson(context),
            _iAmExcitedText(context),
          ],
        ),
      ),
    );
  }

  Center _aboutMeTitle(BuildContext context) {
    return Center(
      child: SelectableText(
        context.loc.about_me_title,
        style: MyTextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ).greyText,
      ),
    );
  }

  RichText _lookingForMyCV(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
          text: '${context.loc.looking_for_my} ',
          style: MyTextStyle().greyText,
        ),
        TextSpan(
          text: 'CV',
          style: GoogleFonts.montserrat(
            color: myTextLinkColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              myLaunchUrl(url: Uri.parse(myCurriculumURL));
            },
        ),
        TextSpan(
          text: '?\n',
          style: MyTextStyle().greyText,
        ),
      ]),
    );
  }

  List<Widget> _myQuickStore(BuildContext context) {
    return [
      _titleWidget(context, context.loc.my_quick_story),
      SelectableText.rich(
        textAlign: TextAlign.justify,
        TextSpan(
          children: [
            TextSpan(
                text: context.loc.since_my_early_years,
                style: MyTextStyle(fontWeight: FontWeight.w700).greyText),
            TextSpan(
              text: ' ${context.loc.it_all_started}',
              style: MyTextStyle().greyText,
            ),
            TextSpan(
              text: ' ${context.loc.that_same_drive}\n\n',
              style: MyTextStyle(fontWeight: FontWeight.w700).greyText,
            ),
            TextSpan(
              text: '${context.loc.in_my_previous_role}\n',
              style: MyTextStyle().greyText,
            )
          ],
        ),
      )
    ];
  }

  List<Widget> _asADeveloper(BuildContext context) {
    return [
      _titleWidget(context, context.loc.as_a_developer),
      SelectableText(
        textAlign: TextAlign.justify,
        '${context.loc.during_project} \n',
        style: MyTextStyle().greyText,
      ),
      SelectableText.rich(
        textAlign: TextAlign.justify,
        TextSpan(
          children: [
            TextSpan(
              text: '${context.loc.i_prioritize_efficiency} ',
              style: MyTextStyle(fontWeight: FontWeight.w600).greyText,
            ),
            TextSpan(
              text: '${context.loc.while_function_features}\n\n',
              style: MyTextStyle().greyText,
            ),
            TextSpan(
              text: '${context.loc.exploring_new_projects} ',
              style: MyTextStyle().greyText,
            ),
            TextSpan(
              text: '${context.loc.i_see_each_challenge}\n',
              style: MyTextStyle(fontWeight: FontWeight.w600).greyText,
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _asAPerson(BuildContext context) {
    return [
      _titleWidget(context, context.loc.as_a_person),
      SelectableText.rich(
        textAlign: TextAlign.justify,
        TextSpan(
          children: [
            TextSpan(
              text: '${context.loc.my_journey} ',
              style: MyTextStyle(fontWeight: FontWeight.w600).greyText,
            ),
            TextSpan(
              text: '${context.loc.the_world_fascinates}\n\n',
              style: MyTextStyle().greyText,
            ),
            TextSpan(
              text: '${context.loc.i_believe} ',
              style: MyTextStyle().greyText,
            ),
            TextSpan(
              text: '${context.loc.i_approach_each} ',
              style: MyTextStyle(fontWeight: FontWeight.w600).greyText,
            ),
            TextSpan(
              text: '${context.loc.this_learning_mindset}\n',
              style: MyTextStyle().greyText,
            ),
          ],
        ),
      ),
    ];
  }

  SelectableText _titleWidget(BuildContext context, String text) {
    return SelectableText(
      '$text \n',
      style: GoogleFonts.montserrat(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: myGreyColor,
      ),
    );
  }

  SelectableText _iAmExcitedText(BuildContext context) {
    return SelectableText(
      context.loc.i_am_excited,
      style: MyTextStyle(
        fontWeight: FontWeight.w600,
      ).greyText,
    );
  }
}
