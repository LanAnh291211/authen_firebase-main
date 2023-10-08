import 'package:flutter/material.dart';
import '../../../shared_ui.dart';

class MessageThemSystemItem extends StatelessWidget {
  final String content;
  final String time;
  final String subContent;
  final String avatar;
  const MessageThemSystemItem({super.key, required this.content, required this.time, required this.subContent, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 14, MediaQuery.of(context).size.width * 0.2, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 24,
              width: 24,
              child: Avatar(
                imageUrl: avatar,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: AppColors.secondaryShade8,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      )),
                  child: Column(
                    children: [
                      Text(content, style: TextStyles.smallBody16Regular.copyWith(letterSpacing: 0.5, height: 1.2)),
                      const SizedBox(
                        height: 8,
                      ),
                      subContent.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.all(8.0),
                              width: double.infinity,
                              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
                              child: Text(subContent, style: TextStyles.componentColumnContent.copyWith(letterSpacing: 0.5)),
                            )
                          : Container(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(time, style: TextStyles.caption10Regular.copyWith(color: AppColors.black.withOpacity(0.35))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
