import 'package:flutter/material.dart';

import '../../box_shadows/box_shadows.dart';
import '../../colors/colors.dart';
import '../../paths/svg_path.dart';
import '../../text_styles/text_styles.dart';
import '../buttons/button.dart';
import '../buttons/styles/flat_button_style.dart';
import '../svg/svg.dart';

class ForceUpdateDialog extends StatelessWidget {
  const ForceUpdateDialog._({
    this.onPressed,
    required this.isParent,
  });

  static show(
    BuildContext context, {
    required bool barrierDismissible,
    required bool isParent,
    VoidCallback? onPressed,
  }) =>
      showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => ForceUpdateDialog._(
          onPressed: onPressed,
          isParent: isParent,
        ),
      );

  final VoidCallback? onPressed;
  final bool isParent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(35, 35, 35, 30),
        decoration: BoxDecoration(
          color: isParent ? AppColors.primary : AppColors.secondary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: BoxShadows.card,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Svg(
              svgPath: SvgPath.information,
              height: 66,
              color: AppColors.white,
            ),
            const SizedBox(height: 24),
            Text(
              'New version is\navailable',
              textAlign: TextAlign.center,
              style:
                  TextStyles.title24SemiBold.copyWith(color: AppColors.white),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: 259,
              child: Button(
                title: 'Update Now',
                style: FlatButtonStyle(
                  textStyle: TextStyles.componentButton.copyWith(
                    color: isParent ? AppColors.primary : AppColors.secondary,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.white,
                  ),
                ),
                onPressed: onPressed ?? () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
