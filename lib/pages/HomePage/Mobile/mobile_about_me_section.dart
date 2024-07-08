import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/constants/named_routes.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/gen/assets.gen.dart';

class MobileAboutMeSection extends StatelessWidget {
  const MobileAboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: mobileHorizontalPadding(context),
        left: mobileHorizontalPadding(context),
        right: mobileHorizontalPadding(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _image(),
          const SizedBox(width: 10),
          _description(
            context: context,
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
          height: 150,
          Assets.images.meAsAvatar.path,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Container _description({
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(context),
          const SizedBox(height: 10),
          _summary(context),
          const SizedBox(height: 20),
          _buttonReadMore(context),
        ],
      ),
    );
  }

  Center _title(BuildContext context) {
    return Center(
      child: SelectableText(
        context.loc.about_me_title,
        style: GoogleFonts.montserrat(
          fontSize: 28,
          color: Colors.black,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  SelectableText _summary(BuildContext context) {
    return SelectableText(
      context.loc.about_me,
      textAlign: TextAlign.justify,
      style: GoogleFonts.montserrat(
        fontSize: 18,
        color: Colors.black,
        letterSpacing: 1,
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
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
