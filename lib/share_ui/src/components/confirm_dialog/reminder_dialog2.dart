import 'package:flutter/material.dart';

import '../../../shared_ui.dart' as shareui;

class ReminderDialog2 extends StatelessWidget {
  const ReminderDialog2(
      {super.key,
      this.title,
      this.subTitle,
      this.subTitleAlign,
      this.onPressed,
      this.buttonTitle,
      this.buttonStyle});
  final String? title;
  final String? subTitle;
  final String? buttonTitle;
  final TextAlign? subTitleAlign;
  final VoidCallback? onPressed;
  final shareui.ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: shareui.AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? 'Reminder',
                style: shareui.TextStyles.largeBody18SemiBold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                subTitle ?? '',
                style: shareui.TextStyles.smallBody16Regular,
                textAlign: subTitleAlign ?? TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 36,
                width: 55,
                child: shareui.Button(
                  title: 'OK',
                  style: buttonStyle ?? shareui.FlatButtonStyles.primary,
                  onPressed: onPressed ??
                      () {
                        Navigator.of(context).pop();
                      },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
