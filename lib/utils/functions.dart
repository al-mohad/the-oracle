import 'package:oracle/utils/constants.dart';

String formatPublishedTime(String time) {
  String day, month, year, newTime;

  DateTime t = DateTime.parse(time);

  day = t.day.toString();
  month = months[t.month - 1];
  year = t.year.toString();
  newTime = dateTimeToString(t);

  return '$month $day,$year · $newTime';
}

String dateTimeToString(DateTime time) {
  // Change a Datetime object to 12hr format
  // e.g "2020-06-05T12:12:27Z" to 9:38 PM
  String meridian, newTime = '';

  int hour = time.hour;
  int minute = time.minute;

  // Determine the meridian unit from the hour
  meridian = hour < 12 ? ' AM' : ' PM';

  // Change hour to 12hr format if greater than 12
  hour = hour <= 12 ? hour : hour - 12;

  // Put the new hour part in the final string
  newTime += hour.toString();

  // Place the colon after the hour
  newTime += ':';

  // Place the minute part after the colon
  newTime += minute < 10 ? '0$minute' : minute.toString();

  // Place the meridian unit at the end
  newTime += meridian;

  return newTime;
}
