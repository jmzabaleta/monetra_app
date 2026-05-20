import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/isar_provider.dart';
import '../data/savings_repository.dart';
import '../data/savings_repository_factory.dart';
import '../domain/saving_goal.dart';

final savingsRepositoryProvider = Provider<SavingsRepository>((ref) {
  return createSavingsRepository(ref.watch(isarProvider));
});

final savingsControllerProvider =
    StateNotifierProvider<SavingsController, List<SavingGoal>>((ref) {
      return SavingsController(ref.watch(savingsRepositoryProvider));
    });

class SavingsController extends StateNotifier<List<SavingGoal>> {
  SavingsController(this._repository) : super(_repository.getAll());

  final SavingsRepository _repository;

  void save(SavingGoal goal) {
    _repository.upsert(goal);
    state = _repository.getAll();
  }

  void remove(String id) {
    _repository.delete(id);
    state = _repository.getAll();
  }

  void clear() {
    _repository.deleteAll();
    state = _repository.getAll();
  }
}
