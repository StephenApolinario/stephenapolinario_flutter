import 'package:url_launcher/url_launcher.dart';

Future<void> myLaunchUrl({required Uri url}) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
