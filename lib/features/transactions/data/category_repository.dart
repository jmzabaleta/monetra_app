import '../domain/category.dart';

abstract class CategoryRepository {
  List<FinanceCategory> getAll();
  FinanceCategory upsert(FinanceCategory category);
  void delete(String id);
  void deleteAll();
}
