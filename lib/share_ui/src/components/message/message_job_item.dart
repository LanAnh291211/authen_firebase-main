import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class MessageJobItem extends StatelessWidget {
  final String? createAt;
  final String? status;
  final String? startDateItem;
  final String? endDateItem;
  final bool lastItem;
  final bool selected;
  const MessageJobItem({super.key, this.createAt, this.status, this.startDateItem, this.endDateItem, this.lastItem = false, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      decoration: lastItem ? null : BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.black.withOpacity(0.08), width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    createAt ?? '',
                    style: TextStyles.componentColumnContent.copyWith(letterSpacing: 0.5),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    status ?? '',
                    style: TextStyles.componentColumnContent.copyWith(letterSpacing: 0.5, color: status == 'Pending' ? AppColors.primary : AppColors.tintBlue),
                  ),
                ],
              ),
              Text('${startDateItem ?? ''} - ${endDateItem ?? ''}', style: TextStyles.smallBody16Regular.copyWith(letterSpacing: 0.5, color: AppColors.textSecondary)),
            ],
          ),
          Visibility(
            visible: selected,
            child: const Svg(svgPath: SvgPath.checkedCircle, color: AppColors.primary),
          )
        ],
      ),
    );
  }
}
