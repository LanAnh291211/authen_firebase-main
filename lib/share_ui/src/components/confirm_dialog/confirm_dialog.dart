import 'package:flutter/material.dart';

import '../../../shared_ui.dart' as shareui;

class ConfirmDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final TextAlign? textAlign;
  final VoidCallback? onPressLastButton;
  final VoidCallback? onPressFirstButton;
  final String? firstButtonTitle;
  final String? lastButtonTitle;
  final shareui.ButtonStyle? firstButtonStyle;
  final shareui.ButtonStyle? lastButtonStyle;
  const ConfirmDialog({
    super.key,
    this.title,
    this.subTitle,
    this.textAlign,
    this.onPressLastButton,
    this.onPressFirstButton,
    this.firstButtonTitle,
    this.lastButtonTitle,
    this.firstButtonStyle,
    this.lastButtonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: shareui.AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? 'Confirm dialog',
                  style: shareui.TextStyles.largeBody18SemiBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  subTitle ?? '',
                  style: shareui.TextStyles.smallBody16Regular,
                  textAlign: textAlign ?? TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: shareui.Button(
                          title: firstButtonTitle ?? 'Cancel',
                          style: firstButtonStyle ??
                              shareui.FlatButtonStyles.unstyleButton,
                          onPressed: onPressFirstButton ??
                              () {
                                Navigator.of(context).pop();
                              },
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: shareui.Button(
                          title: lastButtonTitle ?? 'Confirm',
                          style: lastButtonStyle ??
                              shareui.FlatButtonStyles.primary,
                          onPressed: onPressLastButton ??
                              () {
                                Navigator.of(context).pop();
                              },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
