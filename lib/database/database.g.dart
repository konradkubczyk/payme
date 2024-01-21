// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bankAccountNumberMeta =
      const VerificationMeta('bankAccountNumber');
  @override
  late final GeneratedColumn<String> bankAccountNumber =
      GeneratedColumn<String>('bank_account_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 26, maxTextLength: 26),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, phoneNumber, bankAccountNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
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
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('bank_account_number')) {
      context.handle(
          _bankAccountNumberMeta,
          bankAccountNumber.isAcceptableOrUnknown(
              data['bank_account_number']!, _bankAccountNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      bankAccountNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_number']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String? email;
  final String? phoneNumber;
  final String? bankAccountNumber;
  const User(
      {required this.id,
      required this.name,
      this.email,
      this.phoneNumber,
      this.bankAccountNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || bankAccountNumber != null) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      bankAccountNumber: bankAccountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountNumber),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      bankAccountNumber:
          serializer.fromJson<String?>(json['bankAccountNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'bankAccountNumber': serializer.toJson<String?>(bankAccountNumber),
    };
  }

  User copyWith(
          {int? id,
          String? name,
          Value<String?> email = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> bankAccountNumber = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email.present ? email.value : this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        bankAccountNumber: bankAccountNumber.present
            ? bankAccountNumber.value
            : this.bankAccountNumber,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('bankAccountNumber: $bankAccountNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, phoneNumber, bankAccountNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.bankAccountNumber == this.bankAccountNumber);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<String?> bankAccountNumber;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
  }) : name = Value(name);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? bankAccountNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (bankAccountNumber != null) 'bank_account_number': bankAccountNumber,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? email,
      Value<String?>? phoneNumber,
      Value<String?>? bankAccountNumber}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (bankAccountNumber.present) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('bankAccountNumber: $bankAccountNumber')
          ..write(')'))
        .toString();
  }
}

class $FriendsTable extends Friends with TableInfo<$FriendsTable, Friend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FriendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 60),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phone_number', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 9, maxTextLength: 11),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _bankAccountNumberMeta =
      const VerificationMeta('bankAccountNumber');
  @override
  late final GeneratedColumn<String> bankAccountNumber =
      GeneratedColumn<String>('bank_account_number', aliasedName, true,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 26, maxTextLength: 26),
          type: DriftSqlType.string,
          requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, phoneNumber, bankAccountNumber];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'friends';
  @override
  VerificationContext validateIntegrity(Insertable<Friend> instance,
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
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
    }
    if (data.containsKey('bank_account_number')) {
      context.handle(
          _bankAccountNumberMeta,
          bankAccountNumber.isAcceptableOrUnknown(
              data['bank_account_number']!, _bankAccountNumberMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Friend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Friend(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone_number']),
      bankAccountNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}bank_account_number']),
    );
  }

  @override
  $FriendsTable createAlias(String alias) {
    return $FriendsTable(attachedDatabase, alias);
  }
}

class Friend extends DataClass implements Insertable<Friend> {
  final int id;
  final String name;
  final String? email;
  final String? phoneNumber;
  final String? bankAccountNumber;
  const Friend(
      {required this.id,
      required this.name,
      this.email,
      this.phoneNumber,
      this.bankAccountNumber});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    if (!nullToAbsent || bankAccountNumber != null) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber);
    }
    return map;
  }

  FriendsCompanion toCompanion(bool nullToAbsent) {
    return FriendsCompanion(
      id: Value(id),
      name: Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      bankAccountNumber: bankAccountNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(bankAccountNumber),
    );
  }

  factory Friend.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Friend(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      bankAccountNumber:
          serializer.fromJson<String?>(json['bankAccountNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'bankAccountNumber': serializer.toJson<String?>(bankAccountNumber),
    };
  }

  Friend copyWith(
          {int? id,
          String? name,
          Value<String?> email = const Value.absent(),
          Value<String?> phoneNumber = const Value.absent(),
          Value<String?> bankAccountNumber = const Value.absent()}) =>
      Friend(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email.present ? email.value : this.email,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        bankAccountNumber: bankAccountNumber.present
            ? bankAccountNumber.value
            : this.bankAccountNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Friend(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('bankAccountNumber: $bankAccountNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, phoneNumber, bankAccountNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Friend &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.phoneNumber == this.phoneNumber &&
          other.bankAccountNumber == this.bankAccountNumber);
}

class FriendsCompanion extends UpdateCompanion<Friend> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> email;
  final Value<String?> phoneNumber;
  final Value<String?> bankAccountNumber;
  const FriendsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
  });
  FriendsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.bankAccountNumber = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Friend> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? phoneNumber,
    Expression<String>? bankAccountNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (bankAccountNumber != null) 'bank_account_number': bankAccountNumber,
    });
  }

  FriendsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? email,
      Value<String?>? phoneNumber,
      Value<String?>? bankAccountNumber}) {
    return FriendsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
    }
    if (bankAccountNumber.present) {
      map['bank_account_number'] = Variable<String>(bankAccountNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FriendsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('bankAccountNumber: $bankAccountNumber')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }
}

