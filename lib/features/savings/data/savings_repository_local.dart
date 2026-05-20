import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../../core/storage/browser_storage.dart';
import '../domain/saving_goal.dart';
import 'savings_repository.dart';

class LocalSavingsRepository implements SavingsRepository {
  LocalSavingsRepository() {
    _items.addAll(_load());
  }

  static const _storageKey = 'monetra.saving_goals';

  final List<SavingGoal> _items = [];
  final _uuid = const Uuid();

  @override
  List<SavingGoal> getAll() =>
      [..._items]..sort((a, b) => a.dueDate.compareTo(b.dueDate));

  @override
  SavingGoal upsert(SavingGoal goal) {
    final stored = goal.id.isEmpty ? goal.copyWith(id: _uuid.v4()) : goal;
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

  List<SavingGoal> _load() {
    final raw = BrowserStorage.getString(_storageKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final rows = jsonDecode(raw) as List<dynamic>;
      return rows.map((row) {
        final json = row as Map<String, dynamic>;
        return SavingGoal(
          id: json['id'] as String,
          name: json['name'] as String,
          targetAmount: (json['targetAmount'] as num).toDouble(),
          savedAmount: (json['savedAmount'] as num).toDouble(),
          dueDate: DateTime.parse(json['dueDate'] as String),
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
                'name': item.name,
                'targetAmount': item.targetAmount,
                'savedAmount': item.savedAmount,
                'dueDate': item.dueDate.toIso8601String(),
              },
            )
            .toList(),
      ),
    );
  }
}
