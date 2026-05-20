import 'package:isar/isar.dart';

import 'category_repository.dart';
import 'category_repository_isar.dart';
import 'category_repository_local.dart';

CategoryRepository createCategoryRepository(Isar? isar) {
  return isar == null
      ? LocalCategoryRepository()
      : IsarCategoryRepository(isar);
}
