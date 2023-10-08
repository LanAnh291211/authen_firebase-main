import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class SitterSelectButton extends StatelessWidget {
  const SitterSelectButton({
    Key? key,
    required this.isSelected,
  }) : super(key: key);
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 32,
      width: 86,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryShade20 : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: isSelected
          ? const Svg(
              svgPath: SvgPath.check,
              color: AppColors.primary,
            )
          : Text(
              'Select',
              style: TextStyles.smallBody16Medium.copyWith(color: textColor),
              textAlign: TextAlign.center,
            ),
    );
  }

  Color get textColor {
    if (!isSelected) {
      return AppColors.primary;
    } else {
      return AppColors.textTertiary;
    }
  }

  Color get borderColor {
    if (isSelected) {
      return AppColors.primaryShade50;
    } else {
      return AppColors.primaryShade20;
    }
  }
}
