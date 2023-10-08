import 'package:flutter/material.dart';
import '../../../shared_ui.dart';

class MessageMySystemItem extends StatelessWidget {
  final String content;
  final String subContent;
  final String time;
  const MessageMySystemItem({super.key, required this.content, required this.subContent, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.2, 14, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                color: AppColors.grey5,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(2),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
            child: Column(
              children: [
                Text(content, style: TextStyles.smallBody16Regular.copyWith(letterSpacing: 0.5)),
                const SizedBox(
                  height: 8,
                ),
                subContent.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        width: double.infinity,
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
                        child: Text(subContent, style: TextStyles.componentColumnContent.copyWith(letterSpacing: 0.5, height: 1.2)),
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
    );
  }
}
