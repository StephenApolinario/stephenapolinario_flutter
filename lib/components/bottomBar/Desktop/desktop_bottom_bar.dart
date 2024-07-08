import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/constants/colors.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';

class DesktopBottomBar extends StatelessWidget {
  const DesktopBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bottomBarColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.copyright,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 10),
            Text(
              context.loc.bottom_bar,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
