import 'package:intl/intl.dart';

/// Formats a date as "10th June 2026 11:46".
String formatGameDate(DateTime date) {
  final day = date.day;
  final suffix = _ordinalSuffix(day);
  final month = DateFormat('MMMM').format(date);
  final time = DateFormat('HH:mm').format(date);
  return '$day$suffix $month ${date.year} $time';
}

String _ordinalSuffix(int day) {
  if (day >= 11 && day <= 13) return 'th';
  return switch (day % 10) {
    1 => 'st',
    2 => 'nd',
    3 => 'rd',
    _ => 'th',
  };
}
