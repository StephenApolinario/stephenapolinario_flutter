import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';

class MyTextStyle {
  final double fontSize;
  final FontWeight fontWeight;

  MyTextStyle({
    this.fontSize = 18,
    this.fontWeight = FontWeight.w400,
  });

  TextStyle get greyText => GoogleFonts.montserrat(
        color: myGreyColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
