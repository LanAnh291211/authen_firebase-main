import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class ShowReadMoreText extends StatefulWidget {
  const ShowReadMoreText(
    this.content, {
    Key? key,
    this.trimLines = 3,
    this.style = TextStyles.smallBody16Regular,
    this.textAlign,
    this.textDirection,
    this.moreStyle,
  }) : super(key: key);

  final int trimLines;
  final String content;
  final TextStyle style;
  final TextStyle? moreStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;

  @override
  State<ShowReadMoreText> createState() => _ShowReadMoreTextState();
}

class _ShowReadMoreTextState extends State<ShowReadMoreText> {
  bool isReadMore = false;

  void _onTapLink() {
    setState(() {
      isReadMore = !isReadMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextSpan link = TextSpan(
      text: isReadMore ? 'Read Less' : ' Read More',
      style: widget.moreStyle ?? TextStyles.smallBody16Regular.copyWith(color: AppColors.secondary),
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    TextSpan delimiter = TextSpan(
      text: isReadMore ? '\n' : '...',
      style: widget.style,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final contentcontent = TextSpan(
          style: widget.style,
          text: widget.content,
        );

        TextPainter textPainter = TextPainter(
          text: link,
          textAlign: widget.textAlign ?? TextAlign.start,
          textDirection: widget.textDirection ?? Directionality.of(context),
          maxLines: widget.trimLines,
          ellipsis: '...',
        );
        textPainter.layout(minWidth: 0, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        // Layout and measure text
        textPainter.text = contentcontent;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        // Get the endIndex of content
        int endIndex;

        if (linkSize.width < maxWidth) {
          final readMoreSize = linkSize.width + 3;
          final pos = textPainter.getPositionForOffset(Offset(
            widget.textDirection == TextDirection.rtl ? readMoreSize : textSize.width - readMoreSize,
            textSize.height,
          ));
          endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;
        } else {
          var pos = textPainter.getPositionForOffset(
            textSize.bottomLeft(Offset.zero),
          );
          endIndex = pos.offset;
        }

        TextSpan textSpan;

        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: isReadMore ? widget.content : widget.content.substring(0, endIndex),
            children: <TextSpan>[delimiter, link],
            style: widget.style,
          );
        } else {
          textSpan = TextSpan(
            style: widget.style,
            text: widget.content,
          );
        }

        return RichText(
          textAlign: widget.textAlign ?? TextAlign.start,
          textDirection: widget.textDirection,
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );
    return result;
  }
}
