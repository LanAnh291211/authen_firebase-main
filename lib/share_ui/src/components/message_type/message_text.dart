import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class MessageText extends StatelessWidget {
  final String content;
  final bool mySelf;
  const MessageText({super.key, required this.content, required this.mySelf});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: mySelf ? AppColors.grey5 : AppColors.secondaryShade8,
          borderRadius: BorderRadius.only(
              topLeft: mySelf ? const Radius.circular(8) : const Radius.circular(2),
              topRight: mySelf ? const Radius.circular(2) : const Radius.circular(8),
              bottomLeft: const Radius.circular(8),
              bottomRight: const Radius.circular(8))),
      child: Text(content, style: TextStyles.smallBody16Regular.copyWith(letterSpacing: 0.5, height: 1.2)),
    );
  }
}
