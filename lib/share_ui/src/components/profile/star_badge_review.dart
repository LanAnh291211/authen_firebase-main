import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class StarBadgeReview extends StatelessWidget {
  const StarBadgeReview({
    Key? key,
    required this.starSitterBadge,
    this.isReviews = false,
    this.starSize = 12,
    this.spaceStar = 4,
    this.spaceStarAndText = 4,
    this.styleStarBadge,
  }) : super(key: key);

  final double starSitterBadge;
  final bool isReviews;
  final double starSize;
  final double spaceStar;
  final double spaceStarAndText;
  final TextStyle? styleStarBadge;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: starSize,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: 5,
          ),
        ),
        SizedBox(width: spaceStarAndText),
        Text(
          starSitterBadge.toStringAsFixed(1),
          style: styleStarBadge ?? TextStyles.caption10Regular.copyWith(color: AppColors.textTertiary),
        ),
      ],
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Icon(
      Icons.star,
      size: starSize,
      color: (index >= 0 && index >= starSitterBadge) ? AppColors.grey1 : AppColors.tintYellow,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return SizedBox(width: spaceStar);
  }
}
