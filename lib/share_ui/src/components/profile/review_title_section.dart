import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class ReviewTitleSection extends StatelessWidget {
  const ReviewTitleSection({
    super.key,
    required this.reviewCount,
    required this.repeatCount,
    required this.rating,
    required this.hoursWorked,
  });
  final int reviewCount;
  final int repeatCount;
  final double rating;
  final double hoursWorked;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: AppColors.backgroundPrimary,
              borderRadius: BorderRadius.circular(2)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StarBadgeReview(
                      starSitterBadge: rating,
                      starSize: 16,
                      styleStarBadge: TextStyles.caption12Medium,
                    ),
                    Text(
                      '$reviewCount Reviews, $repeatCount Repeated',
                      style: TextStyles.caption12Regular
                          .copyWith(color: AppColors.textTertiary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                width: 1,
                height: 36,
                color: AppColors.separatorOpaque,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$hoursWorked',
                    style: TextStyles.caption12Medium
                        .copyWith(color: AppColors.textPrimary),
                  ),
                  Text(
                    'Total Hours',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.caption12Regular
                        .copyWith(color: AppColors.textTertiary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
