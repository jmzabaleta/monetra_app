import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/savings/data/saving_goal_isar_entity.dart';
import '../../features/transactions/data/category_isar_entity.dart';
import '../../features/transactions/data/transaction_isar_entity.dart';
import '../database/isar_provider.dart';
import '../database/isar_service.dart';

Future<List<Override>> buildProviderOverrides() async {
  final isar = await IsarService.instance.open([
    TransactionIsarEntitySchema,
    SavingGoalIsarEntitySchema,
    CategoryIsarEntitySchema,
  ]);

  return [isarProvider.overrideWithValue(isar)];
}
