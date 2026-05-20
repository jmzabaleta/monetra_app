import 'package:isar/isar.dart';

import '../domain/finance_transaction.dart';
import '../domain/transaction_type.dart';

part 'transaction_isar_entity.g.dart';

@collection
class TransactionIsarEntity {
  Id id = Isar.autoIncrement;
  late String publicId;
  late String title;
  late double amount;
  late int typeIndex;
  late String categoryId;
  late DateTime date;
  late String note;

  FinanceTransaction toDomain() {
    return FinanceTransaction(
      id: publicId,
      title: title,
      amount: amount,
      type: TransactionType.values[typeIndex],
      categoryId: categoryId,
      date: date,
      note: note,
    );
  }

  static TransactionIsarEntity fromDomain(FinanceTransaction transaction) {
    return TransactionIsarEntity()
      ..publicId = transaction.id
      ..title = transaction.title
      ..amount = transaction.amount
      ..typeIndex = transaction.type.index
      ..categoryId = transaction.categoryId
      ..date = transaction.date
      ..note = transaction.note;
  }
}
