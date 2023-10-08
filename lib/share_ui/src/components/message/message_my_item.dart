import 'package:flutter/material.dart';

import '../../../shared_ui.dart';

class MessageMyItem extends StatelessWidget {
  final String content;
  final String time;
  final MessageType messsageType;
  const MessageMyItem(
      {super.key,
      required this.content,
      required this.time,
      this.messsageType = MessageType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.2, 14, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
         messsageType == MessageType.video 
              ? MessageVideo(
                  url: content,
                  mySelf: true,
                )
              : messsageType == MessageType.audio 
                  ? MessageVoice(
                      url: content,
                      mySelf: true,
                    )
                  : messsageType == MessageType.image
                      ? MessageImage(
                          imageUrl: content,
                          mySelf: true,
                        )
                      : MessageText(
                          content: content,
                          mySelf: true,
                        ),
          const SizedBox(
            height: 4,
          ),
          Text(time,
              style: TextStyles.caption10Regular
                  .copyWith(color: AppColors.black.withOpacity(0.35))),
        ],
      ),
    );
  }
}