class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String name;
  const Category({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Category copyWith({int? id, String? name}) => Category(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == this.id && other.name == this.name);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> name;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Category> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CategoriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AccountType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<AccountType>($AccountsTable.$convertertype);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<int> user = GeneratedColumn<int>(
      'user', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, type, user];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
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
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: $AccountsTable.$convertertype.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AccountType, String, String> $convertertype =
      const EnumNameConverter<AccountType>(AccountType.values);
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final String name;
  final AccountType type;
  final int user;
  const Account(
      {required this.id,
      required this.name,
      required this.type,
      required this.user});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      map['type'] = Variable<String>($AccountsTable.$convertertype.toSql(type));
    }
    map['user'] = Variable<int>(user);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      user: Value(user),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: $AccountsTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      user: serializer.fromJson<int>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type':
          serializer.toJson<String>($AccountsTable.$convertertype.toJson(type)),
      'user': serializer.toJson<int>(user),
    };
  }

  Account copyWith({int? id, String? name, AccountType? type, int? user}) =>
      Account(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        user: user ?? this.user,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, user);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.user == this.user);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<String> name;
  final Value<AccountType> type;
  final Value<int> user;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.user = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required AccountType type,
    required int user,
  })  : name = Value(name),
        type = Value(type),
        user = Value(user);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (user != null) 'user': user,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<AccountType>? type,
      Value<int>? user}) {
    return AccountsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      user: user ?? this.user,
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
    if (type.present) {
      map['type'] =
          Variable<String>($AccountsTable.$convertertype.toSql(type.value));
    }
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<int> category = GeneratedColumn<int>(
      'category', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES categories (id)'));
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumn<int> user = GeneratedColumn<int>(
      'user', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _accountMeta =
      const VerificationMeta('account');
  @override
  late final GeneratedColumn<int> account = GeneratedColumn<int>(
      'account', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES accounts (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, amount, date, category, user, description, account];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('user')) {
      context.handle(
          _userMeta, user.isAcceptableOrUnknown(data['user']!, _userMeta));
    } else if (isInserting) {
      context.missing(_userMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('account')) {
      context.handle(_accountMeta,
          account.isAcceptableOrUnknown(data['account']!, _accountMeta));
    } else if (isInserting) {
      context.missing(_accountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category']),
      user: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      account: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final String title;
  final double amount;
  final DateTime date;
  final int? category;
  final int user;
  final String? description;
  final int account;
  const Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      this.category,
      required this.user,
      this.description,
      required this.account});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<int>(category);
    }
    map['user'] = Variable<int>(user);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['account'] = Variable<int>(account);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      title: Value(title),
      amount: Value(amount),
      date: Value(date),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      user: Value(user),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      account: Value(account),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      category: serializer.fromJson<int?>(json['category']),
      user: serializer.fromJson<int>(json['user']),
      description: serializer.fromJson<String?>(json['description']),
      account: serializer.fromJson<int>(json['account']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
      'category': serializer.toJson<int?>(category),
      'user': serializer.toJson<int>(user),
      'description': serializer.toJson<String?>(description),
      'account': serializer.toJson<int>(account),
    };
  }

  Transaction copyWith(
          {int? id,
          String? title,
          double? amount,
          DateTime? date,
          Value<int?> category = const Value.absent(),
          int? user,
          Value<String?> description = const Value.absent(),
          int? account}) =>
      Transaction(
        id: id ?? this.id,
        title: title ?? this.title,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        category: category.present ? category.value : this.category,
        user: user ?? this.user,
        description: description.present ? description.value : this.description,
        account: account ?? this.account,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('user: $user, ')
          ..write('description: $description, ')
          ..write('account: $account')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, title, amount, date, category, user, description, account);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.title == this.title &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.category == this.category &&
          other.user == this.user &&
          other.description == this.description &&
          other.account == this.account);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> amount;
  final Value<DateTime> date;
  final Value<int?> category;
  final Value<int> user;
  final Value<String?> description;
  final Value<int> account;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.category = const Value.absent(),
    this.user = const Value.absent(),
    this.description = const Value.absent(),
    this.account = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double amount,
    required DateTime date,
    this.category = const Value.absent(),
    required int user,
    this.description = const Value.absent(),
    required int account,
  })  : title = Value(title),
        amount = Value(amount),
        date = Value(date),
        user = Value(user),
        account = Value(account);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? amount,
    Expression<DateTime>? date,
    Expression<int>? category,
    Expression<int>? user,
    Expression<String>? description,
    Expression<int>? account,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (category != null) 'category': category,
      if (user != null) 'user': user,
      if (description != null) 'description': description,
      if (account != null) 'account': account,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? amount,
      Value<DateTime>? date,
      Value<int?>? category,
      Value<int>? user,
      Value<String?>? description,
      Value<int>? account}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
      user: user ?? this.user,
      description: description ?? this.description,
      account: account ?? this.account,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (category.present) {
      map['category'] = Variable<int>(category.value);
    }
    if (user.present) {
      map['user'] = Variable<int>(user.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (account.present) {
      map['account'] = Variable<int>(account.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('category: $category, ')
          ..write('user: $user, ')
          ..write('description: $description, ')
          ..write('account: $account')
          ..write(')'))
        .toString();
  }
}

class $SettlementsTable extends Settlements
    with TableInfo<$SettlementsTable, Settlement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettlementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _numberOfFriendsMeta =
      const VerificationMeta('numberOfFriends');
  @override
  late final GeneratedColumn<int> numberOfFriends = GeneratedColumn<int>(
      'number_of_friends', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, date, description, value, numberOfFriends];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settlements';
  @override
  VerificationContext validateIntegrity(Insertable<Settlement> instance,
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
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('number_of_friends')) {
      context.handle(
          _numberOfFriendsMeta,
          numberOfFriends.isAcceptableOrUnknown(
              data['number_of_friends']!, _numberOfFriendsMeta));
    } else if (isInserting) {
      context.missing(_numberOfFriendsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Settlement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Settlement(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      numberOfFriends: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number_of_friends'])!,
    );
  }

  @override
  $SettlementsTable createAlias(String alias) {
    return $SettlementsTable(attachedDatabase, alias);
  }
}

class Settlement extends DataClass implements Insertable<Settlement> {
  final int id;
  final String name;
  final DateTime date;
  final String? description;
  final double value;
  final int numberOfFriends;
  const Settlement(
      {required this.id,
      required this.name,
      required this.date,
      this.description,
      required this.value,
      required this.numberOfFriends});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['value'] = Variable<double>(value);
    map['number_of_friends'] = Variable<int>(numberOfFriends);
    return map;
  }

  SettlementsCompanion toCompanion(bool nullToAbsent) {
    return SettlementsCompanion(
      id: Value(id),
      name: Value(name),
      date: Value(date),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      value: Value(value),
      numberOfFriends: Value(numberOfFriends),
    );
  }

  factory Settlement.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Settlement(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      date: serializer.fromJson<DateTime>(json['date']),
      description: serializer.fromJson<String?>(json['description']),
      value: serializer.fromJson<double>(json['value']),
      numberOfFriends: serializer.fromJson<int>(json['numberOfFriends']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'date': serializer.toJson<DateTime>(date),
      'description': serializer.toJson<String?>(description),
      'value': serializer.toJson<double>(value),
      'numberOfFriends': serializer.toJson<int>(numberOfFriends),
    };
  }

  Settlement copyWith(
          {int? id,
          String? name,
          DateTime? date,
          Value<String?> description = const Value.absent(),
          double? value,
          int? numberOfFriends}) =>
      Settlement(
        id: id ?? this.id,
        name: name ?? this.name,
        date: date ?? this.date,
        description: description.present ? description.value : this.description,
        value: value ?? this.value,
        numberOfFriends: numberOfFriends ?? this.numberOfFriends,
      );
  @override
  String toString() {
    return (StringBuffer('Settlement(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('value: $value, ')
          ..write('numberOfFriends: $numberOfFriends')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, date, description, value, numberOfFriends);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Settlement &&
          other.id == this.id &&
          other.name == this.name &&
          other.date == this.date &&
          other.description == this.description &&
          other.value == this.value &&
          other.numberOfFriends == this.numberOfFriends);
}

class SettlementsCompanion extends UpdateCompanion<Settlement> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> date;
  final Value<String?> description;
  final Value<double> value;
  final Value<int> numberOfFriends;
  const SettlementsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.value = const Value.absent(),
    this.numberOfFriends = const Value.absent(),
  });
  SettlementsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime date,
    this.description = const Value.absent(),
    required double value,
    required int numberOfFriends,
  })  : name = Value(name),
        date = Value(date),
        value = Value(value),
        numberOfFriends = Value(numberOfFriends);
  static Insertable<Settlement> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? date,
    Expression<String>? description,
    Expression<double>? value,
    Expression<int>? numberOfFriends,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (value != null) 'value': value,
      if (numberOfFriends != null) 'number_of_friends': numberOfFriends,
    });
  }

  SettlementsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? date,
      Value<String?>? description,
      Value<double>? value,
      Value<int>? numberOfFriends}) {
    return SettlementsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      description: description ?? this.description,
      value: value ?? this.value,
      numberOfFriends: numberOfFriends ?? this.numberOfFriends,
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
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (numberOfFriends.present) {
      map['number_of_friends'] = Variable<int>(numberOfFriends.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettlementsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('value: $value, ')
          ..write('numberOfFriends: $numberOfFriends')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _settlementMeta =
      const VerificationMeta('settlement');
  @override
  late final GeneratedColumn<int> settlement = GeneratedColumn<int>(
      'settlement', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES settlements (id)'));
  @override
  List<GeneratedColumn> get $columns => [id, name, price, quantity, settlement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
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
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('settlement')) {
      context.handle(
          _settlementMeta,
          settlement.isAcceptableOrUnknown(
              data['settlement']!, _settlementMeta));
    } else if (isInserting) {
      context.missing(_settlementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      settlement: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}settlement'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String name;
  final double price;
  final int quantity;
  final int settlement;
  const Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.settlement});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    map['quantity'] = Variable<int>(quantity);
    map['settlement'] = Variable<int>(settlement);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      name: Value(name),
      price: Value(price),
      quantity: Value(quantity),
      settlement: Value(settlement),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      quantity: serializer.fromJson<int>(json['quantity']),
      settlement: serializer.fromJson<int>(json['settlement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'quantity': serializer.toJson<int>(quantity),
      'settlement': serializer.toJson<int>(settlement),
    };
  }

  Product copyWith(
          {int? id,
          String? name,
          double? price,
          int? quantity,
          int? settlement}) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        settlement: settlement ?? this.settlement,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('settlement: $settlement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, quantity, settlement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.quantity == this.quantity &&
          other.settlement == this.settlement);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> price;
  final Value<int> quantity;
  final Value<int> settlement;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.quantity = const Value.absent(),
    this.settlement = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double price,
    required int quantity,
    required int settlement,
  })  : name = Value(name),
        price = Value(price),
        quantity = Value(quantity),
        settlement = Value(settlement);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? price,
    Expression<int>? quantity,
    Expression<int>? settlement,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (quantity != null) 'quantity': quantity,
      if (settlement != null) 'settlement': settlement,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double>? price,
      Value<int>? quantity,
      Value<int>? settlement}) {
    return ProductsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      settlement: settlement ?? this.settlement,
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
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (settlement.present) {
      map['settlement'] = Variable<int>(settlement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('quantity: $quantity, ')
          ..write('settlement: $settlement')
          ..write(')'))
        .toString();
  }
}

