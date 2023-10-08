import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class JobGroupByDate extends StatelessWidget {
  const JobGroupByDate({
    Key? key,
    required this.title,
    required this.itemBuilder,
    required this.itemCount,
    this.status,
    this.jobType,
    required this.isPending,
  }) : super(key: key);

  final String title;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final String? status;
  final String? jobType;
  final bool isPending;

  String? getTypeString() {
    String? text = status?.toLowerCase().trim();

    if (text == 'requested for payment') return 'RFP';
    if (text == 'invited') return 'Requested';

    return '${text?.toUpperCase().substring(0, 1)}${text?.substring(1, null)}';
  }

  String? getJobType() {
    if (jobType == 'recurring') return 'Recurring';
    return 'Just Once';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: BoxShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyles.smallBody16SemiBold,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isPending && status != 'upcoming')
                        Text(
                          getTypeString() ?? '',
                          style: TextStyles.smallBody16Regular.copyWith(color: AppColors.secondary),
                          textAlign: TextAlign.end,
                        ),
                      const SizedBox(
                        width: 12,
                      ),
                      if (status != 'upcoming')
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            getJobType()?.trim() ?? '',
                            style: TextStyles.smallBody16Regular.copyWith(color: AppColors.labelSecondary),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: AppColors.black.withOpacity(0.04),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: itemBuilder,
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  color: AppColors.black.withOpacity(0.04),
                );
              },
              itemCount: itemCount,
            )
          ],
        ));
  }
}

class ServiceRequestCell extends StatelessWidget {
  const ServiceRequestCell({
    Key? key,
    this.imageUrl,
    required this.fullName,
    required this.timeRange,
    required this.addressPath,
    required this.svgPath,
    this.onTap,
  }) : super(key: key);

  final String? imageUrl;
  final String fullName;
  final String timeRange;
  final String addressPath;
  final SvgPath svgPath;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: Avatar(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //2.Infor
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName,
                      maxLines: 1,
                      style: TextStyles.smallBody16SemiBold,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Svg(
                            svgPath: SvgPath.timer,
                            width: 16,
                            height: 16,
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            timeRange,
                            maxLines: 2,
                            style: TextStyles.smallBody16Regular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Svg(
                            svgPath: SvgPath.locationOn,
                            width: 16,
                            height: 16,
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            addressPath,
                            textAlign: TextAlign.start,
                            style: TextStyles.smallBody16Regular.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            GestureDetector(
              //onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.primaryShade4,
                ),
                child: const Svg(
                  svgPath: SvgPath.directionRight,
                  width: 32,
                  height: 32,
                  color: AppColors.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
