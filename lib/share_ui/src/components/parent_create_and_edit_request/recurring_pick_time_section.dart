// import 'package:flutter/cupertino.dart';
// import 'package:jiffy/jiffy.dart';

// import '../../../shared_ui.dart';

// class RecurringPickTimeSection extends StatelessWidget {
//   final DateTime? startDateTime;
//   final DateTime? endDateTime;
//   final VoidCallback selectStartDate;
//   final VoidCallback selectStartTime;
//   final VoidCallback selectEndDate;
//   final VoidCallback selectEndTime;
//   const RecurringPickTimeSection({
//     Key? key,
//     required this.startDateTime,
//     required this.endDateTime,
//     required this.selectStartDate,
//     required this.selectStartTime,
//     required this.selectEndDate,
//     required this.selectEndTime,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Row(
//         children: [
//           Flexible(
//             child: DatePickerButton(
//               title: 'start date',
//               svgPath: SvgPath.calendar,
//               selectedDate: startDateTime == null || startDateTime?.year == 1 ? 'start date' : Jiffy(startDateTime).format('d MMM yyyy'),
//               onPressed: selectStartDate,
//             ),
//           ),
//           const SizedBox(
//             width: 12,
//           ),
//           Flexible(
//             child: DatePickerButton(
//                 title: 'end date',
//                 svgPath: SvgPath.calendar,
//                 selectedDate: endDateTime == null || endDateTime?.year == 1 ? 'end date' : Jiffy(endDateTime).format('d MMM yyyy'),
//                 onPressed: selectEndDate),
//           ),
//         ],
//       ),
//       const SizedBox(
//         height: 12,
//       ),
//       Row(
//         children: [
//           Flexible(
//               child: TimePickerButton(
//             title: 'start time',
//             selectedTime: startDateTime == null ? 'start time' : Jiffy(startDateTime).format('hh:mm a'),
//             onPressed: selectStartTime,
//           )),
//           const SizedBox(
//             width: 12,
//           ),
//           Flexible(child: TimePickerButton(title: 'end time', selectedTime: endDateTime == null ? 'end time' : Jiffy(endDateTime).format('hh:mm a'), onPressed: selectEndTime))
//         ],
//       ),
//     ]);
//   }
// }
