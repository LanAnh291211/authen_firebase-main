import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    Key? key,
    this.imageUrl,
    this.starSitterBadge,
    required this.firstName,
    this.repeatBooking,
    this.contentReview,
    required this.reviewDate,
    this.isAnonymous = false,
  }) : super(key: key);
  final String? imageUrl;
  final String? starSitterBadge;
  final String firstName;
  final String? repeatBooking;
  final String? contentReview;
  final String reviewDate;
  final bool isAnonymous;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: Avatar(
            imageUrl: isAnonymous ? '' : imageUrl,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                !isAnonymous ? firstName : 'Anonymous',
                style: TextStyles.caption12Medium.copyWith(color: AppColors.textTertiary),
              ),
              const SizedBox(height: 8),
              StarBadgeReview(
                starSitterBadge: double.parse(starSitterBadge ?? '5'),
              ),
              if (!isAnonymous) ...[
                if (_stringIsNotEmpty(repeatBooking)) ...[
                  const SizedBox(height: 8),
                  Text(
                    'Repeat bookings: $repeatBooking',
                    style: TextStyles.smallBody16Regular.copyWith(color: AppColors.textTertiary),
                  ),
                ],
              ],
              if (_stringIsNotEmpty(contentReview)) ...[
                const SizedBox(height: 8),
                ShowReadMoreText(
                  contentReview ?? '',
                  trimLines: 2,
                ),
              ],
              const SizedBox(height: 8),
              Text(
                reviewDate,
                style: TextStyles.caption12Regular.copyWith(color: AppColors.textQuarternary),
              ),
            ],
          ),
        ),
      ],
    );
  }

  bool _stringIsNotEmpty(String? content) {
    return (content != null) && (content.trim().isNotEmpty);
  }
}
