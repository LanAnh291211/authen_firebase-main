import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class MessageImage extends StatelessWidget {
  final String imageUrl;
  final bool mySelf;
  const MessageImage({super.key, required this.imageUrl, required this.mySelf});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: mySelf ? AppColors.grey5 : AppColors.secondaryShade8,
          borderRadius: BorderRadius.only(
              topLeft: mySelf ? const Radius.circular(8) : const Radius.circular(2),
              topRight: mySelf ? const Radius.circular(2) : const Radius.circular(8),
              bottomLeft: const Radius.circular(8),
              bottomRight: const Radius.circular(8))),
      child: InternetImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
