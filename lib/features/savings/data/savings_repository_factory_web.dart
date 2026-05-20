import 'package:isar/isar.dart';

import 'savings_repository.dart';
import 'savings_repository_local.dart';

SavingsRepository createSavingsRepository(Isar? isar) {
  return LocalSavingsRepository();
}
