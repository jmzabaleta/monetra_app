import '../domain/saving_goal.dart';

abstract class SavingsRepository {
  List<SavingGoal> getAll();
  SavingGoal upsert(SavingGoal goal);
  void delete(String id);
  void deleteAll();
}
