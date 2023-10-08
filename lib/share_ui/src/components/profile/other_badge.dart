import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class OtherBadge extends StatelessWidget {
  const OtherBadge({super.key, required this.itemBuilder, required this.itemCount});

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: itemCount > 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Other Badges',
            style: TextStyles.smallBody16Medium.copyWith(color: AppColors.textQuarternary),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(color: AppColors.backgroundPrimary, borderRadius: BorderRadius.circular(8)),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemBuilder: itemBuilder,
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 8);
                },
                itemCount: itemCount),
          )
        ],
      ),
    );
  }
}

class BadgeItem extends StatelessWidget {
  const BadgeItem({
    super.key,
    required this.svgUrl,
    required this.title,
  });
  final String svgUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //const Svg(svgPath: SvgPath.firstAidTrained, color: AppColors.primary),
        SizedBox(
          width: 24,
          height: 24,
          child: CachedNetworkImage(
            imageUrl: svgUrl,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) {
              return Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(Icons.error),
              );
            },
          ),
        ),
        // SvgNetWork(
        //   svgUrl: svgUrl,
        //   height: 24,
        //   width: 24,
        //   color: AppColors.primary,
        // ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyles.smallBody16Regular,
        )
      ],
    );
  }
}
