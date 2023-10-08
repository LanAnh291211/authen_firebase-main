import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../paths/svg_path.dart';

class Svg extends StatelessWidget {
  const Svg({
    Key? key,
    required this.svgPath,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  final SvgPath svgPath;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath.assetName,
      height: height,
      width: width,
      color: color,
    );
  }
}
