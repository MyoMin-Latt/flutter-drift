// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Staff extends DataClass implements Insertable<Staff> {
  final int id;
  final String name;
  final String address;
  final int age;
  final DateTime birthday;
  Staff(
      {required this.id,
      required this.name,
      required this.address,
      required this.age,
      required this.birthday});
  factory Staff.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Staff(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address'])!,
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age'])!,
      birthday: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birthday'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['age'] = Variable<int>(age);
    map['birthday'] = Variable<DateTime>(birthday);
    return map;
  }

  StaffTableCompanion toCompanion(bool nullToAbsent) {
    return StaffTableCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      age: Value(age),
      birthday: Value(birthday),
    );
  }

  factory Staff.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Staff(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      age: serializer.fromJson<int>(json['age']),
      birthday: serializer.fromJson<DateTime>(json['birthday']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'age': serializer.toJson<int>(age),
      'birthday': serializer.toJson<DateTime>(birthday),
    };
  }

  Staff copyWith(
          {int? id,
          String? name,
          String? address,
          int? age,
          DateTime? birthday}) =>
      Staff(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        age: age ?? this.age,
        birthday: birthday ?? this.birthday,
      );
  @override
  String toString() {
    return (StringBuffer('Staff(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('age: $age, ')
          ..write('birthday: $birthday')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, address, age, birthday);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Staff &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.age == this.age &&
          other.birthday == this.birthday);
}

class StaffTableCompanion extends UpdateCompanion<Staff> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<int> age;
  final Value<DateTime> birthday;
  const StaffTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.age = const Value.absent(),
    this.birthday = const Value.absent(),
  });
  StaffTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    required int age,
    required DateTime birthday,
  })  : name = Value(name),
        address = Value(address),
        age = Value(age),
        birthday = Value(birthday);
  static Insertable<Staff> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<int>? age,
    Expression<DateTime>? birthday,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (age != null) 'age': age,
      if (birthday != null) 'birthday': birthday,
    });
  }

  StaffTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? address,
      Value<int>? age,
      Value<DateTime>? birthday}) {
    return StaffTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      age: age ?? this.age,
      birthday: birthday ?? this.birthday,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<DateTime>(birthday.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('age: $age, ')
          ..write('birthday: $birthday')
          ..write(')'))
        .toString();
  }
}

class $StaffTableTable extends StaffTable
    with TableInfo<$StaffTableTable, Staff> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _birthdayMeta = const VerificationMeta('birthday');
  @override
  late final GeneratedColumn<DateTime?> birthday = GeneratedColumn<DateTime?>(
      'birthday', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, address, age, birthday];
  @override
  String get aliasedName => _alias ?? 'staff_table';
  @override
  String get actualTableName => 'staff_table';
  @override
  VerificationContext validateIntegrity(Insertable<Staff> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(_birthdayMeta,
          birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta));
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Staff map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Staff.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $StaffTableTable createAlias(String alias) {
    return $StaffTableTable(attachedDatabase, alias);
  }
}

abstract class _$StaffDatabase extends GeneratedDatabase {
  _$StaffDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $StaffTableTable staffTable = $StaffTableTable(this);
  late final StaffDao staffDao = StaffDao(this as StaffDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [staffTable];
}
