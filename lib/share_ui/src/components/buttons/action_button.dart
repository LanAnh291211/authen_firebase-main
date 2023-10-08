import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onTap,
    this.child,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: double.infinity,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
