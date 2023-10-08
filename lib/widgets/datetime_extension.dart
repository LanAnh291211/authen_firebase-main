import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get formatTimeString => DateFormat('h:mm a').format(this);

  String get formatMonthYearString => DateFormat('MMM, yyyy').format(this);

  String get formatDateTimeString => DateFormat('dd/MM/yyyy HH:mm aaa').format(this);

  String get formatDateTimeStringNotification => DateFormat('dd MMM yyyy HH:mm aaa').format(this);

  String get formatTimeDateString => DateFormat('HH:mm dd/MM/yyyy').format(this);

  String get formatDayString => DateFormat('dd').format(this);

  String get formatMonthString => DateFormat('MMM').format(this);

  String get formatDateDefault => DateFormat('dd/MM/yyyy').format(this);

  String get formatDateFavorite => DateFormat('dd MMM yyyy').format(this);

  String get formatTimeFavorite => DateFormat('h:mma').format(this).toLowerCase();
  String get formatDateReviewBooking => DateFormat('yyyy-MM-dd').format(this);
  String get formatTimeReviewBooking => DateFormat('HH.mm').format(this);



  String get formatDayOfBirthday => DateFormat('MMM dd, yyyy').format(this);
  String get formatWeekdayOfBirthday => DateFormat('EEE, dd MMM yyyy').format(this);
  String get formatMyUpComingBookingDate => DateFormat('MMM dd (EEE)').format(this);

  bool isSameDate(DateTime other) => this.year == other.year && this.month == other.month && this.day == other.day;
}
