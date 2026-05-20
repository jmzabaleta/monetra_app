import 'package:intl/intl.dart';

class MoneyFormatter {
  MoneyFormatter(this.currency);

  final String currency;

  String format(double value) {
    return NumberFormat.currency(
      locale: 'es_CO',
      symbol: '$currency ',
      decimalDigits: 0,
    ).format(value);
  }
}
