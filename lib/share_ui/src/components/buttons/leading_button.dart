import 'package:flutter/material.dart';

import '../../paths/paths.dart';
import '../svg/svg.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({
    Key? key,
    this.onTap,
    this.tintColor,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: onTap ?? () => Navigator.pop(context),
          child: Svg(
            svgPath: SvgPath.arrowLeft,
            color: tintColor,
          ),
        ),
      ),
    );
  }
}
