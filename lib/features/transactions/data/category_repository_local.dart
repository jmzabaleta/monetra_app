import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../core/storage/browser_storage.dart';
import '../domain/category.dart';
import 'category_repository.dart';

class LocalCategoryRepository implements CategoryRepository {
  LocalCategoryRepository() {
    _items.addAll(_load());
  }

  static const _storageKey = 'monetra.categories';

  final List<FinanceCategory> _items = [];
  final _uuid = const Uuid();

  @override
  List<FinanceCategory> getAll() =>
      [..._items]
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  @override
  FinanceCategory upsert(FinanceCategory category) {
    final stored = category.id.isEmpty
        ? _copyWithId(category, _uuid.v4())
        : category;
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

  List<FinanceCategory> _load() {
    final raw = BrowserStorage.getString(_storageKey);
    if (raw == null || raw.isEmpty) return [];
    try {
      final rows = jsonDecode(raw) as List<dynamic>;
      return rows.map((row) {
        final json = row as Map<String, dynamic>;
        return FinanceCategory(
          id: json['id'] as String,
          name: json['name'] as String,
          icon: categoryIconByCodePoint(json['iconCodePoint'] as int),
          color: Color(json['colorValue'] as int),
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
                'iconCodePoint': item.icon.codePoint,
                'colorValue': item.color.toARGB32(),
              },
            )
            .toList(),
      ),
    );
  }
}

FinanceCategory _copyWithId(FinanceCategory category, String id) {
  return FinanceCategory(
    id: id,
    name: category.name,
    icon: category.icon,
    color: category.color,
  );
}
