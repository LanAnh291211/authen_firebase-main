import 'package:flutter/material.dart';

import '../../paths/paths.dart';
import '../svg/svg.dart';

class AppBottomNavigationBarChatItem extends BottomNavigationBarItem {
  AppBottomNavigationBarChatItem({
    required SvgPath svgPath,
    required SvgPath svgPathSelected,
    required bool readed,
    super.label,
    Color? selectedItemColor,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Svg(
              svgPath: svgPath,
            ),
          ),
          activeIcon: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 4),
            child: Svg(
              svgPath: svgPathSelected,
            ),
          ),
          tooltip: '',
        );
}
