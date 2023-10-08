import 'package:flutter/cupertino.dart';

import 'styles/button_style.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key, required this.title, this.onPressed, this.style, this.padding})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: style?.decoration,
      child: CupertinoButton(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 0),
        onPressed: onPressed,
        child: Text(
          title,
          style: style?.textStyle,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
