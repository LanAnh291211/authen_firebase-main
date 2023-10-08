import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles/text_field_style.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.placeholder,
    this.focusNode,
    this.controller,
    this.textFieldStyle,
    this.obscureText = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.validator,
    this.enabled,
    this.onChanged,
    this.onSaved,
    this.errorText,
    this.inputFormatters,
    this.prefix,
    this.initialValue,
    this.maxLines = 1,
  }) : super(key: key);

  final String? placeholder;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextFieldStyle? textFieldStyle;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final Widget? suffix;

  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: textFieldStyle?.decoration,
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        textAlign: textAlign,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          errorText: errorText,
          border: InputBorder.none,
          hintText: placeholder,
          hintStyle: textFieldStyle?.placeholderTextStyle,
          suffixIcon: suffix,
          suffixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
          prefixIcon: prefix,
        ),
        focusNode: focusNode,
        style: textFieldStyle?.textStyle,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        enabled: enabled,
        onChanged: onChanged,
        maxLines: maxLines,
        onSaved: onSaved,
      ),
    );
  }
}
