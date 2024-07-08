import 'package:flutter_svg/svg.dart' show SvgPicture;

class Social {
  final String name;
  final Uri url;
  final SvgPicture logo;

  Social({
    required this.name,
    required this.url,
    required this.logo,
  });
}
