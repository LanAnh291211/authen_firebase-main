import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

enum NoticeViewType {
  primary(
    crossAxisAlignment: CrossAxisAlignment.start,
    iconColor: AppColors.primary,
    textColor: AppColors.primary,
    textStyle: TextStyles.caption12Medium,
    backgroundColor: AppColors.primaryShade8,
  ),
  secondary(
    crossAxisAlignment: CrossAxisAlignment.start,
    iconColor: AppColors.secondary,
    textColor: AppColors.secondary,
    textStyle: TextStyles.caption12Medium,
    backgroundColor: AppColors.secondaryShade8,
  ),
  third(
    crossAxisAlignment: CrossAxisAlignment.start,
    iconColor: AppColors.secondary,
    textColor: AppColors.secondary,
    textStyle: TextStyles.caption13Regular,
    backgroundColor: AppColors.secondaryShade8,
  ),
  ;

  final CrossAxisAlignment crossAxisAlignment;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  const NoticeViewType({
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.iconColor,
    this.textColor,
    this.textStyle,
    this.backgroundColor,
  });
}

class NoticeView extends StatelessWidget {
  const NoticeView({
    Key? key,
    this.type = NoticeViewType.primary,
    this.svgPath,
    required this.title,
  }) : super(key: key);

  final NoticeViewType type;
  final SvgPath? svgPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: type.backgroundColor,
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        crossAxisAlignment: type.crossAxisAlignment,
        children: [
          if (svgPath != null)
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4),
              child: Svg(
                svgPath: svgPath!,
                color: type.iconColor,
                height: 16,
                width: 16,
              ),
            ),
          Expanded(
            child: Wrap(
              children: [
                Text(
                  title,
                  style: type.textStyle?.copyWith(color: type.textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
