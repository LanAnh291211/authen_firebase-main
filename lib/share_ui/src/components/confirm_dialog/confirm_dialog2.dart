import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

enum ConfirmTypeAt { parent, sitter }

class ConfirmDialog2 extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final VoidCallback? onPressLastButton;
  final VoidCallback? onPressFirstButton;
  final String? firstButtonTitle;
  final String? lastButtonTitle;
  final Color? colorButtonLast;

  const ConfirmDialog2({
    super.key,
    this.title,
    this.subTitle,
    this.onPressLastButton,
    this.onPressFirstButton,
    this.firstButtonTitle,
    this.lastButtonTitle,
    this.colorButtonLast,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: AppColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? 'Confirm dialog',
                  style: TextStyles.largeBody18SemiBold,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  subTitle ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyles.smallBody16Regular
                      .copyWith(color: AppColors.labelSecondary),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 44,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 36,
                        width: 100,
                        child: Button(
                          title: firstButtonTitle ?? 'First Button',
                          style: FlatButtonStyle(
                            textStyle: TextStyles.smallBody16Regular.copyWith(
                              color: AppColors.black,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                            ),
                          ),
                          onPressed: onPressFirstButton ??
                              () {
                                Navigator.of(context).pop();
                              },
                        ),
                      ),
                      SizedBox(
                        height: 36,
                        width: 100,
                        child: Button(
                          title: lastButtonTitle ?? 'Last Button',
                          style: FlatButtonStyle(
                            textStyle: TextStyles.smallBody16SemiBold.copyWith(
                              color: AppColors.white,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: colorButtonLast ?? AppColors.primary,
                            ),
                          ),
                          onPressed: onPressLastButton ??
                              () {
                                Navigator.of(context).pop();
                              },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
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
