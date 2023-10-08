import 'package:flutter/material.dart';

import '../../../colors/colors.dart';
import '../../../text_styles/text_styles.dart';

class TextFieldStyle {
  const TextFieldStyle({
    this.decoration,
    this.textStyle,
    this.placeholderTextStyle,
  });

  final Decoration? decoration;
  final TextStyle? textStyle;
  final TextStyle? placeholderTextStyle;
}

class TextFieldStyles {
  TextFieldStyles._();

  static TextFieldStyle get primary => TextFieldStyle(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.otherStroke,
          ),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.backgroundPrimary,
        ),
        textStyle: TextStyles.componentTextfield,
        placeholderTextStyle: TextStyles.componentTextfield.copyWith(
          color: AppColors.textPlaceholder,
        ),
      );
  static TextFieldStyle get primary2 => TextFieldStyle(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.otherStroke,
          ),
          borderRadius: BorderRadius.circular(4),
          color: AppColors.backgroundPrimary,
        ),
        textStyle: TextStyles.componentTextfield,
        placeholderTextStyle: TextStyles.componentTextfield.copyWith(
          color: AppColors.textPlaceholder,
        ),
      );

  static TextFieldStyle get invalid => TextFieldStyle(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.tintRed,
          ),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.backgroundPrimary,
        ),
        textStyle: TextStyles.componentTextfield,
        placeholderTextStyle: TextStyles.componentTextfield.copyWith(
          color: AppColors.textPlaceholder,
        ),
      );

  static TextFieldStyle get verified => TextFieldStyle(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.otherStroke,
          ),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.otherDisableShade50,
        ),
        textStyle: TextStyles.componentTextfield,
        placeholderTextStyle: TextStyles.componentTextfield.copyWith(
          color: AppColors.textPlaceholder,
        ),
      );

  static TextFieldStyle get regionSelect => TextFieldStyle(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.labelSecondary,
          ),
          borderRadius: BorderRadius.circular(4),
          color: AppColors.white,
        ),
        textStyle: TextStyles.componentTextfield,
        placeholderTextStyle: TextStyles.componentTextfield.copyWith(
          color: AppColors.textPlaceholder,
        ),
      );
}
