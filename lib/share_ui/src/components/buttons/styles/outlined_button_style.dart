import 'package:flutter/widgets.dart';

import '../../../colors/colors.dart';
import '../../../text_styles/text_styles.dart';
import 'button_style.dart';

class OutlinedButtonStyle extends ButtonStyle {
  OutlinedButtonStyle({
    TextStyle? textStyle,
    Decoration? decoration,
  }) : super(textStyle: textStyle, decoration: decoration);
}

class OutlinedButtonStyles {
  OutlinedButtonStyles._();

  static OutlinedButtonStyle get primary => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primaryShade50,
          ),
        ),
      );

  static OutlinedButtonStyle get primary2 => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.primaryShade50,
          ),
          color: AppColors.primaryShade4,
        ),
      );

  static OutlinedButtonStyle get secondary => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.secondary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.secondaryShade50,
          ),
        ),
      );

  static OutlinedButtonStyle get secondary2 => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.secondary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.secondaryShade50,
          ),
          color: AppColors.secondaryShade4,
        ),
      );

  static OutlinedButtonStyle get secondary3 => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.secondary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.otherStroke,
          ),
          color: AppColors.white,
        ),
      );

  static OutlinedButtonStyle get white => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.white,
          ),
        ),
      );

  static OutlinedButtonStyle get disable => OutlinedButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.textDisabled,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.otherDisableShade50,
          ),
        ),
      );
}
