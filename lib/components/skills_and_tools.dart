import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/models/skills_and_tools.dart';
import 'package:stephenapolinario_flutter/utils/url_launcher.dart';

class SkillsAndToolWidget extends StatefulWidget {
  final SkillAndTools skillAndTool;
  final double sizedBoxSize, fontSize, spacer, iconSize;

  const SkillsAndToolWidget({
    super.key,
    required this.skillAndTool,
    required this.sizedBoxSize,
    required this.fontSize,
    required this.spacer,
    required this.iconSize,
  });

  @override
  State<SkillsAndToolWidget> createState() => _SkillsAndToolWidgetState();
}

class _SkillsAndToolWidgetState extends State<SkillsAndToolWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationRotate;
  late Animation<double> _animationIconSize;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationRotate = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(_animationController);
    _animationIconSize = Tween<double>(
      begin: widget.iconSize,
      end: widget.iconSize * 1.15,
    ).animate(_animationController);
    _animationOpacity = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double initialIconSize = widget.iconSize;
    setState(() {
      _animationIconSize = Tween<double>(
        begin: initialIconSize,
        end: initialIconSize * 1.15,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      );

      _animationIconSize = Tween<double>(
        begin: initialIconSize,
        end: initialIconSize * 1.15,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      );

      _animationOpacity = Tween<double>(
        begin: 1,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      );
    });
    return AnimatedBuilder(
      animation: _animationRotate,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animationRotate.value,
          child: skill(screenWidth),
        );
      },
    );
  }

  Widget skill(double screenWidth) {
    return SizedBox(
      width: widget.iconSize,
      height: widget.sizedBoxSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _skillLogo(),
          _learning(),
          _skillName(),
        ],
      ),
    );
  }

  MouseRegion _skillLogo() {
    return MouseRegion(
      onEnter: (_) {
        final randomValue =
            (math.Random().nextBool() ? 1 : -1) * (5 * (math.pi / 180));
        _animationRotate = Tween<double>(
          begin: 0,
          end: randomValue,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );

        _animationController.forward();
      },
      onExit: (_) {
        _animationController.reverse();
      },
      cursor: SystemMouseCursors.click,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => myLaunchUrl(url: widget.skillAndTool.url),
            child: SizedBox(
              height: _animationIconSize.value,
              width: _animationIconSize.value,
              child: widget.skillAndTool.logo,
            ),
          );
        },
      ),
    );
  }

  FittedBox _skillName() {
    return FittedBox(
      child: SelectableText(
        widget.skillAndTool.name,
        style: GoogleFonts.montserrat(
          fontSize: widget.fontSize,
          color: Colors.white,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _learning() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return widget.skillAndTool.studying
            ? Opacity(
                opacity: _animationOpacity.value,
                child: Text(
                  context.loc.studying_skill,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 11,
                  ),
                ),
              )
            : SizedBox(height: widget.spacer);
      },
    );
  }
}
