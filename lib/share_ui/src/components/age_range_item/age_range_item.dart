import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../paths/svg_path.dart';
import '../../text_styles/text_styles.dart';
import '../svg/svg.dart';

class AgeRangeItem extends StatelessWidget {
  const AgeRangeItem({
    Key? key,
    required this.title,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryShade8
              : AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(8.0),
          border: isSelected
              ? Border.all(color: AppColors.primary, width: 1.0)
              : null,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyles.componentTextfield,
            ),
            const Spacer(),
            isSelected
                ? const Svg(
                    svgPath: SvgPath.solidCheckCircle,
                    color: AppColors.primary,
                  )
                : Svg(
                    svgPath: SvgPath.checkCircle,
                    color: AppColors.black.withOpacity(0.2),
                  ),
          ],
        ),
      ),
    );
  }
}
