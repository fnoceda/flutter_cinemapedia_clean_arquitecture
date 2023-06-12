import 'package:intl/intl.dart';

class HummanFormats {
  static String number(double number) {
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);
    return formatterNumber;
  }
}
