import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class MediaButton extends StatelessWidget {
  final SvgPath svgPath;
  final String name;
  final Function()? onTap;
  const MediaButton({super.key, required this.svgPath, required this.name, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(4)),
            child: Svg(svgPath: svgPath),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(name, style: TextStyles.componentColumnContent.copyWith(letterSpacing: 0.05, color: AppColors.textTertiary))
        ],
      ),
    );
  }
}
