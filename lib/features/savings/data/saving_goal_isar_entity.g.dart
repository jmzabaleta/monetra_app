// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_goal_isar_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavingGoalIsarEntityCollection on Isar {
  IsarCollection<SavingGoalIsarEntity> get savingGoalIsarEntitys =>
      this.collection();
}

const SavingGoalIsarEntitySchema = CollectionSchema(
  name: r'SavingGoalIsarEntity',
  id: 5419921911092379160,
  properties: {
    r'dueDate': PropertySchema(
      id: 0,
      name: r'dueDate',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(id: 1, name: r'name', type: IsarType.string),
    r'publicId': PropertySchema(
      id: 2,
      name: r'publicId',
      type: IsarType.string,
    ),
    r'savedAmount': PropertySchema(
      id: 3,
      name: r'savedAmount',
      type: IsarType.double,
    ),
    r'targetAmount': PropertySchema(
      id: 4,
      name: r'targetAmount',
      type: IsarType.double,
    ),
  },
  estimateSize: _savingGoalIsarEntityEstimateSize,
  serialize: _savingGoalIsarEntitySerialize,
  deserialize: _savingGoalIsarEntityDeserialize,
  deserializeProp: _savingGoalIsarEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _savingGoalIsarEntityGetId,
  getLinks: _savingGoalIsarEntityGetLinks,
  attach: _savingGoalIsarEntityAttach,
  version: '3.1.0+1',
);

int _savingGoalIsarEntityEstimateSize(
  SavingGoalIsarEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.publicId.length * 3;
  return bytesCount;
}

void _savingGoalIsarEntitySerialize(
  SavingGoalIsarEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dueDate);
  writer.writeString(offsets[1], object.name);
  writer.writeString(offsets[2], object.publicId);
  writer.writeDouble(offsets[3], object.savedAmount);
  writer.writeDouble(offsets[4], object.targetAmount);
}

SavingGoalIsarEntity _savingGoalIsarEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavingGoalIsarEntity();
  object.dueDate = reader.readDateTime(offsets[0]);
  object.id = id;
  object.name = reader.readString(offsets[1]);
  object.publicId = reader.readString(offsets[2]);
  object.savedAmount = reader.readDouble(offsets[3]);
  object.targetAmount = reader.readDouble(offsets[4]);
  return object;
}

P _savingGoalIsarEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savingGoalIsarEntityGetId(SavingGoalIsarEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savingGoalIsarEntityGetLinks(
  SavingGoalIsarEntity object,
) {
  return [];
}

void _savingGoalIsarEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  SavingGoalIsarEntity object,
) {
  object.id = id;
}

extension SavingGoalIsarEntityQueryWhereSort
    on QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QWhere> {
  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavingGoalIsarEntityQueryWhere
    on QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QWhereClause> {
  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterWhereClause>
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

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterWhereClause>
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

extension SavingGoalIsarEntityQueryFilter
    on
        QueryBuilder<
          SavingGoalIsarEntity,
          SavingGoalIsarEntity,
          QFilterCondition
        > {
  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  dueDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'dueDate', value: value),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  dueDateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'dueDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  dueDateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'dueDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  dueDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'dueDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  publicIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'publicId', value: ''),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  publicIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'publicId', value: ''),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  savedAmountEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'savedAmount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  savedAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'savedAmount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  savedAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'savedAmount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  savedAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'savedAmount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  targetAmountEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'targetAmount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  targetAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'targetAmount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  targetAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'targetAmount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    SavingGoalIsarEntity,
    SavingGoalIsarEntity,
    QAfterFilterCondition
  >
  targetAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'targetAmount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          epsilon: epsilon,
        ),
      );
    });
  }
}

extension SavingGoalIsarEntityQueryObject
    on
        QueryBuilder<
          SavingGoalIsarEntity,
          SavingGoalIsarEntity,
          QFilterCondition
        > {}

extension SavingGoalIsarEntityQueryLinks
    on
        QueryBuilder<
          SavingGoalIsarEntity,
          SavingGoalIsarEntity,
          QFilterCondition
        > {}

extension SavingGoalIsarEntityQuerySortBy
    on QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QSortBy> {
  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByPublicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByPublicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortBySavedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAmount', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortBySavedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAmount', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByTargetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAmount', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  sortByTargetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAmount', Sort.desc);
    });
  }
}

extension SavingGoalIsarEntityQuerySortThenBy
    on QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QSortThenBy> {
  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByDueDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dueDate', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByPublicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByPublicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenBySavedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAmount', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenBySavedAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'savedAmount', Sort.desc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByTargetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAmount', Sort.asc);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QAfterSortBy>
  thenByTargetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetAmount', Sort.desc);
    });
  }
}

extension SavingGoalIsarEntityQueryWhereDistinct
    on QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QDistinct> {
  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QDistinct>
  distinctByDueDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dueDate');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QDistinct>
  distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QDistinct>
  distinctByPublicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QDistinct>
  distinctBySavedAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedAmount');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, SavingGoalIsarEntity, QDistinct>
  distinctByTargetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetAmount');
    });
  }
}

extension SavingGoalIsarEntityQueryProperty
    on
        QueryBuilder<
          SavingGoalIsarEntity,
          SavingGoalIsarEntity,
          QQueryProperty
        > {
  QueryBuilder<SavingGoalIsarEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, DateTime, QQueryOperations>
  dueDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dueDate');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, String, QQueryOperations>
  publicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicId');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, double, QQueryOperations>
  savedAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedAmount');
    });
  }

  QueryBuilder<SavingGoalIsarEntity, double, QQueryOperations>
  targetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetAmount');
    });
  }
}
