import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../transactions/domain/transaction_type.dart';
import '../../transactions/presentation/transaction_providers.dart';

class FinanceSummary {
  const FinanceSummary({
    required this.balance,
    required this.totalIncome,
    required this.totalExpense,
    required this.monthIncome,
    required this.monthExpense,
    required this.expensesByCategory,
  });

  final double balance;
  final double totalIncome;
  final double totalExpense;
  final double monthIncome;
  final double monthExpense;
  final Map<String, double> expensesByCategory;
}

final financeSummaryProvider = Provider<FinanceSummary>((ref) {
  final transactions = ref.watch(transactionControllerProvider);
  final now = DateTime.now();
  var income = 0.0;
  var expense = 0.0;
  final byCategory = <String, double>{};

  for (final transaction in transactions) {
    final isCurrentMonth =
        transaction.date.year == now.year &&
        transaction.date.month == now.month;
    if (!isCurrentMonth) continue;
    if (transaction.type == TransactionType.income) {
      income += transaction.amount;
    } else {
      expense += transaction.amount;
      byCategory.update(
        transaction.categoryId,
        (value) => value + transaction.amount,
        ifAbsent: () => transaction.amount,
      );
    }
  }

  final totalIncome = transactions
      .where((item) => item.type == TransactionType.income)
      .fold(0.0, (sum, item) => sum + item.amount);
  final totalExpense = transactions
      .where((item) => item.type == TransactionType.expense)
      .fold(0.0, (sum, item) => sum + item.amount);

  return FinanceSummary(
    balance: totalIncome - totalExpense,
    totalIncome: totalIncome,
    totalExpense: totalExpense,
    monthIncome: income,
    monthExpense: expense,
    expensesByCategory: byCategory,
  );
});
