enum TransactionType { income, expense }

extension TransactionTypeLabel on TransactionType {
  String get label => switch (this) {
    TransactionType.income => 'Ingreso',
    TransactionType.expense => 'Gasto',
  };
}
