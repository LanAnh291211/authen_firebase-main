import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class NoteInforDialog extends StatelessWidget {
  const NoteInforDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Material(
          color: AppColors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
              Text(
                title,
                style: TextStyles.caption13SemiBold.copyWith(color: AppColors.white),
              ),
              Text(
                content,
                style: TextStyles.caption13Regular.copyWith(color: AppColors.white),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
