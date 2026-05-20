import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../domain/category.dart';

part 'category_isar_entity.g.dart';

@collection
class CategoryIsarEntity {
  Id id = Isar.autoIncrement;
  late String publicId;
  late String name;
  late int iconCodePoint;
  late String iconFontFamily;
  late double colorValue;

  FinanceCategory toDomain() {
    return FinanceCategory(
      id: publicId,
      name: name,
      icon: categoryIconByCodePoint(iconCodePoint),
      color: Color(colorValue.toInt()),
    );
  }

  static CategoryIsarEntity fromDomain(FinanceCategory category) {
    return CategoryIsarEntity()
      ..publicId = category.id
      ..name = category.name
      ..iconCodePoint = category.icon.codePoint
      ..iconFontFamily = category.icon.fontFamily ?? 'MaterialIcons'
      ..colorValue = category.color.toARGB32().toDouble();
  }
}
