import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../domain/category.dart';
import 'category_isar_entity.dart';
import 'category_repository.dart';

class IsarCategoryRepository implements CategoryRepository {
  IsarCategoryRepository(this._isar);

  final Isar _isar;
  final _uuid = const Uuid();

  @override
  List<FinanceCategory> getAll() {
    return _isar.categoryIsarEntitys
        .where()
        .findAllSync()
        .map((entity) => entity.toDomain())
        .toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  FinanceCategory upsert(FinanceCategory category) {
    final stored = category.id.isEmpty
        ? _copyWithId(category, _uuid.v4())
        : category;
    final existing = _isar.categoryIsarEntitys
        .filter()
        .publicIdEqualTo(stored.id)
        .findFirstSync();
    final entity = CategoryIsarEntity.fromDomain(stored);
    if (existing != null) entity.id = existing.id;
    _isar.writeTxnSync(() => _isar.categoryIsarEntitys.putSync(entity));
    return stored;
  }

  @override
  void delete(String id) {
    final existing = _isar.categoryIsarEntitys
        .filter()
        .publicIdEqualTo(id)
        .findFirstSync();
    if (existing == null) return;
    _isar.writeTxnSync(() => _isar.categoryIsarEntitys.deleteSync(existing.id));
  }

  @override
  void deleteAll() {
    final ids = _isar.categoryIsarEntitys
        .where()
        .findAllSync()
        .map((entity) => entity.id)
        .toList();
    if (ids.isEmpty) return;
    _isar.writeTxnSync(() => _isar.categoryIsarEntitys.deleteAllSync(ids));
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
