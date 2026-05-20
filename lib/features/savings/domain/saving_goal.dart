class SavingGoal {
  const SavingGoal({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.savedAmount,
    required this.dueDate,
  });

  final String id;
  final String name;
  final double targetAmount;
  final double savedAmount;
  final DateTime dueDate;

  double get progress => targetAmount == 0 ? 0 : savedAmount / targetAmount;

  SavingGoal copyWith({
    String? id,
    String? name,
    double? targetAmount,
    double? savedAmount,
    DateTime? dueDate,
  }) {
    return SavingGoal(
      id: id ?? this.id,
      name: name ?? this.name,
      targetAmount: targetAmount ?? this.targetAmount,
      savedAmount: savedAmount ?? this.savedAmount,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}
