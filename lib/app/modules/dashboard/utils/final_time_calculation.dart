import 'package:intl/intl.dart';

String getActivityFinalTime(DateTime time, DateTime duration) {
  var newDate = DateTime(time.year, time.month, time.day,
      time.hour + duration.hour, time.minute + duration.minute);

  return DateFormat('HH:mm').format(newDate);
}
