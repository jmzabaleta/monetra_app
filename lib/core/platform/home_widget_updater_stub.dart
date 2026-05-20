class HomeWidgetPayload {
  const HomeWidgetPayload({
    required this.balance,
    required this.monthIncome,
    required this.monthExpense,
    required this.transactionCount,
  });

  final String balance;
  final String monthIncome;
  final String monthExpense;
  final int transactionCount;
}

class HomeWidgetUpdater {
  static Future<void> update(HomeWidgetPayload payload) async {}
}
