// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_isar_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransactionIsarEntityCollection on Isar {
  IsarCollection<TransactionIsarEntity> get transactionIsarEntitys =>
      this.collection();
}

const TransactionIsarEntitySchema = CollectionSchema(
  name: r'TransactionIsarEntity',
  id: -4036596229562705631,
  properties: {
    r'amount': PropertySchema(id: 0, name: r'amount', type: IsarType.double),
    r'categoryId': PropertySchema(
      id: 1,
      name: r'categoryId',
      type: IsarType.string,
    ),
    r'date': PropertySchema(id: 2, name: r'date', type: IsarType.dateTime),
    r'note': PropertySchema(id: 3, name: r'note', type: IsarType.string),
    r'publicId': PropertySchema(
      id: 4,
      name: r'publicId',
      type: IsarType.string,
    ),
    r'title': PropertySchema(id: 5, name: r'title', type: IsarType.string),
    r'typeIndex': PropertySchema(
      id: 6,
      name: r'typeIndex',
      type: IsarType.long,
    ),
  },
  estimateSize: _transactionIsarEntityEstimateSize,
  serialize: _transactionIsarEntitySerialize,
  deserialize: _transactionIsarEntityDeserialize,
  deserializeProp: _transactionIsarEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _transactionIsarEntityGetId,
  getLinks: _transactionIsarEntityGetLinks,
  attach: _transactionIsarEntityAttach,
  version: '3.1.0+1',
);

int _transactionIsarEntityEstimateSize(
  TransactionIsarEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryId.length * 3;
  bytesCount += 3 + object.note.length * 3;
  bytesCount += 3 + object.publicId.length * 3;
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _transactionIsarEntitySerialize(
  TransactionIsarEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.categoryId);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeString(offsets[3], object.note);
  writer.writeString(offsets[4], object.publicId);
  writer.writeString(offsets[5], object.title);
  writer.writeLong(offsets[6], object.typeIndex);
}

TransactionIsarEntity _transactionIsarEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TransactionIsarEntity();
  object.amount = reader.readDouble(offsets[0]);
  object.categoryId = reader.readString(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.id = id;
  object.note = reader.readString(offsets[3]);
  object.publicId = reader.readString(offsets[4]);
  object.title = reader.readString(offsets[5]);
  object.typeIndex = reader.readLong(offsets[6]);
  return object;
}

P _transactionIsarEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transactionIsarEntityGetId(TransactionIsarEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transactionIsarEntityGetLinks(
  TransactionIsarEntity object,
) {
  return [];
}

void _transactionIsarEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  TransactionIsarEntity object,
) {
  object.id = id;
}

extension TransactionIsarEntityQueryWhereSort
    on QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QWhere> {
  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransactionIsarEntityQueryWhere
    on
        QueryBuilder<
          TransactionIsarEntity,
          TransactionIsarEntity,
          QWhereClause
        > {
  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterWhereClause>
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

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterWhereClause>
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

extension TransactionIsarEntityQueryFilter
    on
        QueryBuilder<
          TransactionIsarEntity,
          TransactionIsarEntity,
          QFilterCondition
        > {
  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  amountEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'amount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'amount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'amount',
          value: value,
          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'amount',
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
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'categoryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'categoryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'categoryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'categoryId',
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
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'categoryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'categoryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'categoryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'categoryId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'categoryId', value: ''),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  categoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'categoryId', value: ''),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'date', value: value),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  dateGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  dateLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'date',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'date',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
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
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
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
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'title',
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
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'title',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'title',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'title', value: ''),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  typeIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'typeIndex', value: value),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  typeIndexGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'typeIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  typeIndexLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'typeIndex',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<
    TransactionIsarEntity,
    TransactionIsarEntity,
    QAfterFilterCondition
  >
  typeIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'typeIndex',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension TransactionIsarEntityQueryObject
    on
        QueryBuilder<
          TransactionIsarEntity,
          TransactionIsarEntity,
          QFilterCondition
        > {}

extension TransactionIsarEntityQueryLinks
    on
        QueryBuilder<
          TransactionIsarEntity,
          TransactionIsarEntity,
          QFilterCondition
        > {}

extension TransactionIsarEntityQuerySortBy
    on QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QSortBy> {
  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByPublicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByPublicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByTypeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  sortByTypeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.desc);
    });
  }
}

extension TransactionIsarEntityQuerySortThenBy
    on QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QSortThenBy> {
  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByPublicId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByPublicIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'publicId', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByTypeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.asc);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QAfterSortBy>
  thenByTypeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'typeIndex', Sort.desc);
    });
  }
}

extension TransactionIsarEntityQueryWhereDistinct
    on QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct> {
  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByCategoryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByNote({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByPublicId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publicId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TransactionIsarEntity, TransactionIsarEntity, QDistinct>
  distinctByTypeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'typeIndex');
    });
  }
}

extension TransactionIsarEntityQueryProperty
    on
        QueryBuilder<
          TransactionIsarEntity,
          TransactionIsarEntity,
          QQueryProperty
        > {
  QueryBuilder<TransactionIsarEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TransactionIsarEntity, double, QQueryOperations>
  amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<TransactionIsarEntity, String, QQueryOperations>
  categoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryId');
    });
  }

  QueryBuilder<TransactionIsarEntity, DateTime, QQueryOperations>
  dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<TransactionIsarEntity, String, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<TransactionIsarEntity, String, QQueryOperations>
  publicIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publicId');
    });
  }

  QueryBuilder<TransactionIsarEntity, String, QQueryOperations>
  titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<TransactionIsarEntity, int, QQueryOperations>
  typeIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'typeIndex');
    });
  }
}
