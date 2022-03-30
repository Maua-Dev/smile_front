import 'package:intl/intl.dart';

class Utils {
  static String getActivityFinalTime(DateTime time, DateTime duration) {
    var newDate = DateTime(time.year, time.month, time.day,
        time.hour + duration.hour, time.minute + duration.minute);

    return DateFormat('HH:mm').format(newDate);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
