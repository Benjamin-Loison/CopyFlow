import 'package:timeago/timeago.dart' as timeago;

class TimeFormatter {
  static String format(DateTime date) {
    return timeago.format(date);
  }
}