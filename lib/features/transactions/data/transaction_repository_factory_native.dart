import 'package:isar/isar.dart';

import 'transaction_repository.dart';
import 'transaction_repository_isar.dart';
import 'transaction_repository_local.dart';

TransactionRepository createTransactionRepository(Isar? isar) {
  return isar == null
      ? LocalTransactionRepository()
      : IsarTransactionRepository(isar);
}
