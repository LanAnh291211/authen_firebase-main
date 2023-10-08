// import 'package:flutter/material.dart';
// import '../../../shared_ui.dart';

// class MessageThemItem extends StatelessWidget {
//   final String content;
//   final String time;
//   final MessageType messsageType;
//   final String avatar;
//   const MessageThemItem({super.key, required this.content, required this.time, this.messsageType = MessageType.text, required this.avatar});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.fromLTRB(8, 14, MediaQuery.of(context).size.width * 0.2, 0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//               height: 24,
//               width: 24,
//               child: Avatar(
//                 imageUrl: avatar,
//                 fit: BoxFit.cover,
//               )),
//           const SizedBox(
//             width: 4,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 messsageType == MessageType.video
//                     ? MessageVideo(
//                         url: content,
//                         mySelf: false,
//                       )
//                     : messsageType == MessageType.audio
//                         ? MessageVoice(url: content, mySelf: false)
//                         : messsageType == MessageType.image
//                             ? MessageImage(imageUrl: content, mySelf: false)
//                             : MessageText(content: content, mySelf: false),
//                 Text(time, style: TextStyles.caption10Regular.copyWith(color: AppColors.black.withOpacity(0.35))),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
