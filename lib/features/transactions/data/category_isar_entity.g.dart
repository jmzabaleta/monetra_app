// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_isar_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCategoryIsarEntityCollection on Isar {
  IsarCollection<CategoryIsarEntity> get categoryIsarEntitys =>
      this.collection();
}

const CategoryIsarEntitySchema = CollectionSchema(
  name: r'CategoryIsarEntity',
  id: -7038982675302654237,
  properties: {
    r'colorValue': PropertySchema(
      id: 0,
      name: r'colorValue',
      type: IsarType.double,
    ),
    r'iconCodePoint': PropertySchema(
      id: 1,
      name: r'iconCodePoint',
      type: IsarType.long,
    ),
    r'iconFontFamily': PropertySchema(
      id: 2,
      name: r'iconFontFamily',
      type: IsarType.string,
    ),
    r'name': PropertySchema(id: 3, name: r'name', type: IsarType.string),
    r'publicId': PropertySchema(
      id: 4,
      name: r'publicId',
      type: IsarType.string,
    ),
  },
  estimateSize: _categoryIsarEntityEstimateSize,
  serialize: _categoryIsarEntitySerialize,
  deserialize: _categoryIsarEntityDeserialize,
  deserializeProp: _categoryIsarEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _categoryIsarEntityGetId,
  getLinks: _categoryIsarEntityGetLinks,
  attach: _categoryIsarEntityAttach,
  version: '3.1.0+1',
);

int _categoryIsarEntityEstimateSize(
  CategoryIsarEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.iconFontFamily.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.publicId.length * 3;
  return bytesCount;
}

void _categoryIsarEntitySerialize(
  CategoryIsarEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.colorValue);
  writer.writeLong(offsets[1], object.iconCodePoint);
  writer.writeString(offsets[2], object.iconFontFamily);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.publicId);
}

CategoryIsarEntity _categoryIsarEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoryIsarEntity();
  object.colorValue = reader.readDouble(offsets[0]);
  object.iconCodePoint = reader.readLong(offsets[1]);
  object.iconFontFamily = reader.readString(offsets[2]);
  object.id = id;
  object.name = reader.readString(offsets[3]);
  object.publicId = reader.readString(offsets[4]);
  return object;
}

P _categoryIsarEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoryIsarEntityGetId(CategoryIsarEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoryIsarEntityGetLinks(
  CategoryIsarEntity object,
) {
  return [];
}

void _categoryIsarEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  CategoryIsarEntity object,
) {
  object.id = id;
}

extension CategoryIsarEntityQueryWhereSort
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QWhere> {
  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoryIsarEntityQueryWhere
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QWhereClause> {
  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension CategoryIsarEntityQueryFilter
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QFilterCondition> {
  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  colorValueEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'colorValue',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  colorValueGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'colorValue',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  colorValueLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'colorValue',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  colorValueBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'colorValue',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconCodePointEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconCodePoint', value: value),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconCodePointGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconCodePoint',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconCodePointLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconCodePoint',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconCodePointBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconCodePoint',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'iconFontFamily',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'iconFontFamily',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'iconFontFamily',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'iconFontFamily',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'iconFontFamily',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'iconFontFamily',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'iconFontFamily',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'iconFontFamily',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'iconFontFamily', value: ''),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  iconFontFamilyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'iconFontFamily', value: ''),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'publicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'publicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'publicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'publicId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'publicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'publicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'publicId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'publicId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'publicId', value: ''),
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterFilterCondition>
  publicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'publicId', value: ''),
      );
    });
  }
}

extension CategoryIsarEntityQueryObject
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QFilterCondition> {}

extension CategoryIsarEntityQueryLinks
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QFilterCondition> {}

extension CategoryIsarEntityQuerySortBy
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QSortBy> {
  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByIconCodePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByIconCodePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByIconFontFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconFontFamily', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByIconFontFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconFontFamily', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByPublicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  sortByPublicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.desc);
    });
  }
}

extension CategoryIsarEntityQuerySortThenBy
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QSortThenBy> {
  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByColorValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorValue', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByIconCodePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByIconCodePointDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconCodePoint', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByIconFontFamily() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconFontFamily', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByIconFontFamilyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'iconFontFamily', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByPublicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.asc);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QAfterSortBy>
  thenByPublicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.desc);
    });
  }
}

extension CategoryIsarEntityQueryWhereDistinct
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QDistinct> {
  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QDistinct>
  distinctByColorValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorValue');
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QDistinct>
  distinctByIconCodePoint() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'iconCodePoint');
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QDistinct>
  distinctByIconFontFamily({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'iconFontFamily',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QDistinct>
  distinctByPublicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicId', caseSensitive: caseSensitive);
    });
  }
}

extension CategoryIsarEntityQueryProperty
    on QueryBuilder<CategoryIsarEntity, CategoryIsarEntity, QQueryProperty> {
  QueryBuilder<CategoryIsarEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CategoryIsarEntity, double, QQueryOperations>
  colorValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorValue');
    });
  }

  QueryBuilder<CategoryIsarEntity, int, QQueryOperations>
  iconCodePointProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconCodePoint');
    });
  }

  QueryBuilder<CategoryIsarEntity, String, QQueryOperations>
  iconFontFamilyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'iconFontFamily');
    });
  }

  QueryBuilder<CategoryIsarEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<CategoryIsarEntity, String, QQueryOperations>
  publicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicId');
    });
  }
}
