import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stephenapolinario_flutter/models/socials.dart';
import 'package:stephenapolinario_flutter/utils/url_launcher.dart';

class SocialWidget extends StatefulWidget {
  final Social social;
  final double iconMaxSize;

  const SocialWidget({
    super.key,
    required this.social,
    required this.iconMaxSize,
  });

  @override
  State<SocialWidget> createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _iconSizeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _iconSizeAnimation = Tween<double>(
      begin: 45,
      end: widget.iconMaxSize,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => _animationController.forward(),
      onExit: (event) => _animationController.reverse(),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => GestureDetector(
          onTap: () => myLaunchUrl(url: widget.social.url),
          child: Container(
            height: widget.iconMaxSize,
            width: widget.iconMaxSize,
            alignment: Alignment.center,
            child: SizedBox(
              height: _iconSizeAnimation.value,
              width: _iconSizeAnimation.value,
              child: widget.social.logo,
            ),
          ),
        ),
      ),
    );
  }
}
