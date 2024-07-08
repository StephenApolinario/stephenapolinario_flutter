import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class SkillAndTools {
  final String name;
  final SvgPicture logo;
  final bool studying;
  final Uri url;

  SkillAndTools({
    this.studying = false,
    required this.name,
    required this.logo,
    required this.url,
  });
}
