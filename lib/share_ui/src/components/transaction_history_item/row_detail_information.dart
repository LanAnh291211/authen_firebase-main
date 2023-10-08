import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class RowDetailInformation extends StatelessWidget {
  const RowDetailInformation({
    super.key,
    required this.tilte,
    required this.content,
    this.textStyleTilte = TextStyles.smallBody16Regular,
    this.textStyleContent = TextStyles.smallBody16Regular,
  });
  final String tilte;
  final String content;
  final TextStyle textStyleTilte;
  final TextStyle textStyleContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tilte,
          style: textStyleTilte,
          maxLines: 1,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            content,
            style: textStyleContent,
            overflow: TextOverflow.visible,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
