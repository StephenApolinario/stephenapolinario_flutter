import 'package:flutter_svg/svg.dart';
import 'package:stephenapolinario_flutter/gen/assets.gen.dart';
import 'package:stephenapolinario_flutter/models/socials.dart';

final gitHubSocial = Social(
  name: 'Github',
  url: Uri.parse('https://github.com/stephenapolinario'),
  logo: SvgPicture.asset(
    Assets.icons.github,
  ),
);

final instagramSocial = Social(
  name: 'Instagram',
  url: Uri.parse('https://www.instagram.com/stephenmiichael'),
  logo: SvgPicture.asset(
    Assets.icons.instagram,
  ),
);

final linkedinSocial = Social(
  name: 'Linkedin',
  url: Uri.parse(('https://www.linkedin.com/in/stephenapolinario')),
  logo: SvgPicture.asset(
    Assets.icons.linkedin,
  ),
);

final List<Social> socialsList = [
  gitHubSocial,
  instagramSocial,
  linkedinSocial,
];
