import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadbleNumber(double number) {
    return NumberFormat.compactCurrency(
      decimalDigits: 2,
      symbol: '',
    ).format(number);
  }
}
