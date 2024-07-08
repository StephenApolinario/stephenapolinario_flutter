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
import 'package:stephenapolinario_flutter/utils/url_launcher.dart';

class MobileAboutPage extends StatelessWidget {
  const MobileAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            const SizedBox(height: 40),
            _aboutMeSection(context),
            const SizedBox(height: 30),
            const MobileBottomBar(),
          ],
        ),
      ),
    );
  }

  Padding _aboutMeSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mobileHorizontalPadding(context),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _aboutMeTitle(context),
            const SizedBox(height: 10),
            _lookingForMyCV(context),
            const SizedBox(height: 10),
            ..._myQuickStore(context),
            const SizedBox(height: 10),
            ..._asADeveloper(context),
            const SizedBox(height: 10),
            ..._asAPerson(context),
            const SizedBox(height: 10),
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
          fontSize: 32,
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
          text: '?',
          style: MyTextStyle().greyText,
        ),
      ]),
    );
  }

  List<Widget> _myQuickStore(BuildContext context) {
    return [
      _titleWidget(context, context.loc.my_quick_story),
      const SizedBox(height: 10),
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
      const SizedBox(height: 10),
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
      const SizedBox(height: 10),
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
              text: context.loc.this_learning_mindset,
              style: MyTextStyle().greyText,
            ),
          ],
        ),
      ),
    ];
  }

  SelectableText _titleWidget(BuildContext context, String text) {
    return SelectableText(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 26,
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
