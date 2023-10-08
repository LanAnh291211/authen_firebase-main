import 'package:flutter/material.dart';

abstract class ButtonStyle {
  ButtonStyle({this.textStyle, this.decoration});

  final TextStyle? textStyle;
  final Decoration? decoration;
}
