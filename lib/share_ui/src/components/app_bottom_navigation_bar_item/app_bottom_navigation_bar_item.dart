import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../paths/paths.dart';
import '../svg/svg.dart';

class AppBottomNavigationBarItem extends BottomNavigationBarItem {
  AppBottomNavigationBarItem({
    required SvgPath svgPath,
    super.label,
    Color? selectedItemColor,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Svg(
              svgPath: svgPath,
              color: AppColors.labelTertiary,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Svg(
              svgPath: svgPath,
              color: selectedItemColor,
            ),
          ),
          tooltip: '',
        );
}
