import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../domain/saving_goal.dart';
import 'saving_goal_isar_entity.dart';
import 'savings_repository.dart';

class IsarSavingsRepository implements SavingsRepository {
  IsarSavingsRepository(this._isar) {
    _removeLegacySeedData();
  }

  final Isar _isar;
  final _uuid = const Uuid();

  @override
  List<SavingGoal> getAll() {
    return _isar.savingGoalIsarEntitys
        .where()
        .findAllSync()
        .map((entity) => entity.toDomain())
        .toList()
      ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }

  @override
  SavingGoal upsert(SavingGoal goal) {
    final stored = goal.id.isEmpty ? goal.copyWith(id: _uuid.v4()) : goal;
    final existing = _isar.savingGoalIsarEntitys
        .filter()
        .publicIdEqualTo(stored.id)
        .findFirstSync();
    final entity = SavingGoalIsarEntity.fromDomain(stored);
    if (existing != null) entity.id = existing.id;
    _isar.writeTxnSync(() => _isar.savingGoalIsarEntitys.putSync(entity));
    return stored;
  }

  @override
  void delete(String id) {
    final existing = _isar.savingGoalIsarEntitys
        .filter()
        .publicIdEqualTo(id)
        .findFirstSync();
    if (existing == null) return;
    _isar.writeTxnSync(
      () => _isar.savingGoalIsarEntitys.deleteSync(existing.id),
    );
  }

  @override
  void deleteAll() {
    final ids = _isar.savingGoalIsarEntitys
        .where()
        .findAllSync()
        .map((entity) => entity.id)
        .toList();
    if (ids.isEmpty) return;
    _isar.writeTxnSync(() => _isar.savingGoalIsarEntitys.deleteAllSync(ids));
  }

  void _removeLegacySeedData() {
    const legacyIds = {'travel', 'emergency', 'laptop'};
    final legacyRows = _isar.savingGoalIsarEntitys
        .where()
        .findAllSync()
        .where((entity) => legacyIds.contains(entity.publicId))
        .map((entity) => entity.id)
        .toList();
    if (legacyRows.isEmpty) return;
    _isar.writeTxnSync(
      () => _isar.savingGoalIsarEntitys.deleteAllSync(legacyRows),
    );
  }
}
