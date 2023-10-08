import 'package:flutter/widgets.dart';

import '../../../colors/colors.dart';
import '../../../text_styles/text_styles.dart';
import 'button_style.dart';

class FlatButtonStyle extends ButtonStyle {
  FlatButtonStyle({
    TextStyle? textStyle,
    Decoration? decoration,
  }) : super(textStyle: textStyle, decoration: decoration);
}

class FlatButtonStyles {
  FlatButtonStyles._();

  static FlatButtonStyle get primary => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary,
        ),
      );

  static FlatButtonStyle get primary2 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryDark,
        ),
      );

  static FlatButtonStyle get primary3 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryLight,
        ),
      );

  static FlatButtonStyle get secondary => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.secondary,
        ),
      );

  static FlatButtonStyle get secondary2 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.secondaryDark,
        ),
      );

  static FlatButtonStyle get secondary3 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.white,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.secondaryLight,
        ),
      );

  static FlatButtonStyle get secondaryShade50 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.secondary,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryShade50),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
      );

  static FlatButtonStyle get tertiary => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
      );

  static FlatButtonStyle get tertiary2 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.primaryDark,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
      );

  static FlatButtonStyle get tertiary3 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.textDisabled,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
      );
  static FlatButtonStyle get unstyleButton => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.black,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
      );
  static FlatButtonStyle get unstyleTransparent => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.primary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.transparent,
        ),
      );
  static FlatButtonStyle get tertiary4 => FlatButtonStyle(
        textStyle: TextStyles.componentButton.copyWith(
          color: AppColors.secondary,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
      );
}
