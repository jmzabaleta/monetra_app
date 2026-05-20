import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/isar_provider.dart';
import '../data/transaction_repository.dart';
import '../data/transaction_repository_factory.dart';
import '../domain/finance_transaction.dart';
import '../domain/transaction_type.dart';

final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return createTransactionRepository(ref.watch(isarProvider));
});

final transactionControllerProvider =
    StateNotifierProvider<TransactionController, List<FinanceTransaction>>((
      ref,
    ) {
      return TransactionController(ref.watch(transactionRepositoryProvider));
    });

final transactionSearchProvider = StateProvider<String>((ref) => '');
final transactionTypeFilterProvider = StateProvider<TransactionType?>(
  (ref) => null,
);
final transactionCategoryFilterProvider = StateProvider<String?>((ref) => null);
final transactionDateRangeFilterProvider = StateProvider<DateTimeRange?>(
  (ref) => null,
);

final filteredTransactionsProvider = Provider<List<FinanceTransaction>>((ref) {
  final items = ref.watch(transactionControllerProvider);
  final query = ref.watch(transactionSearchProvider).toLowerCase().trim();
  final typeFilter = ref.watch(transactionTypeFilterProvider);
  final categoryFilter = ref.watch(transactionCategoryFilterProvider);
  final dateRange = ref.watch(transactionDateRangeFilterProvider);

  return items.where((transaction) {
    final matchesQuery =
        query.isEmpty ||
        transaction.title.toLowerCase().contains(query) ||
        transaction.note.toLowerCase().contains(query);
    final matchesType = typeFilter == null || transaction.type == typeFilter;
    final matchesCategory =
        categoryFilter == null || transaction.categoryId == categoryFilter;
    final matchesDate =
        dateRange == null ||
        (!transaction.date.isBefore(_startOfDay(dateRange.start)) &&
            !transaction.date.isAfter(_endOfDay(dateRange.end)));
    return matchesQuery && matchesType && matchesCategory && matchesDate;
  }).toList();
});

class TransactionController extends StateNotifier<List<FinanceTransaction>> {
  TransactionController(this._repository) : super(_repository.getAll());

  final TransactionRepository _repository;

  void save(FinanceTransaction transaction) {
    _repository.upsert(transaction);
    state = _repository.getAll();
  }

  void remove(String id) {
    _repository.delete(id);
    state = _repository.getAll();
  }

  void clear() {
    _repository.deleteAll();
    state = _repository.getAll();
  }
}

DateTime _startOfDay(DateTime date) =>
    DateTime(date.year, date.month, date.day);

DateTime _endOfDay(DateTime date) =>
    DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
