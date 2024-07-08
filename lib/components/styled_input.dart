import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledInput extends StatefulWidget {
  final bool Function(String) validator;
  final void Function(bool isValid) onValidationChanged;
  final String label, notValidateInputMessage;
  final int lines;
  final bool submitted;
  final TextEditingController controller;
  final FocusNode focusNode;

  const StyledInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.submitted,
    required this.label,
    required this.validator,
    required this.notValidateInputMessage,
    required this.onValidationChanged,
    this.lines = 1,
  });

  @override
  State<StyledInput> createState() => _StyledInputState();
}

class _StyledInputState extends State<StyledInput>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _hintSizeAnimation;
  late Animation _hintPositionAnimation;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_handleFocusChange);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _hintSizeAnimation = Tween<double>(
      begin: 16,
      end: 13,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _hintPositionAnimation = Tween<double>(
      begin: 16,
      end: 2,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant StyledInput oldWidget) {
    _handleFocusChange();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_handleFocusChange);
    _animationController.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {
      isFocused =
          widget.focusNode.hasFocus || widget.controller.text.isNotEmpty;
    });
    isFocused ? _animationController.forward() : _animationController.reverse();
  }

  void _handleValidation() {
    widget.onValidationChanged(
      widget.controller.text.isNotEmpty &&
          widget.validator(widget.controller.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Stack(
        children: [
          _myTextFormField(),
          _myHintTextField(context),
        ],
      ),
    );
  }

  TextFormField _myTextFormField() {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      textAlignVertical: TextAlignVertical.bottom,
      maxLines: widget.lines,
      minLines: widget.lines,
      autovalidateMode: widget.submitted
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      validator: (value) {
        if (widget.submitted &&
            (value == null || value.isEmpty || !widget.validator(value))) {
          return widget.notValidateInputMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        errorMaxLines: 2,
        hoverColor: Colors.transparent,
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color:
                widget.controller.text.isNotEmpty ? Colors.green : Colors.black,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.only(
          bottom: 16,
          left: 24,
          top: widget.lines > 1 ? 32 : 28,
        ),
      ),
      onChanged: (value) {
        setState(() {});
        _handleValidation();
      },
    );
  }

  Positioned _myHintTextField(BuildContext context) {
    return Positioned(
      left: 11.0,
      top: _hintPositionAnimation.value,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(widget.focusNode),
        child: MouseRegion(
          cursor: SystemMouseCursors.text,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.label,
                    style: GoogleFonts.montserrat(
                      color: isFocused ? Colors.green : Colors.grey,
                      fontSize: _hintSizeAnimation.value,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity:
                              widget.validator(widget.controller.text) ? 0 : 1,
                          child: Text(
                            '*',
                            style: GoogleFonts.montserrat(
                              color: Colors.red,
                              fontSize: _hintSizeAnimation.value,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
