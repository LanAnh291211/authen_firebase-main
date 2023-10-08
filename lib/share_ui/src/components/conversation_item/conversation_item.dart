import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem(
      {Key? key,
      required this.avatar,
      required this.name,
      required this.message,
      required this.time,
      required this.readed,
      this.mySelf = false,
      this.onTapDetail,
      this.isParent = true,
      this.onTabMoreOption,
      this.onTapLongPress,
      this.type = MessageType.text})
      : super(key: key);

  final String avatar;
  final String name;
  final String message;
  final MessageType type;
  final bool mySelf;
  final bool readed;
  final String time;
  final bool isParent;
  final Function()? onTapDetail;
  final Function()? onTabMoreOption;
  final Function()? onTapLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapDetail,
      onLongPress: onTapLongPress,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 44,
                  height: 44,
                  child: Avatar(
                    imageUrl: avatar,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                name,
                                style: TextStyles.smallBody16SemiBold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Visibility(
                              visible: !readed,
                              child: Container(
                                width: 8,
                                height: 8,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(55),
                                    )),
                              ),
                            )
                          ],
                        ),
                        Text(
                          type == MessageType.text
                              ? message
                              : mySelf
                                  ? 'You send a ${type.name}.'
                                  : '$name send a ${type.name}.',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.caption13Regular.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => onTabMoreOption?.call(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: (isParent
                        ? AppColors.primaryShade4
                        : AppColors.secondaryShade4),
                    shape: BoxShape.circle,
                  ),
                  child: Svg(
                    svgPath: SvgPath.moreHorizontal,
                    color: isParent ? AppColors.primary : AppColors.secondary,
                  ),
                ),
                Text(
                  time,
                  style: TextStyles.caption13Regular
                      .copyWith(color: AppColors.black.withOpacity(0.6)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
