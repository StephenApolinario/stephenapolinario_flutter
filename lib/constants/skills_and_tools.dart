import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:stephenapolinario_flutter/gen/assets.gen.dart' show Assets;
import 'package:stephenapolinario_flutter/models/skills_and_tools.dart';

final mysqlSkill = SkillAndTools(
    name: 'MySQL',
    logo: SvgPicture.asset(
      Assets.icons.mysql,
    ),
    url: Uri.parse("https://www.mysql.com/"));

final mongoSkill = SkillAndTools(
  name: 'MongoDB',
  logo: SvgPicture.asset(
    Assets.icons.mongo,
  ),
  url: Uri.parse("https://www.mongodb.com/"),
);

final htmlSkill = SkillAndTools(
  name: 'HTML5',
  logo: SvgPicture.asset(
    Assets.icons.html,
  ),
  url: Uri.parse("https://developer.mozilla.org/en-US/docs/Glossary/HTML5"),
);

final cssSkill = SkillAndTools(
  name: 'CSS3',
  logo: SvgPicture.asset(
    Assets.icons.css,
  ),
  url: Uri.parse("https://developer.mozilla.org/en-US/docs/Web/CSS"),
);

final javascriptSkill = SkillAndTools(
  name: 'Javascript',
  logo: SvgPicture.asset(
    Assets.icons.js,
  ),
  url: Uri.parse("https://developer.mozilla.org/en-US/docs/Web/JavaScript"),
);

final gitSkill = SkillAndTools(
  name: 'Git',
  logo: SvgPicture.asset(
    Assets.icons.git,
  ),
  url: Uri.parse("https://git-scm.com/"),
);

final phpSkill = SkillAndTools(
  name: 'PHP',
  logo: SvgPicture.asset(
    Assets.icons.php,
  ),
  url: Uri.parse("https://www.php.net/"),
);

final laravelSkill = SkillAndTools(
  name: 'Laravel',
  logo: SvgPicture.asset(
    Assets.icons.laravel,
  ),
  url: Uri.parse("https://laravel.com/"),
);

final dartSkill = SkillAndTools(
  name: 'Dart',
  logo: SvgPicture.asset(
    Assets.icons.dart,
  ),
  url: Uri.parse("https://dart.dev/"),
);

final flutterSkill = SkillAndTools(
    name: 'Flutter',
    logo: SvgPicture.asset(
      Assets.icons.flutter,
    ),
    url: Uri.parse("https://flutter.dev/"));

final pythonSkill = SkillAndTools(
  name: 'Python',
  logo: SvgPicture.asset(
    Assets.icons.python,
  ),
  url: Uri.parse("https://www.python.org/"),
);

final nodeSkill = SkillAndTools(
  name: 'NodeJS',
  logo: SvgPicture.asset(
    Assets.icons.node,
  ),
  url: Uri.parse("https://nodejs.org/"),
);

final tailwindSkill = SkillAndTools(
  name: 'Tailwind',
  logo: SvgPicture.asset(
    Assets.icons.tailwind,
  ),
  url: Uri.parse("https://tailwindcss.com/"),
  studying: true,
);

final awsSkill = SkillAndTools(
  name: 'AWS',
  logo: SvgPicture.asset(
    Assets.icons.aws,
  ),
  url: Uri.parse("https://aws.amazon.com/"),
  studying: true,
);

final List<SkillAndTools> skillsAndToolsList = [
  mysqlSkill,
  mongoSkill,
  htmlSkill,
  cssSkill,
  javascriptSkill,
  gitSkill,
  phpSkill,
  laravelSkill,
  dartSkill,
  flutterSkill,
  pythonSkill,
  nodeSkill,
  tailwindSkill,
  awsSkill,
];
