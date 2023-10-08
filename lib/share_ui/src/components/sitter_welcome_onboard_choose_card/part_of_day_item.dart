import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class PartOfDayItem extends StatelessWidget {
  final bool isSelected;
  final PartOfDay partOfDay;
  final Function(PartOfDay) onTap;

  const PartOfDayItem({
    super.key,
    required this.isSelected,
    required this.partOfDay,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(partOfDay),
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.otherStroke,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5)),
        height: 50,
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 22,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  partOfDay.text,
                  style: TextStyles.caption12Medium
                      .copyWith(color: AppColors.textPrimary),
                ),
                Text(
                  partOfDay.value,
                  style: TextStyles.caption13Regular
                      .copyWith(color: AppColors.textSecondary),
                )
              ],
            ),
            const Spacer(),
            Svg(
              svgPath: SvgPath.solidCheckCircle,
              color: isSelected ? AppColors.tintGreen : AppColors.otherStroke,
            ),
            const SizedBox(
              width: 22,
            ),
          ],
        )),
      ),
    );
  }
}
