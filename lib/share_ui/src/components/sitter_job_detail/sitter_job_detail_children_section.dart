import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../text_styles/text_styles.dart';
import '../avatar/avatar.dart';

class SitterJobDetailChildrenSection extends StatelessWidget {
  const SitterJobDetailChildrenSection({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Children',
          style: TextStyles.smallBody16Medium,
        ),
        const SizedBox(height: 8),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: itemBuilder,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: itemCount,
        )
      ],
    );
  }
}

class SitterJobDetailChildrenItem extends StatelessWidget {
  const SitterJobDetailChildrenItem({
    Key? key,
    this.imageUrl,
    required this.string,
  }) : super(key: key);

  final String? imageUrl;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey6,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Avatar(
              imageUrl: imageUrl,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            string,
            style: TextStyles.caption12Medium,
          ),
        ],
      ),
    );
  }
}
