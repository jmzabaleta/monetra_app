import '../domain/finance_transaction.dart';

abstract class TransactionRepository {
  List<FinanceTransaction> getAll();
  FinanceTransaction upsert(FinanceTransaction transaction);
  void delete(String id);
  void deleteAll();
}
