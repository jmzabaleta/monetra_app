class DateText {
  static const _months = [
    'ene',
    'feb',
    'mar',
    'abr',
    'may',
    'jun',
    'jul',
    'ago',
    'sep',
    'oct',
    'nov',
    'dic',
  ];

  static String short(DateTime date) {
    return '${date.day} ${_months[date.month - 1]}';
  }

  static String monthYear(DateTime date) {
    return '${_months[date.month - 1]} ${date.year}';
  }
}
