import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/gen/assets.gen.dart';

class DesktopAboutMeSection extends StatelessWidget {
  const DesktopAboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double sectionHeight = screenWidth <= 1100 ? 450 : 375;
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        left: desktopHorizontalPadding(context),
        right: desktopHorizontalPadding(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: _calculateImageFlex(context),
            child: _image(),
          ),
          const SizedBox(width: 10),
          Flexible(
            fit: FlexFit.tight,
            flex: 5,
            child: _description(
              context: context,
              sectionHeight: sectionHeight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _image() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          height: 275,
          Assets.images.meAsAvatar.path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Container _description({
    required BuildContext context,
    required double sectionHeight,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      height: sectionHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(context),
          _summary(context),
          _buttonReadMore(context),
        ],
      ),
    );
  }

  Padding _buttonReadMore(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: () => GoRouter.of(context).go(aboutRoute),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          overlayColor: Colors.transparent,
        ),
        child: Text(
          context.loc.bio_link,
          style: GoogleFonts.montserrat(
            fontSize: 21,
            color: Colors.black,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  SelectableText _summary(BuildContext context) {
    return SelectableText(
      context.loc.about_me,
      textAlign: TextAlign.justify,
      style: GoogleFonts.montserrat(
        fontSize: 17,
        color: Colors.black,
        letterSpacing: 1,
      ),
    );
  }

  SelectableText _title(BuildContext context) {
    return SelectableText(
      context.loc.about_me_title,
      style: GoogleFonts.montserrat(
        fontSize: 44,
        color: Colors.black,
        letterSpacing: 3,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

int _calculateImageFlex(BuildContext context) {
  return MediaQuery.of(context).size.width < 1368 ? 4 : 2;
}
