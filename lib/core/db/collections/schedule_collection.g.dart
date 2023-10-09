// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduleCollectionCollection on Isar {
  IsarCollection<ScheduleCollection> get scheduleCollections =>
      this.collection();
}

const ScheduleCollectionSchema = CollectionSchema(
  name: r'ScheduleCollection',
  id: 6305416856726455358,
  properties: {
    r'clientName': PropertySchema(
      id: 0,
      name: r'clientName',
      type: IsarType.string,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'endHour': PropertySchema(
      id: 2,
      name: r'endHour',
      type: IsarType.double,
    ),
    r'isServiceFinished': PropertySchema(
      id: 3,
      name: r'isServiceFinished',
      type: IsarType.bool,
    ),
    r'price': PropertySchema(
      id: 4,
      name: r'price',
      type: IsarType.double,
    ),
    r'startHour': PropertySchema(
      id: 5,
      name: r'startHour',
      type: IsarType.double,
    ),
    r'whatsappNumber': PropertySchema(
      id: 6,
      name: r'whatsappNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _scheduleCollectionEstimateSize,
  serialize: _scheduleCollectionSerialize,
  deserialize: _scheduleCollectionDeserialize,
  deserializeProp: _scheduleCollectionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'services': LinkSchema(
      id: -2732792521210690393,
      name: r'services',
      target: r'SalonServicesCollection',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _scheduleCollectionGetId,
  getLinks: _scheduleCollectionGetLinks,
  attach: _scheduleCollectionAttach,
  version: '3.1.0+1',
);

int _scheduleCollectionEstimateSize(
  ScheduleCollection object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clientName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.whatsappNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _scheduleCollectionSerialize(
  ScheduleCollection object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clientName);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeDouble(offsets[2], object.endHour);
  writer.writeBool(offsets[3], object.isServiceFinished);
  writer.writeDouble(offsets[4], object.price);
  writer.writeDouble(offsets[5], object.startHour);
  writer.writeString(offsets[6], object.whatsappNumber);
}

ScheduleCollection _scheduleCollectionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScheduleCollection();
  object.clientName = reader.readStringOrNull(offsets[0]);
  object.date = reader.readDateTimeOrNull(offsets[1]);
  object.endHour = reader.readDoubleOrNull(offsets[2]);
  object.id = id;
  object.isServiceFinished = reader.readBoolOrNull(offsets[3]);
  object.price = reader.readDoubleOrNull(offsets[4]);
  object.startHour = reader.readDoubleOrNull(offsets[5]);
  object.whatsappNumber = reader.readStringOrNull(offsets[6]);
  return object;
}

P _scheduleCollectionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scheduleCollectionGetId(ScheduleCollection object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduleCollectionGetLinks(
    ScheduleCollection object) {
  return [object.services];
}

void _scheduleCollectionAttach(
    IsarCollection<dynamic> col, Id id, ScheduleCollection object) {
  object.id = id;
  object.services.attach(
      col, col.isar.collection<SalonServicesCollection>(), r'services', id);
}

extension ScheduleCollectionQueryWhereSort
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QWhere> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleCollectionQueryWhere
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QWhereClause> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterWhereClause>
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

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScheduleCollectionQueryFilter
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QFilterCondition> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientName',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientName',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      clientNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      dateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      endHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endHour',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      endHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endHour',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      endHourEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      endHourGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      endHourLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      endHourBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      isServiceFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isServiceFinished',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      isServiceFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isServiceFinished',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      isServiceFinishedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isServiceFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      startHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startHour',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      startHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startHour',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      startHourEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'startHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      startHourGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'startHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      startHourLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'startHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      startHourBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'startHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'whatsappNumber',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'whatsappNumber',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'whatsappNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'whatsappNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whatsappNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      whatsappNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'whatsappNumber',
        value: '',
      ));
    });
  }
}

extension ScheduleCollectionQueryObject
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QFilterCondition> {}

extension ScheduleCollectionQueryLinks
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QFilterCondition> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      services(FilterQuery<SalonServicesCollection> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'services');
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      servicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', length, true, length, true);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      servicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', 0, true, 0, true);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      servicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', 0, false, 999999, true);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      servicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', 0, true, length, include);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      servicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', length, include, 999999, true);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterFilterCondition>
      servicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'services', lower, includeLower, upper, includeUpper);
    });
  }
}

extension ScheduleCollectionQuerySortBy
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QSortBy> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByIsServiceFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByIsServiceFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByWhatsappNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      sortByWhatsappNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.desc);
    });
  }
}

extension ScheduleCollectionQuerySortThenBy
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QSortThenBy> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByIsServiceFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByIsServiceFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.desc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByWhatsappNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.asc);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QAfterSortBy>
      thenByWhatsappNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.desc);
    });
  }
}

extension ScheduleCollectionQueryWhereDistinct
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct> {
  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByClientName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endHour');
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByIsServiceFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isServiceFinished');
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startHour');
    });
  }

  QueryBuilder<ScheduleCollection, ScheduleCollection, QDistinct>
      distinctByWhatsappNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whatsappNumber',
          caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleCollectionQueryProperty
    on QueryBuilder<ScheduleCollection, ScheduleCollection, QQueryProperty> {
  QueryBuilder<ScheduleCollection, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScheduleCollection, String?, QQueryOperations>
      clientNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientName');
    });
  }

  QueryBuilder<ScheduleCollection, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ScheduleCollection, double?, QQueryOperations>
      endHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endHour');
    });
  }

  QueryBuilder<ScheduleCollection, bool?, QQueryOperations>
      isServiceFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isServiceFinished');
    });
  }

  QueryBuilder<ScheduleCollection, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<ScheduleCollection, double?, QQueryOperations>
      startHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startHour');
    });
  }

  QueryBuilder<ScheduleCollection, String?, QQueryOperations>
      whatsappNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whatsappNumber');
    });
  }
}
