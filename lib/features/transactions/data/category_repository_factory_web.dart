import 'package:isar/isar.dart';

import 'category_repository.dart';
import 'category_repository_local.dart';

CategoryRepository createCategoryRepository(Isar? isar) {
  return LocalCategoryRepository();
}
