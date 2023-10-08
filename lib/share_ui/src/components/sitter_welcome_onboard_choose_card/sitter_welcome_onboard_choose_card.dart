import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

enum PartOfDay {
  morning('Morning', '6AM-12PM'),
  afternoon('Afternoon', '12PM-6PM'),
  evening('Evening', '6PM-12AM'),
  mightnight('Midnight', '12AM-6AM'),
  ;

  final String text;
  final String value;
  const PartOfDay(this.text, this.value);
}

class SitterWelcomeOnboardChooseCard extends StatefulWidget {
  const SitterWelcomeOnboardChooseCard({
    Key? key,
    required this.title,
    this.description,
    required this.onTap,
    required this.listSelectedPart,
    this.isFixed,
    required this.onTapHeaderCheckButton,
  }) : super(key: key);
  final String title;
  final String? description;
  final Function(PartOfDay) onTap;
  final Function() onTapHeaderCheckButton;

  final List<PartOfDay> listSelectedPart;
  final bool? isFixed;
  @override
  State<SitterWelcomeOnboardChooseCard> createState() =>
      _SitterWelcomeOnboardChooseCardState();
}

class _SitterWelcomeOnboardChooseCardState
    extends State<SitterWelcomeOnboardChooseCard> {
  bool isShowTimeBoard = false;

  @override
  Widget build(BuildContext context) {
    return widget.isFixed != true
        ? Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: widget.listSelectedPart.isEmpty
                  ? AppColors.white.withOpacity(0.9)
                  : AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      isShowTimeBoard = !isShowTimeBoard;
                    });
                  },
                  child: SizedBox(
                    height: 65,
                    child: Row(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: widget.onTapHeaderCheckButton,
                          child: Svg(
                            svgPath: SvgPath.solidCheckCircle,
                            color: widget.listSelectedPart.isEmpty
                                ? AppColors.grey1.withOpacity(0.2)
                                : AppColors.tintGreen,
                          ),
                        ),
                        const SizedBox(width: 20),
                        widget.description != null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    widget.title,
                                    style: widget.listSelectedPart.isEmpty
                                        ? TextStyles.largeBody18Medium
                                        : TextStyles.largeBody18Medium.copyWith(
                                            color: AppColors.tintGreen),
                                  ),
                                  Text(
                                    widget.description!,
                                    style: TextStyles.componentTextfield
                                        .copyWith(
                                            color: AppColors.textSecondary),
                                  ),
                                ],
                              )
                            : Text(
                                widget.title,
                                style: widget.listSelectedPart.isEmpty
                                    ? TextStyles.largeBody18Medium
                                    : TextStyles.largeBody18Medium
                                        .copyWith(color: AppColors.tintGreen),
                              ),
                        const Spacer(),
                        Visibility(
                          visible: isShowTimeBoard,
                          child: const Svg(
                            svgPath: SvgPath.arrowUp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isShowTimeBoard,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 244,
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return PartOfDayItem(
                                isSelected: widget.listSelectedPart
                                    .contains(PartOfDay.values[index]),
                                onTap: widget.onTap,
                                partOfDay: PartOfDay.values[index],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                            itemCount: PartOfDay.values.length),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(5),
            ),
            child: SizedBox(
              height: 65,
              child: Row(
                children: [
                  Svg(
                    svgPath: SvgPath.solidCheckCircle,
                    color: AppColors.grey1.withOpacity(0.2),
                  ),
                  const SizedBox(width: 20),
                  widget.description != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyles.largeBody18Medium,
                            ),
                            Text(
                              widget.description!,
                              style: TextStyles.componentTextfield
                                  .copyWith(color: AppColors.textSecondary),
                            ),
                          ],
                        )
                      : Text(
                          widget.title,
                          style: TextStyles.largeBody18Medium,
                        ),
                ],
              ),
            ),
          );
  }
}
