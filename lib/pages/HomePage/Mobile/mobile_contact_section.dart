import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stephenapolinario_flutter/components/social.dart';
import 'package:stephenapolinario_flutter/components/styled_input.dart';
import 'package:stephenapolinario_flutter/constants/constants.dart';
import 'package:stephenapolinario_flutter/constants/paddings.dart';
import 'package:stephenapolinario_flutter/constants/socials.dart';
import 'package:stephenapolinario_flutter/extensions/buildcontext/loc.dart';
import 'package:stephenapolinario_flutter/utils/input_validator.dart';
import 'package:http/http.dart' as http;

class MobileContactSection extends StatefulWidget {
  const MobileContactSection({super.key});

  @override
  State<MobileContactSection> createState() => _MobileContactSectionState();
}

class _MobileContactSectionState extends State<MobileContactSection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController messageController;

  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode messageFocusNode;

  bool _submitted = false;
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isMessageValid = false;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    messageController = TextEditingController();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    messageFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: mobileHorizontalPadding(context)),
      child: Column(children: [
        _form(context),
        const SizedBox(height: 20),
        _socials(),
        const SizedBox(height: 20),
      ]),
    );
  }

  Form _form(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            context.loc.contact,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          const SizedBox(height: 20),
          SelectableText(
            context.loc.get_in_touch,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
          const SizedBox(height: 20),
          SelectableText(
            context.loc.sending_hello,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          SelectableText(
            context.loc.fill_info,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          StyledInput(
            controller: nameController,
            focusNode: nameFocusNode,
            submitted: _submitted,
            label: context.loc.input_name,
            validator: InputValidator.name,
            notValidateInputMessage:
                '${context.loc.fill_name} ${nameMinLength.toString()} ${context.loc.chacarecters}',
            onValidationChanged: (isValid) {
              setState(() {
                _isNameValid = isValid;
              });
            },
          ),
          const SizedBox(height: 20),
          StyledInput(
            controller: emailController,
            focusNode: emailFocusNode,
            submitted: _submitted,
            label: context.loc.input_email,
            validator: InputValidator.email,
            notValidateInputMessage: context.loc.fill_email,
            onValidationChanged: (isValid) {
              setState(() {
                _isEmailValid = isValid;
              });
            },
          ),
          const SizedBox(height: 20),
          StyledInput(
            controller: messageController,
            focusNode: messageFocusNode,
            submitted: _submitted,
            label: context.loc.input_message,
            lines: 6,
            validator: InputValidator.text,
            notValidateInputMessage:
                '${context.loc.fill_text} ${textMinLength.toString()} ${context.loc.chacarecters}',
            onValidationChanged: (isValid) {
              setState(() {
                _isMessageValid = isValid;
              });
            },
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate() &&
                    _isNameValid &&
                    _isEmailValid &&
                    _isMessageValid) {
                  setState(() {
                    _submitted = false;
                  });
                  _sendFormData();
                } else {
                  setState(() {
                    _submitted = true;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 48),
              ),
              child: Text(
                context.loc.send,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendFormData() async {
    final response = await http.post(
      Uri.parse('https://formspree.io/f/myyrrebg'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': nameController.text,
        'email': emailController.text,
        'message': messageController.text,
      }),
    );

    if (!mounted) return;

    if (response.statusCode == 200) {
      _thankYouDialog();
    }
  }

  Future<dynamic> _thankYouDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 350,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                Text(
                  context.loc.thank_you,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  context.loc.message_sent,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                Text(
                  context.loc.excited_text,
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                    emailFocusNode.unfocus();
                    nameFocusNode.unfocus();
                    messageFocusNode.unfocus();
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    backgroundColor: Colors.grey.shade900,
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column _socials() {
    return Column(
      children: [
        SelectableText(
          context.loc.feeling_social,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 50,
          runSpacing: 8.0,
          alignment: WrapAlignment.center,
          children: socialsList
              .map(
                (social) => SocialWidget(
                  social: social,
                  iconMaxSize: 30,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