class $SettlementFriendsTable extends SettlementFriends
    with TableInfo<$SettlementFriendsTable, SettlementFriend> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettlementFriendsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settlementIdMeta =
      const VerificationMeta('settlementId');
  @override
  late final GeneratedColumn<int> settlementId = GeneratedColumn<int>(
      'settlement_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES settlements(id)');
  static const VerificationMeta _friendIdMeta =
      const VerificationMeta('friendId');
  @override
  late final GeneratedColumn<int> friendId = GeneratedColumn<int>(
      'friend_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES friends(id)');
  @override
  List<GeneratedColumn> get $columns => [settlementId, friendId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settlement_friends';
  @override
  VerificationContext validateIntegrity(Insertable<SettlementFriend> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('settlement_id')) {
      context.handle(
          _settlementIdMeta,
          settlementId.isAcceptableOrUnknown(
              data['settlement_id']!, _settlementIdMeta));
    } else if (isInserting) {
      context.missing(_settlementIdMeta);
    }
    if (data.containsKey('friend_id')) {
      context.handle(_friendIdMeta,
          friendId.isAcceptableOrUnknown(data['friend_id']!, _friendIdMeta));
    } else if (isInserting) {
      context.missing(_friendIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SettlementFriend map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettlementFriend(
      settlementId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}settlement_id'])!,
      friendId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}friend_id'])!,
    );
  }

  @override
  $SettlementFriendsTable createAlias(String alias) {
    return $SettlementFriendsTable(attachedDatabase, alias);
  }
}

