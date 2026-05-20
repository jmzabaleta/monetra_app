import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/isar_provider.dart';
import '../data/category_repository.dart';
import '../data/category_repository_factory.dart';
import '../domain/category.dart';

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return createCategoryRepository(ref.watch(isarProvider));
});

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, List<FinanceCategory>>((ref) {
      return CategoryController(ref.watch(categoryRepositoryProvider));
    });

class CategoryController extends StateNotifier<List<FinanceCategory>> {
  CategoryController(this._repository) : super(_repository.getAll());

  final CategoryRepository _repository;

  void save(FinanceCategory category) {
    _repository.upsert(category);
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
