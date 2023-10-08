import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../text_styles/text_styles.dart';
import '../svg/svg.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    Key? key,
    required this.title,
    this.titleColor,
    this.svg,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final Svg? svg;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 52,
        color: AppColors.white,
        child: Row(
          children: [
            Text(
              title,
              style: TextStyles.smallBody16Regular.copyWith(color: titleColor),
            ),
            const Spacer(),
            SizedBox(
              width: 24,
              height: 24,
              child: svg,
            ),
          ],
        ),
      ),
    );
  }
}
