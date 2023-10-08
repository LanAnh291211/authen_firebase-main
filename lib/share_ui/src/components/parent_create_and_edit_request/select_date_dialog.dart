// import 'package:calendar/calendar.dart';
// import 'package:flutter/material.dart';

// import '../../../shared_ui.dart';

// class SelectDateDialog extends StatefulWidget {
//   const SelectDateDialog({
//     super.key,
//     required this.initialDate,
//     this.startDateRange,
//     this.endDateRange,
//     this.listDayOfWeekSelected,
//     this.selectableDayPredicate,
//     this.isChangeStartDateRange = false,
//     this.isChangeEndDateRange = false,
//   });
//   final DateTime initialDate;
//   final DateTime? startDateRange;
//   final DateTime? endDateRange;
//   final List<int>? listDayOfWeekSelected;
//   final SelectableDayPredicate? selectableDayPredicate;
//   final bool isChangeStartDateRange;
//   final bool isChangeEndDateRange;

//   @override
//   State<SelectDateDialog> createState() => _SelectDateDialogState();
// }

// class _SelectDateDialogState extends State<SelectDateDialog> {
//   DateTime? selectDate;
//   DateTime? startDate;
//   DateTime? endDate;

//   @override
//   void initState() {
//     if (widget.isChangeStartDateRange) {
//       selectDate = widget.startDateRange ?? DateTime.now();
//     } else if (widget.isChangeEndDateRange) {
//       selectDate = widget.endDateRange ?? DateTime.now();
//     } else {
//       selectDate = DateTime.now();
//     }
//     startDate = widget.startDateRange;
//     endDate = widget.endDateRange;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: AppColors.transparent,
//       insetPadding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Container(
//         decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(13)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
//               child: CalendarTable(
//                 initialDay: widget.initialDate,
//                 selectedDayPredicate: _selectedDayPredicate,
//                 startingDayOfWeek: StartingDayOfWeek.sunday,
//                 headerStyle: headerDialogStyle,
//                 calendarStyle: calendarDialogStyle,
//                 startDateRange: startDate,
//                 endDateRange: endDate,
//                 listDayOfWeekSelected: widget.listDayOfWeekSelected ?? [1, 2, 3, 4, 5, 6, 7],
//                 onDaySelected: _onDaySelected,
//               ),
//             ),
//             const Divider(
//               height: 2,
//               color: AppColors.otherStroke,
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               height: 50,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Button(
//                     title: 'Cancel',
//                     style: FlatButtonStyle(
//                       textStyle: TextStyles.componentButton.copyWith(
//                         color: AppColors.black,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: AppColors.white,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   Button(
//                     title: 'Ok',
//                     style: FlatButtonStyle(
//                       textStyle: TextStyles.componentButton.copyWith(
//                         color: AppColors.black,
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         color: AppColors.white,
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context, selectDate);
//                     },
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   _onDaySelected(DateTime day, DateTime focusedDay, List eventToday) {
//     setState(() {
//       if (_checkDateSelect(day)) {
//         selectDate = day;
//       }
//       if (widget.isChangeStartDateRange) {
//         startDate = day;
//       }
//       if (widget.isChangeEndDateRange) {
//         endDate = selectDate;
//       }
//     });
//   }

//   bool _selectedDayPredicate(DateTime day) {
//     if (_checkDateSelect(day)) {
//       return CalendarService().isSameDate(day, selectDate);
//     } else {
//       return false;
//     }
//   }

//   bool _checkDateSelect(DateTime date) {
//     bool isOutSideDate = (date.year == DateTime.now().year) && (date.month == DateTime.now().month);
//     bool isOldDate = CalendarService().isAfterDate(beforeDate: date, afterDate: DateTime.now());
//     if (!isOutSideDate || !isOldDate) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

// CalendarStyle get calendarDialogStyle => CalendarStyle(
//       outsideDaysVisible: false,
//       textStyleDefault: TextStyles.largeBody18Regular,
//       textStyleToday: TextStyles.largeBody18Regular.copyWith(color: AppColors.primary),
//       textStyleDayOfWeek: TextStyles.caption12Regular.copyWith(color: AppColors.labelTertiary),
//       colorSelected: AppColors.primary,
//       heiDayCell: 40,
//       heiDayOfWeekCell: 20,
//     );
// HeaderStyle get headerDialogStyle => HeaderStyle(
//       isVisibleActionMonth: false,
//       isVisibleGotoToday: false,
//       textStyleHeader: TextStyles.largeBody18SemiBold.copyWith(fontSize: 17),
//       textStyleGotoToday: TextStyles.caption13Regular,
//       padding: const EdgeInsets.only(bottom: 12),
//       iconPrevMonth: const CalendarSvg(svgPath: CalendarSvgPath.directionLeft, color: AppColors.primary, width: 17.3, height: 17.3),
//       iconNextMonth: const CalendarSvg(svgPath: CalendarSvgPath.directionRight, color: AppColors.primary, width: 17.3, height: 17.3),
//       spacePrevAndNext: 31,
//     );
