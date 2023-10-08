import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../paths/image_path.dart';
import '../../paths/svg_path.dart';
import '../../text_styles/text_styles.dart';
import '../svg/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.onTap,
    this.imagePath,
    required this.title,
    this.svgPath,
    this.svgColor,
    this.onTapIcon,
  });

  final GestureTapCallback? onTap;
  final ImagePath? imagePath;
  final String title;
  final SvgPath? svgPath;
  final Color? svgColor;
  final GestureTapCallback? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        padding: const EdgeInsets.only(left: 20, right: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.otherStroke),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 8),
                child: Image.asset(imagePath!.assetName),
              ),
            Text(
              title,
              style: TextStyles.largeBody18Medium,
            ),
            const Spacer(),
            if (svgPath != null)
              GestureDetector(
                onTap: onTapIcon,
                child: Svg(
                  svgPath: svgPath!,
                  color: svgColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
