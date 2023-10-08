import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class DayPickerButton extends StatelessWidget {
  const DayPickerButton({
    Key? key,
    required this.isChoosed,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  final bool isChoosed;
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
                color: isChoosed ? AppColors.primary : AppColors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: isChoosed ? AppColors.primary : AppColors.textDisabled,
                )),
            child: isChoosed
                ? const Center(
                    child: Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: 18,
                    ),
                  )
                : null,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyles.componentColumnContent.copyWith(color: AppColors.textDisabled),
          )
        ],
      ),
    );
  }
}
