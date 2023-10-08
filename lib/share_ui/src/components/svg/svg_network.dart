import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgNetWork extends StatelessWidget {
  const SvgNetWork({
    Key? key,
    required this.svgUrl,
    this.height,
    this.width,
    this.color,
  }) : super(key: key);

  final String? svgUrl;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return svgUrl?.isNotEmpty ?? false
        ? SizedBox(
            height: height,
            width: width,
            child: SvgPicture.network(
              svgUrl!,
              color: color,
              placeholderBuilder: (BuildContext context) => Container(
                  padding: const EdgeInsets.all(1.0),
                  child: const CircularProgressIndicator()),
            ),
          )
        : const SizedBox.shrink();
  }
}
