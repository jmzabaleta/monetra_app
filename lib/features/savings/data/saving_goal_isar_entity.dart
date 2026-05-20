import 'package:isar/isar.dart';

import '../domain/saving_goal.dart';

part 'saving_goal_isar_entity.g.dart';

@collection
class SavingGoalIsarEntity {
  Id id = Isar.autoIncrement;
  late String publicId;
  late String name;
  late double targetAmount;
  late double savedAmount;
  late DateTime dueDate;

  SavingGoal toDomain() {
    return SavingGoal(
      id: publicId,
      name: name,
      targetAmount: targetAmount,
      savedAmount: savedAmount,
      dueDate: dueDate,
    );
  }

  static SavingGoalIsarEntity fromDomain(SavingGoal goal) {
    return SavingGoalIsarEntity()
      ..publicId = goal.id
      ..name = goal.name
      ..targetAmount = goal.targetAmount
      ..savedAmount = goal.savedAmount
      ..dueDate = goal.dueDate;
  }
}
