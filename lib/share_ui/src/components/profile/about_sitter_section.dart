import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class AboutSitterSection extends StatefulWidget {
  const AboutSitterSection(
    this.content, {
    Key? key,
    this.trimLines = 4,
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
  State<AboutSitterSection> createState() => _AboutSitterSectionState();
}

class _AboutSitterSectionState extends State<AboutSitterSection> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final contentText = TextSpan(
          style: widget.style,
          text: widget.content,
        );

        TextPainter textPainter = TextPainter(
          text: contentText,
          textAlign: widget.textAlign ?? TextAlign.start,
          textDirection: widget.textDirection ?? Directionality.of(context),
          maxLines: widget.trimLines,
          ellipsis: '...',
        );

        // Layout and measure text
        // textPainter.text = contentText;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final layoutSize = textPainter.size;

        // Get the endIndex of content
        int endIndex;

        //Text Position (end widheight)
        final pos = textPainter.getPositionForOffset(Offset(
          layoutSize.width,
          layoutSize.height,
        ));
        //count characters in 3 lines.
        endIndex = textPainter.getOffsetBefore(pos.offset) ?? 0;

        bool isOverMaxline = textPainter.didExceedMaxLines;

        TextSpan textSpan;
        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: isReadMore ? widget.content : widget.content.substring(0, endIndex),
            children: <TextSpan>[TextSpan(text: isReadMore ? '' : '...')],
            style: widget.style,
          );
        } else {
          textSpan = TextSpan(
            style: widget.style,
            text: widget.content,
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'About me',
              style: TextStyles.smallBody16Medium.copyWith(color: AppColors.textQuarternary),
            ),
            const SizedBox(height: 12),
            RichText(
              textAlign: widget.textAlign ?? TextAlign.start,
              textDirection: widget.textDirection,
              softWrap: true,
              overflow: TextOverflow.clip,
              text: textSpan,
            ),
            const SizedBox(height: 8),
            Visibility(
              visible: isOverMaxline,
              child: InkWell(
                onTap: () {
                  setState(() {
                    isReadMore = !isReadMore;
                  });
                },
                child: Container(
                  height: 31,
                  color: AppColors.secondaryShade8,
                  child: isReadMore
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Read Less',
                              style: TextStyles.caption12Medium.copyWith(color: AppColors.secondary),
                            ),
                            const Svg(
                              svgPath: SvgPath.directionUp,
                              width: 24,
                              height: 24,
                              color: AppColors.secondary,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Read More',
                              style: TextStyles.caption12Medium.copyWith(color: AppColors.secondary),
                            ),
                            const Svg(
                              svgPath: SvgPath.directionDown,
                              width: 24,
                              height: 24,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
