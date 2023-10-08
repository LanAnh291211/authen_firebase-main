// import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';

// import '../../../shared_ui.dart';

// class SitterJobDetailInfoSection extends StatelessWidget {
//   const SitterJobDetailInfoSection({
//     super.key,
//     required this.jobType,
//     this.isShowChat = true,
//     required this.startDatetime,
//     required this.endDatetime,
//     required this.address,
//     this.imageUrl,
//     required this.fullName,
//     this.daysOfWeek,
//     this.onTapChat,
//     this.onTapReview,
//     this.isFlexible = false,
//     this.childWidget,
//   });

//   final String jobType;
//   final bool isShowChat;
//   final DateTime? startDatetime;
//   final DateTime? endDatetime;
//   final String address;
//   final String? imageUrl;
//   final String fullName;
//   final List<int>? daysOfWeek;
//   final VoidCallback? onTapChat;
//   final VoidCallback? onTapReview;
//   final bool isFlexible;
//   final Widget? childWidget;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         RichText(
//           text: TextSpan(
//               text: jobType,
//               style: TextStyles.caption13SemiBold
//                   .copyWith(color: AppColors.primary),
//               children: [
//                 if (isFlexible)
//                   TextSpan(
//                       text: '(Flexible)',
//                       style: TextStyles.caption13Regular
//                           .copyWith(color: AppColors.labelSecondary)),
//               ]),
//         ),
//         const SizedBox(
//           height: 16,
//         ),
//         Text(
//           '${Jiffy(startDatetime).format('d MMM')} - ${Jiffy(endDatetime).format('d MMM')}',
//           style: TextStyles.smallBody16SemiBold
//               .copyWith(color: AppColors.textPrimary),
//         ),
//         Text(
//           '${Jiffy(startDatetime).format('h:mm a')} - ${Jiffy(endDatetime).format('h:mm a')}',
//           style: TextStyles.smallBody16Regular
//               .copyWith(color: AppColors.textPrimary),
//         ),
//         if (daysOfWeek != null)
//           Text(
//             getListDays(daysOfWeek as List<int>),
//             style: TextStyles.smallBody16Regular
//                 .copyWith(color: AppColors.textPrimary),
//           ),
//         Text(
//           address,
//           style: TextStyles.smallBody16Regular.copyWith(color: AppColors.grey1),
//         ),
//         const SizedBox(height: 16),
//         if (childWidget != null) ...[
//           childWidget ?? const SizedBox.shrink(),
//           SizedBox(height: jobType == 'Recurring' ? 8 : 16),
//         ],
//         if (jobType == 'Recurring')
//           SizedBox(
//             width: 133,
//             child: Button(
//               title: 'View All Dates',
//               onPressed: onTapReview,
//               style: FlatButtonStyle(
//                 textStyle: TextStyles.caption12Medium.copyWith(
//                   color: AppColors.primary,
//                 ),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: AppColors.primaryShade4,
//                 ),
//               ),
//             ),
//           ),
//         if (jobType == 'Recurring')
//           const SizedBox(
//             height: 16,
//           ),
//         Row(
//           children: [
//             ClipOval(
//               child: SizedBox(
//                 width: 48,
//                 height: 48,
//                 child: Avatar(imageUrl: imageUrl),
//               ),
//             ),
//             const SizedBox(width: 8),
//             Expanded(
//               child: Text(
//                 fullName,
//                 overflow: TextOverflow.ellipsis,
//                 style: TextStyles.smallBody16SemiBold,
//               ),
//             ),
//             if (isShowChat) ...[
//               GestureDetector(
//                 onTap: onTapChat,
//                 child: Text(
//                   'Chat',
//                   style: TextStyles.smallBody16Regular
//                       .copyWith(color: AppColors.secondary),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: onTapChat,
//                 child: const Padding(
//                   padding: EdgeInsets.only(left: 6, right: 11),
//                   child: Svg(
//                     svgPath: SvgPath.messageNotif,
//                     width: 24,
//                     height: 24,
//                     color: AppColors.secondary,
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ],
//     );
//   }

//   String getListDays(List<int> daysOfWeek) {
//     String listDay = '';
//     daysOfWeek.sort();
//     for (int i = 0; i < (daysOfWeek.length); i++) {
//       listDay += _dayOfWeek[daysOfWeek[i] - 1];
//       if (i < daysOfWeek.length - 1) {
//         listDay += ', ';
//       }
//     }
//     if (listDay.split(',').length == 7) {
//       listDay = 'Everyday';
//     } else {
//       listDay = 'Every $listDay';
//     }
//     return listDay;
//   }
// }

// const List<String> _dayOfWeek = [
//   'Mon',
//   'Tue',
//   'Wed',
//   'Thu',
//   'Fri',
//   'Sat',
//   'Sun'
// ];
