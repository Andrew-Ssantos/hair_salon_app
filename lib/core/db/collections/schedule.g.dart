// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScheduleCollection on Isar {
  IsarCollection<Schedule> get schedules => this.collection();
}

const ScheduleSchema = CollectionSchema(
  name: r'Schedule',
  id: 6369058706800408146,
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
  estimateSize: _scheduleEstimateSize,
  serialize: _scheduleSerialize,
  deserialize: _scheduleDeserialize,
  deserializeProp: _scheduleDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'services': LinkSchema(
      id: 4224112064197478404,
      name: r'services',
      target: r'SalonService',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _scheduleGetId,
  getLinks: _scheduleGetLinks,
  attach: _scheduleAttach,
  version: '3.1.0+1',
);

int _scheduleEstimateSize(
  Schedule object,
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

void _scheduleSerialize(
  Schedule object,
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

Schedule _scheduleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Schedule();
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

P _scheduleDeserializeProp<P>(
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

Id _scheduleGetId(Schedule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scheduleGetLinks(Schedule object) {
  return [object.services];
}

void _scheduleAttach(IsarCollection<dynamic> col, Id id, Schedule object) {
  object.id = id;
  object.services
      .attach(col, col.isar.collection<SalonService>(), r'services', id);
}

extension ScheduleQueryWhereSort on QueryBuilder<Schedule, Schedule, QWhere> {
  QueryBuilder<Schedule, Schedule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScheduleQueryWhere on QueryBuilder<Schedule, Schedule, QWhereClause> {
  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterWhereClause> idBetween(
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

extension ScheduleQueryFilter
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {
  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      clientNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientName',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameStartsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameEndsWith(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> clientNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      clientNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientName',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> dateGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> dateLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> dateBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'endHour',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'endHour',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endHourEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endHourGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endHourLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> endHourBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      isServiceFinishedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isServiceFinished',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      isServiceFinishedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isServiceFinished',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      isServiceFinishedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isServiceFinished',
        value: value,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> priceEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> priceGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> priceLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> priceBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'startHour',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'startHour',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startHourEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startHourGreaterThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startHourLessThan(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> startHourBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      whatsappNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'whatsappNumber',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      whatsappNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'whatsappNumber',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> whatsappNumberEqualTo(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> whatsappNumberBetween(
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
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

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      whatsappNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'whatsappNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> whatsappNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'whatsappNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      whatsappNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'whatsappNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      whatsappNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'whatsappNumber',
        value: '',
      ));
    });
  }
}

extension ScheduleQueryObject
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {}

extension ScheduleQueryLinks
    on QueryBuilder<Schedule, Schedule, QFilterCondition> {
  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> services(
      FilterQuery<SalonService> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'services');
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> servicesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', length, true, length, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> servicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', 0, true, 0, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> servicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', 0, false, 999999, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      servicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', 0, true, length, include);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition>
      servicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'services', length, include, 999999, true);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterFilterCondition> servicesLengthBetween(
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

extension ScheduleQuerySortBy on QueryBuilder<Schedule, Schedule, QSortBy> {
  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByIsServiceFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByIsServiceFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByWhatsappNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> sortByWhatsappNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.desc);
    });
  }
}

extension ScheduleQuerySortThenBy
    on QueryBuilder<Schedule, Schedule, QSortThenBy> {
  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByClientName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByClientNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientName', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endHour', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIsServiceFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByIsServiceFinishedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isServiceFinished', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startHour', Sort.desc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByWhatsappNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.asc);
    });
  }

  QueryBuilder<Schedule, Schedule, QAfterSortBy> thenByWhatsappNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'whatsappNumber', Sort.desc);
    });
  }
}

extension ScheduleQueryWhereDistinct
    on QueryBuilder<Schedule, Schedule, QDistinct> {
  QueryBuilder<Schedule, Schedule, QDistinct> distinctByClientName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endHour');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByIsServiceFinished() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isServiceFinished');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startHour');
    });
  }

  QueryBuilder<Schedule, Schedule, QDistinct> distinctByWhatsappNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'whatsappNumber',
          caseSensitive: caseSensitive);
    });
  }
}

extension ScheduleQueryProperty
    on QueryBuilder<Schedule, Schedule, QQueryProperty> {
  QueryBuilder<Schedule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> clientNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientName');
    });
  }

  QueryBuilder<Schedule, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<Schedule, double?, QQueryOperations> endHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endHour');
    });
  }

  QueryBuilder<Schedule, bool?, QQueryOperations> isServiceFinishedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isServiceFinished');
    });
  }

  QueryBuilder<Schedule, double?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<Schedule, double?, QQueryOperations> startHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startHour');
    });
  }

  QueryBuilder<Schedule, String?, QQueryOperations> whatsappNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'whatsappNumber');
    });
  }
}
