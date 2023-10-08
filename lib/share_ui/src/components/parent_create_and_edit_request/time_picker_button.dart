import 'package:flutter/cupertino.dart';

import '../../../shared_ui.dart';

// ignore: must_be_immutable
class TimePickerButton extends StatelessWidget {
  final String title;
  String selectedTime;
  dynamic onPressed;
  Color? textColor;
  TimePickerButton({
    Key? key,
    required this.title,
    required this.selectedTime,
    this.onPressed,
    this.textColor,
  }) : super(key: key);

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
                child: Text(selectedTime,
                    style: selectedTime == title
                        ? TextStyles.componentTextfield.copyWith(
                            color: AppColors.textQuarternary,
                          )
                        : TextStyles.componentTextfield.copyWith(color: textColor ?? AppColors.textPrimary, overflow: TextOverflow.ellipsis))),
            const Svg(
              svgPath: SvgPath.directionDown,
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
