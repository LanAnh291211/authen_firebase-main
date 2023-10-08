import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class SummaryTimeSelected extends StatelessWidget {
  final bool? isFlexible;
  final double totalHours;
  final VoidCallback? onPressed;
  final bool? isOnlySitter;
  final VoidCallback? onOnlySitter;
  const SummaryTimeSelected({
    Key? key,
    required this.isFlexible,
    required this.onPressed,
    required this.totalHours,
    this.onOnlySitter,
    this.isOnlySitter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Total hours: ',
                  style: TextStyles.smallBody16Regular,
                ),
                Text(
                  '${totalHours.abs()} ',
                  style: TextStyles.smallBody16Medium.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: AppColors.black, width: 1)),
                    child: Visibility(
                      visible: isFlexible ?? false,
                      child: const Icon(
                        Icons.check,
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Flexible Timing',
                    style: TextStyles.smallBody16Regular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const NoteInforDialog(
                                title: 'Flexible Timing',
                                content: 'Indicates to the sitter that the timing is flexible. You may edit the Service Request after discussing with the sitter.',
                              ));
                    },
                    child: const Svg(svgPath: SvgPath.informationCircle),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: onOnlySitter,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: AppColors.black, width: 1)),
                    child: Visibility(
                      visible: isOnlySitter ?? false,
                      child: const Icon(
                        Icons.check,
                        size: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Selected Sitters Only',
                    style: TextStyles.smallBody16Regular,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => const NoteInforDialog(
                                title: 'Selected Sitters Only',
                                content: 'Select this option if you already have a sitter in mind. Your request will not be listed for all sitters to see.',
                              ));
                    },
                    child: const Svg(svgPath: SvgPath.informationCircle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
