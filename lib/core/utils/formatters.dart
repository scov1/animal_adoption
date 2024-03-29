import 'package:intl/intl.dart';

class Formatters {
  static String customFormatDate(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy').format(dateTime);
  }
}
