import 'package:intl/intl.dart';

class timerCheck {
  DateTime now = DateTime.now();
  String timeCheck() {
    int hour = now.hour;
    if (hour >= 5 && hour < 12) {
      return 'good_morning'; //this returns are language variables in json file
    } else if (hour >= 12 && hour < 17) {
      return 'good_afternoon';
    } else if (hour >= 17 && hour < 20) {
      return 'good_evening';
    } else {
      return 'good_evening';
    }
  }

  String a = "";
  String date() {
    //DateFormat.jm();
    //String formattedDate = DateFormat('dd, yyyy  kk:mm:ss').format(now);
    //String time=DateFormat
    String f = DateFormat("dd, yyyy").add_jms().format(now);
    a = DateFormat("MMM").format(now);
    return f;
  }
}
