import 'package:intl/intl.dart';

class HumanFormats {
  /// [static] to use this method without create a new instance of this class before.
  static String humanRedableNumber(double number) {
    return NumberFormat.compact().format(number);
  }
}
