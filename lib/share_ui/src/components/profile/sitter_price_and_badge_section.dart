import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class SitterPriceAndBadgeSection extends StatelessWidget {
  const SitterPriceAndBadgeSection({
    Key? key,
    //required this.profile,
    required this.firstName,
    required this.salaryPerHour,
    required this.svgUrl,
    this.baseColor = AppColors.primary,
    this.isHaveBagde = false,
    this.bagde,
  }) : super(key: key);

  final String firstName;
  final String salaryPerHour;
  final Color baseColor;
  final bool isHaveBagde;
  final String? bagde;
  final String svgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: AppColors.backgroundPrimary, borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Rate',
                  style: TextStyles.caption12Regular.copyWith(color: AppColors.textTertiary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'S\$$salaryPerHour',
                        style: TextStyles.largeBody18Medium.copyWith(color: baseColor),
                      ),
                      TextSpan(
                        text: '/hour',
                        style: TextStyles.largeBody18Medium.copyWith(color: AppColors.textTertiary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isHaveBagde) const SizedBox(width: 12),
        Visibility(
          visible: isHaveBagde,
          child: Expanded(
            child: Container(
              width: isHaveBagde ? (MediaQuery.of(context).size.width / 2) - 20 - 6 : null,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.backgroundPrimary, borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 32,
                    height: 35,
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
                  //   height: 35,
                  //   width: 32,
                  // ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$firstName is a',
                          style: TextStyles.caption12Regular.copyWith(color: AppColors.textTertiary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          bagde ?? '',
                          style: TextStyles.largeBody18Medium.copyWith(color: baseColor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