class SettlementFriend extends DataClass
    implements Insertable<SettlementFriend> {
  final int settlementId;
  final int friendId;
  const SettlementFriend({required this.settlementId, required this.friendId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['settlement_id'] = Variable<int>(settlementId);
    map['friend_id'] = Variable<int>(friendId);
    return map;
  }

  SettlementFriendsCompanion toCompanion(bool nullToAbsent) {
    return SettlementFriendsCompanion(
      settlementId: Value(settlementId),
      friendId: Value(friendId),
    );
  }

  factory SettlementFriend.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettlementFriend(
      settlementId: serializer.fromJson<int>(json['settlementId']),
      friendId: serializer.fromJson<int>(json['friendId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'settlementId': serializer.toJson<int>(settlementId),
      'friendId': serializer.toJson<int>(friendId),
    };
  }

  SettlementFriend copyWith({int? settlementId, int? friendId}) =>
      SettlementFriend(
        settlementId: settlementId ?? this.settlementId,
        friendId: friendId ?? this.friendId,
      );
  @override
  String toString() {
    return (StringBuffer('SettlementFriend(')
          ..write('settlementId: $settlementId, ')
          ..write('friendId: $friendId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(settlementId, friendId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettlementFriend &&
          other.settlementId == this.settlementId &&
          other.friendId == this.friendId);
}

class SettlementFriendsCompanion extends UpdateCompanion<SettlementFriend> {
  final Value<int> settlementId;
  final Value<int> friendId;
  final Value<int> rowid;
  const SettlementFriendsCompanion({
    this.settlementId = const Value.absent(),
    this.friendId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettlementFriendsCompanion.insert({
    required int settlementId,
    required int friendId,
    this.rowid = const Value.absent(),
  })  : settlementId = Value(settlementId),
        friendId = Value(friendId);
  static Insertable<SettlementFriend> custom({
    Expression<int>? settlementId,
    Expression<int>? friendId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (settlementId != null) 'settlement_id': settlementId,
      if (friendId != null) 'friend_id': friendId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettlementFriendsCompanion copyWith(
      {Value<int>? settlementId, Value<int>? friendId, Value<int>? rowid}) {
    return SettlementFriendsCompanion(
      settlementId: settlementId ?? this.settlementId,
      friendId: friendId ?? this.friendId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settlementId.present) {
      map['settlement_id'] = Variable<int>(settlementId.value);
    }
    if (friendId.present) {
      map['friend_id'] = Variable<int>(friendId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettlementFriendsCompanion(')
          ..write('settlementId: $settlementId, ')
          ..write('friendId: $friendId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $FriendsTable friends = $FriendsTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  late final $SettlementsTable settlements = $SettlementsTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $SettlementFriendsTable settlementFriends =
      $SettlementFriendsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        friends,
        categories,
        accounts,
        transactions,
        settlements,
        products,
        settlementFriends
      ];
}
