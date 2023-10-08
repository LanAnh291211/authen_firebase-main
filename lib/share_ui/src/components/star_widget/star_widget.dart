import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({Key? key, required this.starSitterBadge, this.isReviews = false}) : super(key: key);
  final double starSitterBadge;
  final bool isReviews;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
        itemCount: 5,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Icon(
      Icons.star,
      size: 16,
      color: (index >= 0 && index <= starSitterBadge - 1) ? AppColors.tintYellow : AppColors.grey1,
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const SizedBox(width: 4);
  }
}
