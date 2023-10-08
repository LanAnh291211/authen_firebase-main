import 'package:flutter/material.dart';

class BoxShadows {
  BoxShadows._();

  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 20,
      offset: Offset.zero,
    ),
  ];

  static const List<BoxShadow> top = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> bottomNavigationBar = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 20,
      offset: Offset.zero,
    ),
  ];
}
