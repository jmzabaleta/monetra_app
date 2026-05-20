import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../core/storage/browser_storage.dart';
import '../domain/finance_transaction.dart';
import '../domain/transaction_type.dart';
import 'transaction_repository.dart';

class LocalTransactionRepository implements TransactionRepository {
  LocalTransactionRepository() {
    _items.addAll(_load());
  }

  static const _storageKey = 'monetra.transactions';

  final List<FinanceTransaction> _items = [];
  final _uuid = const Uuid();

  @override
  List<FinanceTransaction> getAll() {
    final sorted = [..._items]..sort((a, b) => b.date.compareTo(a.date));
    return sorted;
  }

  @override
  FinanceTransaction upsert(FinanceTransaction transaction) {
    final stored = transaction.id.isEmpty
        ? transaction.copyWith(id: _uuid.v4())
        : transaction;
    final index = _items.indexWhere((item) => item.id == stored.id);
    if (index == -1) {
      _items.add(stored);
    } else {
      _items[index] = stored;
    }
    _persist();
    return stored;
  }

  @override
  void delete(String id) {
    _items.removeWhere((item) => item.id == id);
    _persist();
  }

  @override
  void deleteAll() {
    _items.clear();
    BrowserStorage.remove(_storageKey);
  }

  List<FinanceTransaction> _load() {
    final raw = BrowserStorage.getString(_storageKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final rows = jsonDecode(raw) as List<dynamic>;
      return rows.map((row) {
        final json = row as Map<String, dynamic>;
        return FinanceTransaction(
          id: json['id'] as String,
          title: json['title'] as String,
          amount: (json['amount'] as num).toDouble(),
          type: TransactionType.values[json['type'] as int],
          categoryId: json['categoryId'] as String,
          date: DateTime.parse(json['date'] as String),
          note: json['note'] as String? ?? '',
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  void _persist() {
    if (!BrowserStorage.isSupported) return;
    BrowserStorage.setString(
      _storageKey,
      jsonEncode(
        _items
            .map(
              (item) => {
                'id': item.id,
                'title': item.title,
                'amount': item.amount,
                'type': item.type.index,
                'categoryId': item.categoryId,
                'date': item.date.toIso8601String(),
                'note': item.note,
              },
            )
            .toList(),
      ),
    );
  }
}
