import 'package:email_validator/email_validator.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';

class InputValidator {
  static bool name(String text) {
    return text.length > nameMinLength;
  }

  static bool email(String text) {
    return EmailValidator.validate(text);
  }

  static bool text(String text) {
    return text.length > textMinLength;
  }
}
