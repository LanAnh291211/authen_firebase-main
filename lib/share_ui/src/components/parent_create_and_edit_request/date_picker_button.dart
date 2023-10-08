import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

// ignore: must_be_immutable
class DatePickerButton extends StatelessWidget {
  final String title;
  String selectedDate;
  dynamic onPressed;
  final SvgPath? svgPath;
  final Color? textColor;

  DatePickerButton({Key? key, required this.title, required this.selectedDate, this.onPressed, this.textColor, this.svgPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(color: AppColors.backgroundPrimary, borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.black.withOpacity(0.08))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(selectedDate,
                  style: selectedDate == title
                      ? TextStyles.componentTextfield.copyWith(
                          color: AppColors.textQuarternary,
                        )
                      : TextStyles.componentTextfield.copyWith(color: textColor ?? AppColors.textPrimary, overflow: TextOverflow.ellipsis)),
            ),
            if (svgPath != null)
              const Svg(
                svgPath: SvgPath.calendar,
                height: 24,
                width: 24,
              ),
          ],
        ),
      ),
    );
  }
}
