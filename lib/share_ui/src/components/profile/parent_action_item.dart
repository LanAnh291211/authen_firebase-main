import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../text_styles/text_styles.dart';
import '../svg/svg.dart';

class ProfileActionItem extends StatelessWidget {
  const ProfileActionItem({
    Key? key,
    required this.title,
    this.svg,
    this.onTap,
  }) : super(key: key);

  final String title;
  final Svg? svg;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 69,
            child: Center(
              child: svg,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: TextStyles.caption12Regular,
        ),
      ],
    );
  }
}
