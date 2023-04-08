import 'package:intl/intl.dart';

class Utils {
  static String getActivityFinalTime(DateTime time, int duration) {
    var hour = duration ~/ 60;
    var minutes = duration - (hour * 60);
    var newDate = DateTime(time.year, time.month, time.day, time.hour + hour,
        time.minute + minutes);

    return DateFormat('HH:mm').format(newDate);
  }

  static String getActivityFullFinalTime(DateTime time, int duration) {
    var hour = duration ~/ 60;
    var minutes = duration - (hour * 60);
    var newDate = DateTime(time.year, time.month, time.day,
        time.hour + hour.toInt(), time.minute + minutes.toInt());

    return DateFormat('yyyy-MM-dd hh:mm').format(newDate);
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
