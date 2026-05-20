import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../domain/finance_transaction.dart';
import 'transaction_isar_entity.dart';
import 'transaction_repository.dart';

class IsarTransactionRepository implements TransactionRepository {
  IsarTransactionRepository(this._isar) {
    _removeLegacySeedData();
  }

  final Isar _isar;
  final _uuid = const Uuid();

  @override
  List<FinanceTransaction> getAll() {
    final items =
        _isar.transactionIsarEntitys
            .where()
            .findAllSync()
            .map((entity) => entity.toDomain())
            .toList()
          ..sort((a, b) => b.date.compareTo(a.date));
    return items;
  }

  @override
  FinanceTransaction upsert(FinanceTransaction transaction) {
    final stored = transaction.id.isEmpty
        ? transaction.copyWith(id: _uuid.v4())
        : transaction;
    final existing = _isar.transactionIsarEntitys
        .filter()
        .publicIdEqualTo(stored.id)
        .findFirstSync();
    final entity = TransactionIsarEntity.fromDomain(stored);
    if (existing != null) entity.id = existing.id;
    _isar.writeTxnSync(() => _isar.transactionIsarEntitys.putSync(entity));
    return stored;
  }

  @override
  void delete(String id) {
    final existing = _isar.transactionIsarEntitys
        .filter()
        .publicIdEqualTo(id)
        .findFirstSync();
    if (existing == null) return;
    _isar.writeTxnSync(
      () => _isar.transactionIsarEntitys.deleteSync(existing.id),
    );
  }

  @override
  void deleteAll() {
    final ids = _isar.transactionIsarEntitys
        .where()
        .findAllSync()
        .map((entity) => entity.id)
        .toList();
    if (ids.isEmpty) return;
    _isar.writeTxnSync(() => _isar.transactionIsarEntitys.deleteAllSync(ids));
  }

  void _removeLegacySeedData() {
    const legacyIds = {'1', '2', '3', '4', '5', '6'};
    final legacyRows = _isar.transactionIsarEntitys
        .where()
        .findAllSync()
        .where((entity) => legacyIds.contains(entity.publicId))
        .map((entity) => entity.id)
        .toList();
    if (legacyRows.isEmpty) return;
    _isar.writeTxnSync(
      () => _isar.transactionIsarEntitys.deleteAllSync(legacyRows),
    );
  }
}
