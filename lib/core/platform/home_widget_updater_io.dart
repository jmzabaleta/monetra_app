import 'package:flutter/services.dart';

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

  Map<String, Object> toMap() {
    return {
      'balance': balance,
      'monthIncome': monthIncome,
      'monthExpense': monthExpense,
      'transactionCount': transactionCount,
    };
  }
}

class HomeWidgetUpdater {
  static const _channel = MethodChannel('monetra/home_widget');

  static Future<void> update(HomeWidgetPayload payload) async {
    await _channel.invokeMethod<void>('updateSummary', payload.toMap());
  }
}
