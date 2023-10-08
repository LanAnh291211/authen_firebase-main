// import 'package:flutter/material.dart';
// import 'package:jiffy/jiffy.dart';

// import '../../../shared_ui.dart';

// class TransactionCard extends StatelessWidget {
//   const TransactionCard({
//     super.key,
//     this.onTapDetail,
//     required this.paymentHistoryTypeText,
//     required this.information,
//     this.dateTime,
//     required this.totalAmount,
//   });
//   final String paymentHistoryTypeText;
//   final String information;
//   final DateTime? dateTime;
//   final double totalAmount;
//   final VoidCallback? onTapDetail;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTapDetail,
//       child: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(border: Border.all(color: AppColors.otherStroke), borderRadius: const BorderRadius.all(Radius.circular(12))),
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     paymentHistoryTypeText,
//                     style: TextStyles.smallBody16Medium,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Text(
//                     information,
//                     style: TextStyles.caption12Regular,
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   Text(
//                     dateTime == null ? '--' : Jiffy(dateTime).format('dd/MM/yyyy - HH:mm'),
//                     style: TextStyles.caption12Regular.copyWith(color: AppColors.textQuarternary),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 20),
//             Text(
//               textAmount(totalAmount),
//               style: TextStyles.title22SemiBold.copyWith(color: colorAmount(paymentHistoryTypeText)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String textAmount(double totalAmount) {
//     if (totalAmount > 0) {
//       return '+${totalAmount.abs().toStringAsFixed(2)}';
//     } else if (totalAmount < 0) {
//       return '-${totalAmount.abs().toStringAsFixed(2)}';
//     } else {
//       return '0.0';
//     }
//   }

//   Color colorAmount(String transactionType) {
//     if (transactionType == 'Service Charge' || transactionType == 'Payment Made' || transactionType == 'Debit') {
//       return AppColors.primary;
//     } else {
//       return AppColors.tintGreen;
//     }
//     // if (totalAmount > 0) {
//     //   return AppColors.tintGreen;
//     // } else if (totalAmount < 0) {
//     //   return AppColors.primary;
//     // } else {
//     //   if (transactionType == 'Service Charge' ||
//     //       transactionType == 'Payment Made' ||
//     //       transactionType == 'Debit') {
//     //     return AppColors.primary;
//     //   } else {
//     //     return AppColors.tintGreen;
//     //   }
//     // }
//   }
// }
