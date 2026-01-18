// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
    'uid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _fullNameMeta = const VerificationMeta(
    'fullName',
  );
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
    'full_name',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  late final GeneratedColumnWithTypeConverter<UserRole, String> role =
      GeneratedColumn<String>(
        'role',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UserRole>($UsersTable.$converterrole);
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastLoginAtMeta = const VerificationMeta(
    'lastLoginAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastLoginAt = GeneratedColumn<DateTime>(
    'last_login_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    uid,
    username,
    fullName,
    email,
    role,
    isActive,
    isSynced,
    remoteId,
    lastSyncedAt,
    createdAt,
    updatedAt,
    lastLoginAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
        _uidMeta,
        uid.isAcceptableOrUnknown(data['uid']!, _uidMeta),
      );
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(
        _fullNameMeta,
        fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('last_login_at')) {
      context.handle(
        _lastLoginAtMeta,
        lastLoginAt.isAcceptableOrUnknown(
          data['last_login_at']!,
          _lastLoginAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      uid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uid'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      fullName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}full_name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      role: $UsersTable.$converterrole.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}role'],
        )!,
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      lastLoginAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_login_at'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserRole, String, String> $converterrole =
      const EnumNameConverter<UserRole>(UserRole.values);
}

class User extends DataClass implements Insertable<User> {
  final String uid;
  final String username;
  final String? fullName;
  final String email;
  final UserRole role;
  final bool isActive;
  final bool isSynced;
  final String? remoteId;
  final DateTime? lastSyncedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastLoginAt;
  const User({
    required this.uid,
    required this.username,
    this.fullName,
    required this.email,
    required this.role,
    required this.isActive,
    required this.isSynced,
    this.remoteId,
    this.lastSyncedAt,
    required this.createdAt,
    required this.updatedAt,
    this.lastLoginAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['username'] = Variable<String>(username);
    if (!nullToAbsent || fullName != null) {
      map['full_name'] = Variable<String>(fullName);
    }
    map['email'] = Variable<String>(email);
    {
      map['role'] = Variable<String>($UsersTable.$converterrole.toSql(role));
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastLoginAt != null) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uid: Value(uid),
      username: Value(username),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      email: Value(email),
      role: Value(role),
      isActive: Value(isActive),
      isSynced: Value(isSynced),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastLoginAt: lastLoginAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastLoginAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      uid: serializer.fromJson<String>(json['uid']),
      username: serializer.fromJson<String>(json['username']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      email: serializer.fromJson<String>(json['email']),
      role: $UsersTable.$converterrole.fromJson(
        serializer.fromJson<String>(json['role']),
      ),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastLoginAt: serializer.fromJson<DateTime?>(json['lastLoginAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'username': serializer.toJson<String>(username),
      'fullName': serializer.toJson<String?>(fullName),
      'email': serializer.toJson<String>(email),
      'role': serializer.toJson<String>(
        $UsersTable.$converterrole.toJson(role),
      ),
      'isActive': serializer.toJson<bool>(isActive),
      'isSynced': serializer.toJson<bool>(isSynced),
      'remoteId': serializer.toJson<String?>(remoteId),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastLoginAt': serializer.toJson<DateTime?>(lastLoginAt),
    };
  }

  User copyWith({
    String? uid,
    String? username,
    Value<String?> fullName = const Value.absent(),
    String? email,
    UserRole? role,
    bool? isActive,
    bool? isSynced,
    Value<String?> remoteId = const Value.absent(),
    Value<DateTime?> lastSyncedAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> lastLoginAt = const Value.absent(),
  }) => User(
    uid: uid ?? this.uid,
    username: username ?? this.username,
    fullName: fullName.present ? fullName.value : this.fullName,
    email: email ?? this.email,
    role: role ?? this.role,
    isActive: isActive ?? this.isActive,
    isSynced: isSynced ?? this.isSynced,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    lastSyncedAt: lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastLoginAt: lastLoginAt.present ? lastLoginAt.value : this.lastLoginAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      uid: data.uid.present ? data.uid.value : this.uid,
      username: data.username.present ? data.username.value : this.username,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      role: data.role.present ? data.role.value : this.role,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastLoginAt: data.lastLoginAt.present
          ? data.lastLoginAt.value
          : this.lastLoginAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('uid: $uid, ')
          ..write('username: $username, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('isSynced: $isSynced, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastLoginAt: $lastLoginAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uid,
    username,
    fullName,
    email,
    role,
    isActive,
    isSynced,
    remoteId,
    lastSyncedAt,
    createdAt,
    updatedAt,
    lastLoginAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.uid == this.uid &&
          other.username == this.username &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.role == this.role &&
          other.isActive == this.isActive &&
          other.isSynced == this.isSynced &&
          other.remoteId == this.remoteId &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastLoginAt == this.lastLoginAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> uid;
  final Value<String> username;
  final Value<String?> fullName;
  final Value<String> email;
  final Value<UserRole> role;
  final Value<bool> isActive;
  final Value<bool> isSynced;
  final Value<String?> remoteId;
  final Value<DateTime?> lastSyncedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> lastLoginAt;
  final Value<int> rowid;
  const UsersCompanion({
    this.uid = const Value.absent(),
    this.username = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.role = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String uid,
    required String username,
    this.fullName = const Value.absent(),
    required String email,
    required UserRole role,
    this.isActive = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastLoginAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uid = Value(uid),
       username = Value(username),
       email = Value(email),
       role = Value(role);
  static Insertable<User> custom({
    Expression<String>? uid,
    Expression<String>? username,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? role,
    Expression<bool>? isActive,
    Expression<bool>? isSynced,
    Expression<String>? remoteId,
    Expression<DateTime>? lastSyncedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastLoginAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (username != null) 'username': username,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
      if (isActive != null) 'is_active': isActive,
      if (isSynced != null) 'is_synced': isSynced,
      if (remoteId != null) 'remote_id': remoteId,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastLoginAt != null) 'last_login_at': lastLoginAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith({
    Value<String>? uid,
    Value<String>? username,
    Value<String?>? fullName,
    Value<String>? email,
    Value<UserRole>? role,
    Value<bool>? isActive,
    Value<bool>? isSynced,
    Value<String?>? remoteId,
    Value<DateTime?>? lastSyncedAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? lastLoginAt,
    Value<int>? rowid,
  }) {
    return UsersCompanion(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      role: role ?? this.role,
      isActive: isActive ?? this.isActive,
      isSynced: isSynced ?? this.isSynced,
      remoteId: remoteId ?? this.remoteId,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(
        $UsersTable.$converterrole.toSql(role.value),
      );
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastLoginAt.present) {
      map['last_login_at'] = Variable<DateTime>(lastLoginAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uid: $uid, ')
          ..write('username: $username, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('role: $role, ')
          ..write('isActive: $isActive, ')
          ..write('isSynced: $isSynced, ')
          ..write('remoteId: $remoteId, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastLoginAt: $lastLoginAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AgenciesTable extends Agencies with TableInfo<$AgenciesTable, Agency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgenciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    code,
    remoteId,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agencies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Agency> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Agency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Agency(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AgenciesTable createAlias(String alias) {
    return $AgenciesTable(attachedDatabase, alias);
  }
}

class Agency extends DataClass implements Insertable<Agency> {
  final int id;
  final String name;
  final String? code;
  final String? remoteId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Agency({
    required this.id,
    required this.name,
    this.code,
    this.remoteId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AgenciesCompanion toCompanion(bool nullToAbsent) {
    return AgenciesCompanion(
      id: Value(id),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Agency.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Agency(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'remoteId': serializer.toJson<String?>(remoteId),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Agency copyWith({
    int? id,
    String? name,
    Value<String?> code = const Value.absent(),
    Value<String?> remoteId = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Agency(
    id: id ?? this.id,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Agency copyWithCompanion(AgenciesCompanion data) {
    return Agency(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Agency(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('remoteId: $remoteId, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, code, remoteId, isActive, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Agency &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.remoteId == this.remoteId &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AgenciesCompanion extends UpdateCompanion<Agency> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> code;
  final Value<String?> remoteId;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AgenciesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AgenciesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Agency> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? remoteId,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (remoteId != null) 'remote_id': remoteId,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AgenciesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? code,
    Value<String?>? remoteId,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return AgenciesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      remoteId: remoteId ?? this.remoteId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgenciesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('remoteId: $remoteId, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $MinistriesTable extends Ministries
    with TableInfo<$MinistriesTable, Ministry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MinistriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _agencyIdMeta = const VerificationMeta(
    'agencyId',
  );
  @override
  late final GeneratedColumn<int> agencyId = GeneratedColumn<int>(
    'agency_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES agencies (id)',
    ),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    code,
    remoteId,
    agencyId,
    isActive,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ministries';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ministry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('agency_id')) {
      context.handle(
        _agencyIdMeta,
        agencyId.isAcceptableOrUnknown(data['agency_id']!, _agencyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ministry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ministry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      agencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agency_id'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MinistriesTable createAlias(String alias) {
    return $MinistriesTable(attachedDatabase, alias);
  }
}

class Ministry extends DataClass implements Insertable<Ministry> {
  final int id;
  final String name;
  final String? code;
  final String? remoteId;
  final int agencyId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Ministry({
    required this.id,
    required this.name,
    this.code,
    this.remoteId,
    required this.agencyId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['agency_id'] = Variable<int>(agencyId);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  MinistriesCompanion toCompanion(bool nullToAbsent) {
    return MinistriesCompanion(
      id: Value(id),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      agencyId: Value(agencyId),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Ministry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ministry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      agencyId: serializer.fromJson<int>(json['agencyId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'remoteId': serializer.toJson<String?>(remoteId),
      'agencyId': serializer.toJson<int>(agencyId),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Ministry copyWith({
    int? id,
    String? name,
    Value<String?> code = const Value.absent(),
    Value<String?> remoteId = const Value.absent(),
    int? agencyId,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Ministry(
    id: id ?? this.id,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    agencyId: agencyId ?? this.agencyId,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Ministry copyWithCompanion(MinistriesCompanion data) {
    return Ministry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      agencyId: data.agencyId.present ? data.agencyId.value : this.agencyId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ministry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('remoteId: $remoteId, ')
          ..write('agencyId: $agencyId, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    code,
    remoteId,
    agencyId,
    isActive,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ministry &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.remoteId == this.remoteId &&
          other.agencyId == this.agencyId &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MinistriesCompanion extends UpdateCompanion<Ministry> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> code;
  final Value<String?> remoteId;
  final Value<int> agencyId;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const MinistriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.agencyId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  MinistriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    this.remoteId = const Value.absent(),
    required int agencyId,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       agencyId = Value(agencyId);
  static Insertable<Ministry> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? remoteId,
    Expression<int>? agencyId,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (remoteId != null) 'remote_id': remoteId,
      if (agencyId != null) 'agency_id': agencyId,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  MinistriesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? code,
    Value<String?>? remoteId,
    Value<int>? agencyId,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return MinistriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      remoteId: remoteId ?? this.remoteId,
      agencyId: agencyId ?? this.agencyId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (agencyId.present) {
      map['agency_id'] = Variable<int>(agencyId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MinistriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('remoteId: $remoteId, ')
          ..write('agencyId: $agencyId, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GeopoliticalZonesTable extends GeopoliticalZones
    with TableInfo<$GeopoliticalZonesTable, GeopoliticalZone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeopoliticalZonesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 5,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, code, remoteId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geopolitical_zones';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeopoliticalZone> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeopoliticalZone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeopoliticalZone(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $GeopoliticalZonesTable createAlias(String alias) {
    return $GeopoliticalZonesTable(attachedDatabase, alias);
  }
}

class GeopoliticalZone extends DataClass
    implements Insertable<GeopoliticalZone> {
  final int id;
  final String name;
  final String? code;
  final String? remoteId;
  final DateTime createdAt;
  const GeopoliticalZone({
    required this.id,
    required this.name,
    this.code,
    this.remoteId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  GeopoliticalZonesCompanion toCompanion(bool nullToAbsent) {
    return GeopoliticalZonesCompanion(
      id: Value(id),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      createdAt: Value(createdAt),
    );
  }

  factory GeopoliticalZone.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeopoliticalZone(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  GeopoliticalZone copyWith({
    int? id,
    String? name,
    Value<String?> code = const Value.absent(),
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
  }) => GeopoliticalZone(
    id: id ?? this.id,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    createdAt: createdAt ?? this.createdAt,
  );
  GeopoliticalZone copyWithCompanion(GeopoliticalZonesCompanion data) {
    return GeopoliticalZone(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeopoliticalZone(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, remoteId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeopoliticalZone &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.remoteId == this.remoteId &&
          other.createdAt == this.createdAt);
}

class GeopoliticalZonesCompanion extends UpdateCompanion<GeopoliticalZone> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> code;
  final Value<String?> remoteId;
  final Value<DateTime> createdAt;
  const GeopoliticalZonesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  GeopoliticalZonesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<GeopoliticalZone> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? remoteId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  GeopoliticalZonesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? code,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
  }) {
    return GeopoliticalZonesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeopoliticalZonesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $StatesTable extends States with TableInfo<$StatesTable, State> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
    'zone_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES geopolitical_zones (id)',
    ),
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    code,
    zoneId,
    remoteId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'states';
  @override
  VerificationContext validateIntegrity(
    Insertable<State> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('zone_id')) {
      context.handle(
        _zoneIdMeta,
        zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  State map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return State(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      zoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}zone_id'],
      )!,
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $StatesTable createAlias(String alias) {
    return $StatesTable(attachedDatabase, alias);
  }
}

class State extends DataClass implements Insertable<State> {
  final int id;
  final String name;
  final String? code;
  final int zoneId;
  final String? remoteId;
  final DateTime createdAt;
  const State({
    required this.id,
    required this.name,
    this.code,
    required this.zoneId,
    this.remoteId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    map['zone_id'] = Variable<int>(zoneId);
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  StatesCompanion toCompanion(bool nullToAbsent) {
    return StatesCompanion(
      id: Value(id),
      name: Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      zoneId: Value(zoneId),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      createdAt: Value(createdAt),
    );
  }

  factory State.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return State(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      zoneId: serializer.fromJson<int>(json['zoneId']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String?>(code),
      'zoneId': serializer.toJson<int>(zoneId),
      'remoteId': serializer.toJson<String?>(remoteId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  State copyWith({
    int? id,
    String? name,
    Value<String?> code = const Value.absent(),
    int? zoneId,
    Value<String?> remoteId = const Value.absent(),
    DateTime? createdAt,
  }) => State(
    id: id ?? this.id,
    name: name ?? this.name,
    code: code.present ? code.value : this.code,
    zoneId: zoneId ?? this.zoneId,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    createdAt: createdAt ?? this.createdAt,
  );
  State copyWithCompanion(StatesCompanion data) {
    return State(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      zoneId: data.zoneId.present ? data.zoneId.value : this.zoneId,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('State(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('zoneId: $zoneId, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, zoneId, remoteId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is State &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.zoneId == this.zoneId &&
          other.remoteId == this.remoteId &&
          other.createdAt == this.createdAt);
}

class StatesCompanion extends UpdateCompanion<State> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> code;
  final Value<int> zoneId;
  final Value<String?> remoteId;
  final Value<DateTime> createdAt;
  const StatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  StatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.code = const Value.absent(),
    required int zoneId,
    this.remoteId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       zoneId = Value(zoneId);
  static Insertable<State> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<int>? zoneId,
    Expression<String>? remoteId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (zoneId != null) 'zone_id': zoneId,
      if (remoteId != null) 'remote_id': remoteId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  StatesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? code,
    Value<int>? zoneId,
    Value<String?>? remoteId,
    Value<DateTime>? createdAt,
  }) {
    return StatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      zoneId: zoneId ?? this.zoneId,
      remoteId: remoteId ?? this.remoteId,
      createdAt: createdAt ?? this.createdAt,
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
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('zoneId: $zoneId, ')
          ..write('remoteId: $remoteId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ProjectsTable extends Projects with TableInfo<$ProjectsTable, Project> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ProjectStatus, String> status =
      GeneratedColumn<String>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ProjectStatus>($ProjectsTable.$converterstatus);
  static const VerificationMeta _agencyIdMeta = const VerificationMeta(
    'agencyId',
  );
  @override
  late final GeneratedColumn<int> agencyId = GeneratedColumn<int>(
    'agency_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES agencies (id)',
    ),
  );
  static const VerificationMeta _ministryIdMeta = const VerificationMeta(
    'ministryId',
  );
  @override
  late final GeneratedColumn<int> ministryId = GeneratedColumn<int>(
    'ministry_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ministries (id)',
    ),
  );
  static const VerificationMeta _stateIdMeta = const VerificationMeta(
    'stateId',
  );
  @override
  late final GeneratedColumn<int> stateId = GeneratedColumn<int>(
    'state_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES states (id)',
    ),
  );
  static const VerificationMeta _zoneIdMeta = const VerificationMeta('zoneId');
  @override
  late final GeneratedColumn<int> zoneId = GeneratedColumn<int>(
    'zone_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES geopolitical_zones (id)',
    ),
  );
  static const VerificationMeta _createdByMeta = const VerificationMeta(
    'createdBy',
  );
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
    'created_by',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _modifiedByMeta = const VerificationMeta(
    'modifiedBy',
  );
  @override
  late final GeneratedColumn<String> modifiedBy = GeneratedColumn<String>(
    'modified_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  static const VerificationMeta _constituencyMeta = const VerificationMeta(
    'constituency',
  );
  @override
  late final GeneratedColumn<String> constituency = GeneratedColumn<String>(
    'constituency',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sponsorMeta = const VerificationMeta(
    'sponsor',
  );
  @override
  late final GeneratedColumn<String> sponsor = GeneratedColumn<String>(
    'sponsor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteIdMeta = const VerificationMeta(
    'remoteId',
  );
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
    'remote_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    code,
    status,
    agencyId,
    ministryId,
    stateId,
    zoneId,
    createdBy,
    modifiedBy,
    createdAt,
    updatedAt,
    lastSyncedAt,
    isSynced,
    constituency,
    amount,
    title,
    sponsor,
    remoteId,
    startDate,
    endDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'projects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Project> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('agency_id')) {
      context.handle(
        _agencyIdMeta,
        agencyId.isAcceptableOrUnknown(data['agency_id']!, _agencyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_agencyIdMeta);
    }
    if (data.containsKey('ministry_id')) {
      context.handle(
        _ministryIdMeta,
        ministryId.isAcceptableOrUnknown(data['ministry_id']!, _ministryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ministryIdMeta);
    }
    if (data.containsKey('state_id')) {
      context.handle(
        _stateIdMeta,
        stateId.isAcceptableOrUnknown(data['state_id']!, _stateIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stateIdMeta);
    }
    if (data.containsKey('zone_id')) {
      context.handle(
        _zoneIdMeta,
        zoneId.isAcceptableOrUnknown(data['zone_id']!, _zoneIdMeta),
      );
    } else if (isInserting) {
      context.missing(_zoneIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(
        _createdByMeta,
        createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta),
      );
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('modified_by')) {
      context.handle(
        _modifiedByMeta,
        modifiedBy.isAcceptableOrUnknown(data['modified_by']!, _modifiedByMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('constituency')) {
      context.handle(
        _constituencyMeta,
        constituency.isAcceptableOrUnknown(
          data['constituency']!,
          _constituencyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_constituencyMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('sponsor')) {
      context.handle(
        _sponsorMeta,
        sponsor.isAcceptableOrUnknown(data['sponsor']!, _sponsorMeta),
      );
    }
    if (data.containsKey('remote_id')) {
      context.handle(
        _remoteIdMeta,
        remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Project map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Project(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      status: $ProjectsTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}status'],
        )!,
      ),
      agencyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}agency_id'],
      )!,
      ministryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ministry_id'],
      )!,
      stateId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}state_id'],
      )!,
      zoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}zone_id'],
      )!,
      createdBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_by'],
      )!,
      modifiedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}modified_by'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      constituency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}constituency'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      sponsor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sponsor'],
      ),
      remoteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}remote_id'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date'],
      ),
    );
  }

  @override
  $ProjectsTable createAlias(String alias) {
    return $ProjectsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ProjectStatus, String, String> $converterstatus =
      const EnumNameConverter<ProjectStatus>(ProjectStatus.values);
}

class Project extends DataClass implements Insertable<Project> {
  final String code;
  final ProjectStatus status;
  final int agencyId;
  final int ministryId;
  final int stateId;
  final int zoneId;
  final String createdBy;
  final String? modifiedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastSyncedAt;
  final bool isSynced;
  final String constituency;
  final double amount;
  final String title;
  final String? sponsor;
  final String? remoteId;
  final DateTime? startDate;
  final DateTime? endDate;
  const Project({
    required this.code,
    required this.status,
    required this.agencyId,
    required this.ministryId,
    required this.stateId,
    required this.zoneId,
    required this.createdBy,
    this.modifiedBy,
    required this.createdAt,
    required this.updatedAt,
    this.lastSyncedAt,
    required this.isSynced,
    required this.constituency,
    required this.amount,
    required this.title,
    this.sponsor,
    this.remoteId,
    this.startDate,
    this.endDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    {
      map['status'] = Variable<String>(
        $ProjectsTable.$converterstatus.toSql(status),
      );
    }
    map['agency_id'] = Variable<int>(agencyId);
    map['ministry_id'] = Variable<int>(ministryId);
    map['state_id'] = Variable<int>(stateId);
    map['zone_id'] = Variable<int>(zoneId);
    map['created_by'] = Variable<String>(createdBy);
    if (!nullToAbsent || modifiedBy != null) {
      map['modified_by'] = Variable<String>(modifiedBy);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || lastSyncedAt != null) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    map['constituency'] = Variable<String>(constituency);
    map['amount'] = Variable<double>(amount);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || sponsor != null) {
      map['sponsor'] = Variable<String>(sponsor);
    }
    if (!nullToAbsent || remoteId != null) {
      map['remote_id'] = Variable<String>(remoteId);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    return map;
  }

  ProjectsCompanion toCompanion(bool nullToAbsent) {
    return ProjectsCompanion(
      code: Value(code),
      status: Value(status),
      agencyId: Value(agencyId),
      ministryId: Value(ministryId),
      stateId: Value(stateId),
      zoneId: Value(zoneId),
      createdBy: Value(createdBy),
      modifiedBy: modifiedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(modifiedBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastSyncedAt: lastSyncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncedAt),
      isSynced: Value(isSynced),
      constituency: Value(constituency),
      amount: Value(amount),
      title: Value(title),
      sponsor: sponsor == null && nullToAbsent
          ? const Value.absent()
          : Value(sponsor),
      remoteId: remoteId == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteId),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
    );
  }

  factory Project.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Project(
      code: serializer.fromJson<String>(json['code']),
      status: $ProjectsTable.$converterstatus.fromJson(
        serializer.fromJson<String>(json['status']),
      ),
      agencyId: serializer.fromJson<int>(json['agencyId']),
      ministryId: serializer.fromJson<int>(json['ministryId']),
      stateId: serializer.fromJson<int>(json['stateId']),
      zoneId: serializer.fromJson<int>(json['zoneId']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      modifiedBy: serializer.fromJson<String?>(json['modifiedBy']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastSyncedAt: serializer.fromJson<DateTime?>(json['lastSyncedAt']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      constituency: serializer.fromJson<String>(json['constituency']),
      amount: serializer.fromJson<double>(json['amount']),
      title: serializer.fromJson<String>(json['title']),
      sponsor: serializer.fromJson<String?>(json['sponsor']),
      remoteId: serializer.fromJson<String?>(json['remoteId']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'status': serializer.toJson<String>(
        $ProjectsTable.$converterstatus.toJson(status),
      ),
      'agencyId': serializer.toJson<int>(agencyId),
      'ministryId': serializer.toJson<int>(ministryId),
      'stateId': serializer.toJson<int>(stateId),
      'zoneId': serializer.toJson<int>(zoneId),
      'createdBy': serializer.toJson<String>(createdBy),
      'modifiedBy': serializer.toJson<String?>(modifiedBy),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastSyncedAt': serializer.toJson<DateTime?>(lastSyncedAt),
      'isSynced': serializer.toJson<bool>(isSynced),
      'constituency': serializer.toJson<String>(constituency),
      'amount': serializer.toJson<double>(amount),
      'title': serializer.toJson<String>(title),
      'sponsor': serializer.toJson<String?>(sponsor),
      'remoteId': serializer.toJson<String?>(remoteId),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
    };
  }

  Project copyWith({
    String? code,
    ProjectStatus? status,
    int? agencyId,
    int? ministryId,
    int? stateId,
    int? zoneId,
    String? createdBy,
    Value<String?> modifiedBy = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> lastSyncedAt = const Value.absent(),
    bool? isSynced,
    String? constituency,
    double? amount,
    String? title,
    Value<String?> sponsor = const Value.absent(),
    Value<String?> remoteId = const Value.absent(),
    Value<DateTime?> startDate = const Value.absent(),
    Value<DateTime?> endDate = const Value.absent(),
  }) => Project(
    code: code ?? this.code,
    status: status ?? this.status,
    agencyId: agencyId ?? this.agencyId,
    ministryId: ministryId ?? this.ministryId,
    stateId: stateId ?? this.stateId,
    zoneId: zoneId ?? this.zoneId,
    createdBy: createdBy ?? this.createdBy,
    modifiedBy: modifiedBy.present ? modifiedBy.value : this.modifiedBy,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastSyncedAt: lastSyncedAt.present ? lastSyncedAt.value : this.lastSyncedAt,
    isSynced: isSynced ?? this.isSynced,
    constituency: constituency ?? this.constituency,
    amount: amount ?? this.amount,
    title: title ?? this.title,
    sponsor: sponsor.present ? sponsor.value : this.sponsor,
    remoteId: remoteId.present ? remoteId.value : this.remoteId,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
  );
  Project copyWithCompanion(ProjectsCompanion data) {
    return Project(
      code: data.code.present ? data.code.value : this.code,
      status: data.status.present ? data.status.value : this.status,
      agencyId: data.agencyId.present ? data.agencyId.value : this.agencyId,
      ministryId: data.ministryId.present
          ? data.ministryId.value
          : this.ministryId,
      stateId: data.stateId.present ? data.stateId.value : this.stateId,
      zoneId: data.zoneId.present ? data.zoneId.value : this.zoneId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      modifiedBy: data.modifiedBy.present
          ? data.modifiedBy.value
          : this.modifiedBy,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      constituency: data.constituency.present
          ? data.constituency.value
          : this.constituency,
      amount: data.amount.present ? data.amount.value : this.amount,
      title: data.title.present ? data.title.value : this.title,
      sponsor: data.sponsor.present ? data.sponsor.value : this.sponsor,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Project(')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('agencyId: $agencyId, ')
          ..write('ministryId: $ministryId, ')
          ..write('stateId: $stateId, ')
          ..write('zoneId: $zoneId, ')
          ..write('createdBy: $createdBy, ')
          ..write('modifiedBy: $modifiedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('constituency: $constituency, ')
          ..write('amount: $amount, ')
          ..write('title: $title, ')
          ..write('sponsor: $sponsor, ')
          ..write('remoteId: $remoteId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    code,
    status,
    agencyId,
    ministryId,
    stateId,
    zoneId,
    createdBy,
    modifiedBy,
    createdAt,
    updatedAt,
    lastSyncedAt,
    isSynced,
    constituency,
    amount,
    title,
    sponsor,
    remoteId,
    startDate,
    endDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Project &&
          other.code == this.code &&
          other.status == this.status &&
          other.agencyId == this.agencyId &&
          other.ministryId == this.ministryId &&
          other.stateId == this.stateId &&
          other.zoneId == this.zoneId &&
          other.createdBy == this.createdBy &&
          other.modifiedBy == this.modifiedBy &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastSyncedAt == this.lastSyncedAt &&
          other.isSynced == this.isSynced &&
          other.constituency == this.constituency &&
          other.amount == this.amount &&
          other.title == this.title &&
          other.sponsor == this.sponsor &&
          other.remoteId == this.remoteId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate);
}

class ProjectsCompanion extends UpdateCompanion<Project> {
  final Value<String> code;
  final Value<ProjectStatus> status;
  final Value<int> agencyId;
  final Value<int> ministryId;
  final Value<int> stateId;
  final Value<int> zoneId;
  final Value<String> createdBy;
  final Value<String?> modifiedBy;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> lastSyncedAt;
  final Value<bool> isSynced;
  final Value<String> constituency;
  final Value<double> amount;
  final Value<String> title;
  final Value<String?> sponsor;
  final Value<String?> remoteId;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<int> rowid;
  const ProjectsCompanion({
    this.code = const Value.absent(),
    this.status = const Value.absent(),
    this.agencyId = const Value.absent(),
    this.ministryId = const Value.absent(),
    this.stateId = const Value.absent(),
    this.zoneId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.modifiedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.constituency = const Value.absent(),
    this.amount = const Value.absent(),
    this.title = const Value.absent(),
    this.sponsor = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProjectsCompanion.insert({
    required String code,
    required ProjectStatus status,
    required int agencyId,
    required int ministryId,
    required int stateId,
    required int zoneId,
    required String createdBy,
    this.modifiedBy = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
    this.isSynced = const Value.absent(),
    required String constituency,
    required double amount,
    required String title,
    this.sponsor = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       status = Value(status),
       agencyId = Value(agencyId),
       ministryId = Value(ministryId),
       stateId = Value(stateId),
       zoneId = Value(zoneId),
       createdBy = Value(createdBy),
       constituency = Value(constituency),
       amount = Value(amount),
       title = Value(title);
  static Insertable<Project> custom({
    Expression<String>? code,
    Expression<String>? status,
    Expression<int>? agencyId,
    Expression<int>? ministryId,
    Expression<int>? stateId,
    Expression<int>? zoneId,
    Expression<String>? createdBy,
    Expression<String>? modifiedBy,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastSyncedAt,
    Expression<bool>? isSynced,
    Expression<String>? constituency,
    Expression<double>? amount,
    Expression<String>? title,
    Expression<String>? sponsor,
    Expression<String>? remoteId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (status != null) 'status': status,
      if (agencyId != null) 'agency_id': agencyId,
      if (ministryId != null) 'ministry_id': ministryId,
      if (stateId != null) 'state_id': stateId,
      if (zoneId != null) 'zone_id': zoneId,
      if (createdBy != null) 'created_by': createdBy,
      if (modifiedBy != null) 'modified_by': modifiedBy,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
      if (isSynced != null) 'is_synced': isSynced,
      if (constituency != null) 'constituency': constituency,
      if (amount != null) 'amount': amount,
      if (title != null) 'title': title,
      if (sponsor != null) 'sponsor': sponsor,
      if (remoteId != null) 'remote_id': remoteId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProjectsCompanion copyWith({
    Value<String>? code,
    Value<ProjectStatus>? status,
    Value<int>? agencyId,
    Value<int>? ministryId,
    Value<int>? stateId,
    Value<int>? zoneId,
    Value<String>? createdBy,
    Value<String?>? modifiedBy,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? lastSyncedAt,
    Value<bool>? isSynced,
    Value<String>? constituency,
    Value<double>? amount,
    Value<String>? title,
    Value<String?>? sponsor,
    Value<String?>? remoteId,
    Value<DateTime?>? startDate,
    Value<DateTime?>? endDate,
    Value<int>? rowid,
  }) {
    return ProjectsCompanion(
      code: code ?? this.code,
      status: status ?? this.status,
      agencyId: agencyId ?? this.agencyId,
      ministryId: ministryId ?? this.ministryId,
      stateId: stateId ?? this.stateId,
      zoneId: zoneId ?? this.zoneId,
      createdBy: createdBy ?? this.createdBy,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      isSynced: isSynced ?? this.isSynced,
      constituency: constituency ?? this.constituency,
      amount: amount ?? this.amount,
      title: title ?? this.title,
      sponsor: sponsor ?? this.sponsor,
      remoteId: remoteId ?? this.remoteId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
        $ProjectsTable.$converterstatus.toSql(status.value),
      );
    }
    if (agencyId.present) {
      map['agency_id'] = Variable<int>(agencyId.value);
    }
    if (ministryId.present) {
      map['ministry_id'] = Variable<int>(ministryId.value);
    }
    if (stateId.present) {
      map['state_id'] = Variable<int>(stateId.value);
    }
    if (zoneId.present) {
      map['zone_id'] = Variable<int>(zoneId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (modifiedBy.present) {
      map['modified_by'] = Variable<String>(modifiedBy.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (constituency.present) {
      map['constituency'] = Variable<String>(constituency.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (sponsor.present) {
      map['sponsor'] = Variable<String>(sponsor.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProjectsCompanion(')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('agencyId: $agencyId, ')
          ..write('ministryId: $ministryId, ')
          ..write('stateId: $stateId, ')
          ..write('zoneId: $zoneId, ')
          ..write('createdBy: $createdBy, ')
          ..write('modifiedBy: $modifiedBy, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastSyncedAt: $lastSyncedAt, ')
          ..write('isSynced: $isSynced, ')
          ..write('constituency: $constituency, ')
          ..write('amount: $amount, ')
          ..write('title: $title, ')
          ..write('sponsor: $sponsor, ')
          ..write('remoteId: $remoteId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsTable extends AuditLogs
    with TableInfo<$AuditLogsTable, AuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _tableNameRefMeta = const VerificationMeta(
    'tableNameRef',
  );
  @override
  late final GeneratedColumn<String> tableNameRef = GeneratedColumn<String>(
    'table_name_ref',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recordIdMeta = const VerificationMeta(
    'recordId',
  );
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
    'record_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<AuditAction, String> action =
      GeneratedColumn<String>(
        'action',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<AuditAction>($AuditLogsTable.$converteraction);
  static const VerificationMeta _oldValuesMeta = const VerificationMeta(
    'oldValues',
  );
  @override
  late final GeneratedColumn<String> oldValues = GeneratedColumn<String>(
    'old_values',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _newValuesMeta = const VerificationMeta(
    'newValues',
  );
  @override
  late final GeneratedColumn<String> newValues = GeneratedColumn<String>(
    'new_values',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _ipAddressMeta = const VerificationMeta(
    'ipAddress',
  );
  @override
  late final GeneratedColumn<String> ipAddress = GeneratedColumn<String>(
    'ip_address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    tableNameRef,
    recordId,
    action,
    oldValues,
    newValues,
    createdAt,
    ipAddress,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<AuditLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('table_name_ref')) {
      context.handle(
        _tableNameRefMeta,
        tableNameRef.isAcceptableOrUnknown(
          data['table_name_ref']!,
          _tableNameRefMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tableNameRefMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(
        _recordIdMeta,
        recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta),
      );
    }
    if (data.containsKey('old_values')) {
      context.handle(
        _oldValuesMeta,
        oldValues.isAcceptableOrUnknown(data['old_values']!, _oldValuesMeta),
      );
    }
    if (data.containsKey('new_values')) {
      context.handle(
        _newValuesMeta,
        newValues.isAcceptableOrUnknown(data['new_values']!, _newValuesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('ip_address')) {
      context.handle(
        _ipAddressMeta,
        ipAddress.isAcceptableOrUnknown(data['ip_address']!, _ipAddressMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      tableNameRef: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table_name_ref'],
      )!,
      recordId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}record_id'],
      ),
      action: $AuditLogsTable.$converteraction.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}action'],
        )!,
      ),
      oldValues: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}old_values'],
      ),
      newValues: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}new_values'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      ipAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ip_address'],
      ),
    );
  }

  @override
  $AuditLogsTable createAlias(String alias) {
    return $AuditLogsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AuditAction, String, String> $converteraction =
      const EnumNameConverter<AuditAction>(AuditAction.values);
}

class AuditLog extends DataClass implements Insertable<AuditLog> {
  final int id;
  final String userId;
  final String tableNameRef;
  final String? recordId;
  final AuditAction action;
  final String? oldValues;
  final String? newValues;
  final DateTime createdAt;
  final String? ipAddress;
  const AuditLog({
    required this.id,
    required this.userId,
    required this.tableNameRef,
    this.recordId,
    required this.action,
    this.oldValues,
    this.newValues,
    required this.createdAt,
    this.ipAddress,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['table_name_ref'] = Variable<String>(tableNameRef);
    if (!nullToAbsent || recordId != null) {
      map['record_id'] = Variable<String>(recordId);
    }
    {
      map['action'] = Variable<String>(
        $AuditLogsTable.$converteraction.toSql(action),
      );
    }
    if (!nullToAbsent || oldValues != null) {
      map['old_values'] = Variable<String>(oldValues);
    }
    if (!nullToAbsent || newValues != null) {
      map['new_values'] = Variable<String>(newValues);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || ipAddress != null) {
      map['ip_address'] = Variable<String>(ipAddress);
    }
    return map;
  }

  AuditLogsCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsCompanion(
      id: Value(id),
      userId: Value(userId),
      tableNameRef: Value(tableNameRef),
      recordId: recordId == null && nullToAbsent
          ? const Value.absent()
          : Value(recordId),
      action: Value(action),
      oldValues: oldValues == null && nullToAbsent
          ? const Value.absent()
          : Value(oldValues),
      newValues: newValues == null && nullToAbsent
          ? const Value.absent()
          : Value(newValues),
      createdAt: Value(createdAt),
      ipAddress: ipAddress == null && nullToAbsent
          ? const Value.absent()
          : Value(ipAddress),
    );
  }

  factory AuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLog(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      tableNameRef: serializer.fromJson<String>(json['tableNameRef']),
      recordId: serializer.fromJson<String?>(json['recordId']),
      action: $AuditLogsTable.$converteraction.fromJson(
        serializer.fromJson<String>(json['action']),
      ),
      oldValues: serializer.fromJson<String?>(json['oldValues']),
      newValues: serializer.fromJson<String?>(json['newValues']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      ipAddress: serializer.fromJson<String?>(json['ipAddress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'tableNameRef': serializer.toJson<String>(tableNameRef),
      'recordId': serializer.toJson<String?>(recordId),
      'action': serializer.toJson<String>(
        $AuditLogsTable.$converteraction.toJson(action),
      ),
      'oldValues': serializer.toJson<String?>(oldValues),
      'newValues': serializer.toJson<String?>(newValues),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'ipAddress': serializer.toJson<String?>(ipAddress),
    };
  }

  AuditLog copyWith({
    int? id,
    String? userId,
    String? tableNameRef,
    Value<String?> recordId = const Value.absent(),
    AuditAction? action,
    Value<String?> oldValues = const Value.absent(),
    Value<String?> newValues = const Value.absent(),
    DateTime? createdAt,
    Value<String?> ipAddress = const Value.absent(),
  }) => AuditLog(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    tableNameRef: tableNameRef ?? this.tableNameRef,
    recordId: recordId.present ? recordId.value : this.recordId,
    action: action ?? this.action,
    oldValues: oldValues.present ? oldValues.value : this.oldValues,
    newValues: newValues.present ? newValues.value : this.newValues,
    createdAt: createdAt ?? this.createdAt,
    ipAddress: ipAddress.present ? ipAddress.value : this.ipAddress,
  );
  AuditLog copyWithCompanion(AuditLogsCompanion data) {
    return AuditLog(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      tableNameRef: data.tableNameRef.present
          ? data.tableNameRef.value
          : this.tableNameRef,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      action: data.action.present ? data.action.value : this.action,
      oldValues: data.oldValues.present ? data.oldValues.value : this.oldValues,
      newValues: data.newValues.present ? data.newValues.value : this.newValues,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      ipAddress: data.ipAddress.present ? data.ipAddress.value : this.ipAddress,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLog(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('tableNameRef: $tableNameRef, ')
          ..write('recordId: $recordId, ')
          ..write('action: $action, ')
          ..write('oldValues: $oldValues, ')
          ..write('newValues: $newValues, ')
          ..write('createdAt: $createdAt, ')
          ..write('ipAddress: $ipAddress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    tableNameRef,
    recordId,
    action,
    oldValues,
    newValues,
    createdAt,
    ipAddress,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLog &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.tableNameRef == this.tableNameRef &&
          other.recordId == this.recordId &&
          other.action == this.action &&
          other.oldValues == this.oldValues &&
          other.newValues == this.newValues &&
          other.createdAt == this.createdAt &&
          other.ipAddress == this.ipAddress);
}

class AuditLogsCompanion extends UpdateCompanion<AuditLog> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> tableNameRef;
  final Value<String?> recordId;
  final Value<AuditAction> action;
  final Value<String?> oldValues;
  final Value<String?> newValues;
  final Value<DateTime> createdAt;
  final Value<String?> ipAddress;
  const AuditLogsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.tableNameRef = const Value.absent(),
    this.recordId = const Value.absent(),
    this.action = const Value.absent(),
    this.oldValues = const Value.absent(),
    this.newValues = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.ipAddress = const Value.absent(),
  });
  AuditLogsCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String tableNameRef,
    this.recordId = const Value.absent(),
    required AuditAction action,
    this.oldValues = const Value.absent(),
    this.newValues = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.ipAddress = const Value.absent(),
  }) : userId = Value(userId),
       tableNameRef = Value(tableNameRef),
       action = Value(action);
  static Insertable<AuditLog> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? tableNameRef,
    Expression<String>? recordId,
    Expression<String>? action,
    Expression<String>? oldValues,
    Expression<String>? newValues,
    Expression<DateTime>? createdAt,
    Expression<String>? ipAddress,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (tableNameRef != null) 'table_name_ref': tableNameRef,
      if (recordId != null) 'record_id': recordId,
      if (action != null) 'action': action,
      if (oldValues != null) 'old_values': oldValues,
      if (newValues != null) 'new_values': newValues,
      if (createdAt != null) 'created_at': createdAt,
      if (ipAddress != null) 'ip_address': ipAddress,
    });
  }

  AuditLogsCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? tableNameRef,
    Value<String?>? recordId,
    Value<AuditAction>? action,
    Value<String?>? oldValues,
    Value<String?>? newValues,
    Value<DateTime>? createdAt,
    Value<String?>? ipAddress,
  }) {
    return AuditLogsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      tableNameRef: tableNameRef ?? this.tableNameRef,
      recordId: recordId ?? this.recordId,
      action: action ?? this.action,
      oldValues: oldValues ?? this.oldValues,
      newValues: newValues ?? this.newValues,
      createdAt: createdAt ?? this.createdAt,
      ipAddress: ipAddress ?? this.ipAddress,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (tableNameRef.present) {
      map['table_name_ref'] = Variable<String>(tableNameRef.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(
        $AuditLogsTable.$converteraction.toSql(action.value),
      );
    }
    if (oldValues.present) {
      map['old_values'] = Variable<String>(oldValues.value);
    }
    if (newValues.present) {
      map['new_values'] = Variable<String>(newValues.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (ipAddress.present) {
      map['ip_address'] = Variable<String>(ipAddress.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('tableNameRef: $tableNameRef, ')
          ..write('recordId: $recordId, ')
          ..write('action: $action, ')
          ..write('oldValues: $oldValues, ')
          ..write('newValues: $newValues, ')
          ..write('createdAt: $createdAt, ')
          ..write('ipAddress: $ipAddress')
          ..write(')'))
        .toString();
  }
}

class $ExportHistoryTable extends ExportHistory
    with TableInfo<$ExportHistoryTable, ExportHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExportHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _projectCodeMeta = const VerificationMeta(
    'projectCode',
  );
  @override
  late final GeneratedColumn<String> projectCode = GeneratedColumn<String>(
    'project_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES projects (code) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ExportFormat, String> format =
      GeneratedColumn<String>(
        'format',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ExportFormat>($ExportHistoryTable.$converterformat);
  static const VerificationMeta _recordCountMeta = const VerificationMeta(
    'recordCount',
  );
  @override
  late final GeneratedColumn<int> recordCount = GeneratedColumn<int>(
    'record_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filtersMeta = const VerificationMeta(
    'filters',
  );
  @override
  late final GeneratedColumn<String> filters = GeneratedColumn<String>(
    'filters',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    projectCode,
    format,
    recordCount,
    fileName,
    filters,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'export_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExportHistoryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('project_code')) {
      context.handle(
        _projectCodeMeta,
        projectCode.isAcceptableOrUnknown(
          data['project_code']!,
          _projectCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_projectCodeMeta);
    }
    if (data.containsKey('record_count')) {
      context.handle(
        _recordCountMeta,
        recordCount.isAcceptableOrUnknown(
          data['record_count']!,
          _recordCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recordCountMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('filters')) {
      context.handle(
        _filtersMeta,
        filters.isAcceptableOrUnknown(data['filters']!, _filtersMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExportHistoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExportHistoryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      )!,
      projectCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}project_code'],
      )!,
      format: $ExportHistoryTable.$converterformat.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}format'],
        )!,
      ),
      recordCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}record_count'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      filters: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filters'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ExportHistoryTable createAlias(String alias) {
    return $ExportHistoryTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ExportFormat, String, String> $converterformat =
      const EnumNameConverter<ExportFormat>(ExportFormat.values);
}

class ExportHistoryData extends DataClass
    implements Insertable<ExportHistoryData> {
  final int id;
  final String userId;
  final String projectCode;
  final ExportFormat format;
  final int recordCount;
  final String fileName;
  final String? filters;
  final DateTime createdAt;
  const ExportHistoryData({
    required this.id,
    required this.userId,
    required this.projectCode,
    required this.format,
    required this.recordCount,
    required this.fileName,
    this.filters,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['project_code'] = Variable<String>(projectCode);
    {
      map['format'] = Variable<String>(
        $ExportHistoryTable.$converterformat.toSql(format),
      );
    }
    map['record_count'] = Variable<int>(recordCount);
    map['file_name'] = Variable<String>(fileName);
    if (!nullToAbsent || filters != null) {
      map['filters'] = Variable<String>(filters);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ExportHistoryCompanion toCompanion(bool nullToAbsent) {
    return ExportHistoryCompanion(
      id: Value(id),
      userId: Value(userId),
      projectCode: Value(projectCode),
      format: Value(format),
      recordCount: Value(recordCount),
      fileName: Value(fileName),
      filters: filters == null && nullToAbsent
          ? const Value.absent()
          : Value(filters),
      createdAt: Value(createdAt),
    );
  }

  factory ExportHistoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExportHistoryData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      projectCode: serializer.fromJson<String>(json['projectCode']),
      format: $ExportHistoryTable.$converterformat.fromJson(
        serializer.fromJson<String>(json['format']),
      ),
      recordCount: serializer.fromJson<int>(json['recordCount']),
      fileName: serializer.fromJson<String>(json['fileName']),
      filters: serializer.fromJson<String?>(json['filters']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'projectCode': serializer.toJson<String>(projectCode),
      'format': serializer.toJson<String>(
        $ExportHistoryTable.$converterformat.toJson(format),
      ),
      'recordCount': serializer.toJson<int>(recordCount),
      'fileName': serializer.toJson<String>(fileName),
      'filters': serializer.toJson<String?>(filters),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ExportHistoryData copyWith({
    int? id,
    String? userId,
    String? projectCode,
    ExportFormat? format,
    int? recordCount,
    String? fileName,
    Value<String?> filters = const Value.absent(),
    DateTime? createdAt,
  }) => ExportHistoryData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    projectCode: projectCode ?? this.projectCode,
    format: format ?? this.format,
    recordCount: recordCount ?? this.recordCount,
    fileName: fileName ?? this.fileName,
    filters: filters.present ? filters.value : this.filters,
    createdAt: createdAt ?? this.createdAt,
  );
  ExportHistoryData copyWithCompanion(ExportHistoryCompanion data) {
    return ExportHistoryData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      projectCode: data.projectCode.present
          ? data.projectCode.value
          : this.projectCode,
      format: data.format.present ? data.format.value : this.format,
      recordCount: data.recordCount.present
          ? data.recordCount.value
          : this.recordCount,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      filters: data.filters.present ? data.filters.value : this.filters,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExportHistoryData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('projectCode: $projectCode, ')
          ..write('format: $format, ')
          ..write('recordCount: $recordCount, ')
          ..write('fileName: $fileName, ')
          ..write('filters: $filters, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    userId,
    projectCode,
    format,
    recordCount,
    fileName,
    filters,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExportHistoryData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.projectCode == this.projectCode &&
          other.format == this.format &&
          other.recordCount == this.recordCount &&
          other.fileName == this.fileName &&
          other.filters == this.filters &&
          other.createdAt == this.createdAt);
}

class ExportHistoryCompanion extends UpdateCompanion<ExportHistoryData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> projectCode;
  final Value<ExportFormat> format;
  final Value<int> recordCount;
  final Value<String> fileName;
  final Value<String?> filters;
  final Value<DateTime> createdAt;
  const ExportHistoryCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.projectCode = const Value.absent(),
    this.format = const Value.absent(),
    this.recordCount = const Value.absent(),
    this.fileName = const Value.absent(),
    this.filters = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ExportHistoryCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String projectCode,
    required ExportFormat format,
    required int recordCount,
    required String fileName,
    this.filters = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : userId = Value(userId),
       projectCode = Value(projectCode),
       format = Value(format),
       recordCount = Value(recordCount),
       fileName = Value(fileName);
  static Insertable<ExportHistoryData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? projectCode,
    Expression<String>? format,
    Expression<int>? recordCount,
    Expression<String>? fileName,
    Expression<String>? filters,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (projectCode != null) 'project_code': projectCode,
      if (format != null) 'format': format,
      if (recordCount != null) 'record_count': recordCount,
      if (fileName != null) 'file_name': fileName,
      if (filters != null) 'filters': filters,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ExportHistoryCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? projectCode,
    Value<ExportFormat>? format,
    Value<int>? recordCount,
    Value<String>? fileName,
    Value<String?>? filters,
    Value<DateTime>? createdAt,
  }) {
    return ExportHistoryCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      projectCode: projectCode ?? this.projectCode,
      format: format ?? this.format,
      recordCount: recordCount ?? this.recordCount,
      fileName: fileName ?? this.fileName,
      filters: filters ?? this.filters,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (projectCode.present) {
      map['project_code'] = Variable<String>(projectCode.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(
        $ExportHistoryTable.$converterformat.toSql(format.value),
      );
    }
    if (recordCount.present) {
      map['record_count'] = Variable<int>(recordCount.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (filters.present) {
      map['filters'] = Variable<String>(filters.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExportHistoryCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('projectCode: $projectCode, ')
          ..write('format: $format, ')
          ..write('recordCount: $recordCount, ')
          ..write('fileName: $fileName, ')
          ..write('filters: $filters, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions with TableInfo<$SessionsTable, Session> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _activeUserIdMeta = const VerificationMeta(
    'activeUserId',
  );
  @override
  late final GeneratedColumn<String> activeUserId = GeneratedColumn<String>(
    'active_user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (uid)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, activeUserId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Session> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('active_user_id')) {
      context.handle(
        _activeUserIdMeta,
        activeUserId.isAcceptableOrUnknown(
          data['active_user_id']!,
          _activeUserIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Session map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Session(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      activeUserId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}active_user_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class Session extends DataClass implements Insertable<Session> {
  final int id;
  final String? activeUserId;
  final DateTime createdAt;
  const Session({required this.id, this.activeUserId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || activeUserId != null) {
      map['active_user_id'] = Variable<String>(activeUserId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      activeUserId: activeUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(activeUserId),
      createdAt: Value(createdAt),
    );
  }

  factory Session.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Session(
      id: serializer.fromJson<int>(json['id']),
      activeUserId: serializer.fromJson<String?>(json['activeUserId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activeUserId': serializer.toJson<String?>(activeUserId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Session copyWith({
    int? id,
    Value<String?> activeUserId = const Value.absent(),
    DateTime? createdAt,
  }) => Session(
    id: id ?? this.id,
    activeUserId: activeUserId.present ? activeUserId.value : this.activeUserId,
    createdAt: createdAt ?? this.createdAt,
  );
  Session copyWithCompanion(SessionsCompanion data) {
    return Session(
      id: data.id.present ? data.id.value : this.id,
      activeUserId: data.activeUserId.present
          ? data.activeUserId.value
          : this.activeUserId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Session(')
          ..write('id: $id, ')
          ..write('activeUserId: $activeUserId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, activeUserId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Session &&
          other.id == this.id &&
          other.activeUserId == this.activeUserId &&
          other.createdAt == this.createdAt);
}

class SessionsCompanion extends UpdateCompanion<Session> {
  final Value<int> id;
  final Value<String?> activeUserId;
  final Value<DateTime> createdAt;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.activeUserId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SessionsCompanion.insert({
    this.id = const Value.absent(),
    this.activeUserId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Session> custom({
    Expression<int>? id,
    Expression<String>? activeUserId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (activeUserId != null) 'active_user_id': activeUserId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SessionsCompanion copyWith({
    Value<int>? id,
    Value<String?>? activeUserId,
    Value<DateTime>? createdAt,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      activeUserId: activeUserId ?? this.activeUserId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (activeUserId.present) {
      map['active_user_id'] = Variable<String>(activeUserId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('activeUserId: $activeUserId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $AgenciesTable agencies = $AgenciesTable(this);
  late final $MinistriesTable ministries = $MinistriesTable(this);
  late final $GeopoliticalZonesTable geopoliticalZones =
      $GeopoliticalZonesTable(this);
  late final $StatesTable states = $StatesTable(this);
  late final $ProjectsTable projects = $ProjectsTable(this);
  late final $AuditLogsTable auditLogs = $AuditLogsTable(this);
  late final $ExportHistoryTable exportHistory = $ExportHistoryTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    agencies,
    ministries,
    geopoliticalZones,
    states,
    projects,
    auditLogs,
    exportHistory,
    sessions,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'projects',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('export_history', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      required String uid,
      required String username,
      Value<String?> fullName,
      required String email,
      required UserRole role,
      Value<bool> isActive,
      Value<bool> isSynced,
      Value<String?> remoteId,
      Value<DateTime?> lastSyncedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> lastLoginAt,
      Value<int> rowid,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<String> uid,
      Value<String> username,
      Value<String?> fullName,
      Value<String> email,
      Value<UserRole> role,
      Value<bool> isActive,
      Value<bool> isSynced,
      Value<String?> remoteId,
      Value<DateTime?> lastSyncedAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> lastLoginAt,
      Value<int> rowid,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProjectsTable, List<Project>>
  _createdProjectsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projects,
    aliasName: $_aliasNameGenerator(db.users.uid, db.projects.createdBy),
  );

  $$ProjectsTableProcessedTableManager get createdProjects {
    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.createdBy.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_createdProjectsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectsTable, List<Project>>
  _modifiedProjectsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.projects,
    aliasName: $_aliasNameGenerator(db.users.uid, db.projects.modifiedBy),
  );

  $$ProjectsTableProcessedTableManager get modifiedProjects {
    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.modifiedBy.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_modifiedProjectsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AuditLogsTable, List<AuditLog>>
  _auditLogsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.auditLogs,
    aliasName: $_aliasNameGenerator(db.users.uid, db.auditLogs.userId),
  );

  $$AuditLogsTableProcessedTableManager get auditLogsRefs {
    final manager = $$AuditLogsTableTableManager(
      $_db,
      $_db.auditLogs,
    ).filter((f) => f.userId.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_auditLogsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ExportHistoryTable, List<ExportHistoryData>>
  _exportHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exportHistory,
    aliasName: $_aliasNameGenerator(db.users.uid, db.exportHistory.userId),
  );

  $$ExportHistoryTableProcessedTableManager get exportHistoryRefs {
    final manager = $$ExportHistoryTableTableManager(
      $_db,
      $_db.exportHistory,
    ).filter((f) => f.userId.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_exportHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SessionsTable, List<Session>> _sessionsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.sessions,
    aliasName: $_aliasNameGenerator(db.users.uid, db.sessions.activeUserId),
  );

  $$SessionsTableProcessedTableManager get sessionsRefs {
    final manager = $$SessionsTableTableManager(
      $_db,
      $_db.sessions,
    ).filter((f) => f.activeUserId.uid.sqlEquals($_itemColumn<String>('uid')!));

    final cache = $_typedResult.readTableOrNull(_sessionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<UserRole, UserRole, String> get role =>
      $composableBuilder(
        column: $table.role,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> createdProjects(
    Expression<bool> Function($$ProjectsTableFilterComposer f) f,
  ) {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.createdBy,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> modifiedProjects(
    Expression<bool> Function($$ProjectsTableFilterComposer f) f,
  ) {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.modifiedBy,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> auditLogsRefs(
    Expression<bool> Function($$AuditLogsTableFilterComposer f) f,
  ) {
    final $$AuditLogsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.auditLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditLogsTableFilterComposer(
            $db: $db,
            $table: $db.auditLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> exportHistoryRefs(
    Expression<bool> Function($$ExportHistoryTableFilterComposer f) f,
  ) {
    final $$ExportHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.exportHistory,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExportHistoryTableFilterComposer(
            $db: $db,
            $table: $db.exportHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sessionsRefs(
    Expression<bool> Function($$SessionsTableFilterComposer f) f,
  ) {
    final $$SessionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.activeUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableFilterComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
    column: $table.uid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fullName => $composableBuilder(
    column: $table.fullName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumnWithTypeConverter<UserRole, String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastLoginAt => $composableBuilder(
    column: $table.lastLoginAt,
    builder: (column) => column,
  );

  Expression<T> createdProjects<T extends Object>(
    Expression<T> Function($$ProjectsTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.createdBy,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> modifiedProjects<T extends Object>(
    Expression<T> Function($$ProjectsTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.modifiedBy,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> auditLogsRefs<T extends Object>(
    Expression<T> Function($$AuditLogsTableAnnotationComposer a) f,
  ) {
    final $$AuditLogsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.auditLogs,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AuditLogsTableAnnotationComposer(
            $db: $db,
            $table: $db.auditLogs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> exportHistoryRefs<T extends Object>(
    Expression<T> Function($$ExportHistoryTableAnnotationComposer a) f,
  ) {
    final $$ExportHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.exportHistory,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExportHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.exportHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sessionsRefs<T extends Object>(
    Expression<T> Function($$SessionsTableAnnotationComposer a) f,
  ) {
    final $$SessionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.uid,
      referencedTable: $db.sessions,
      getReferencedColumn: (t) => t.activeUserId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SessionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sessions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({
            bool createdProjects,
            bool modifiedProjects,
            bool auditLogsRefs,
            bool exportHistoryRefs,
            bool sessionsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uid = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String?> fullName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<UserRole> role = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> lastLoginAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion(
                uid: uid,
                username: username,
                fullName: fullName,
                email: email,
                role: role,
                isActive: isActive,
                isSynced: isSynced,
                remoteId: remoteId,
                lastSyncedAt: lastSyncedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastLoginAt: lastLoginAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uid,
                required String username,
                Value<String?> fullName = const Value.absent(),
                required String email,
                required UserRole role,
                Value<bool> isActive = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> lastLoginAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsersCompanion.insert(
                uid: uid,
                username: username,
                fullName: fullName,
                email: email,
                role: role,
                isActive: isActive,
                isSynced: isSynced,
                remoteId: remoteId,
                lastSyncedAt: lastSyncedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastLoginAt: lastLoginAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                createdProjects = false,
                modifiedProjects = false,
                auditLogsRefs = false,
                exportHistoryRefs = false,
                sessionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (createdProjects) db.projects,
                    if (modifiedProjects) db.projects,
                    if (auditLogsRefs) db.auditLogs,
                    if (exportHistoryRefs) db.exportHistory,
                    if (sessionsRefs) db.sessions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (createdProjects)
                        await $_getPrefetchedData<User, $UsersTable, Project>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._createdProjectsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).createdProjects,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.createdBy == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (modifiedProjects)
                        await $_getPrefetchedData<User, $UsersTable, Project>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._modifiedProjectsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).modifiedProjects,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.modifiedBy == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (auditLogsRefs)
                        await $_getPrefetchedData<User, $UsersTable, AuditLog>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._auditLogsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).auditLogsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (exportHistoryRefs)
                        await $_getPrefetchedData<
                          User,
                          $UsersTable,
                          ExportHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._exportHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).exportHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.uid,
                              ),
                          typedResults: items,
                        ),
                      if (sessionsRefs)
                        await $_getPrefetchedData<User, $UsersTable, Session>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._sessionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).sessionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.activeUserId == item.uid,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({
        bool createdProjects,
        bool modifiedProjects,
        bool auditLogsRefs,
        bool exportHistoryRefs,
        bool sessionsRefs,
      })
    >;
typedef $$AgenciesTableCreateCompanionBuilder =
    AgenciesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> code,
      Value<String?> remoteId,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$AgenciesTableUpdateCompanionBuilder =
    AgenciesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> code,
      Value<String?> remoteId,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$AgenciesTableReferences
    extends BaseReferences<_$AppDatabase, $AgenciesTable, Agency> {
  $$AgenciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$MinistriesTable, List<Ministry>>
  _ministriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ministries,
    aliasName: $_aliasNameGenerator(db.agencies.id, db.ministries.agencyId),
  );

  $$MinistriesTableProcessedTableManager get ministriesRefs {
    final manager = $$MinistriesTableTableManager(
      $_db,
      $_db.ministries,
    ).filter((f) => f.agencyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_ministriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectsTable, List<Project>> _projectsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.projects,
    aliasName: $_aliasNameGenerator(db.agencies.id, db.projects.agencyId),
  );

  $$ProjectsTableProcessedTableManager get projectsRefs {
    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.agencyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AgenciesTableFilterComposer
    extends Composer<_$AppDatabase, $AgenciesTable> {
  $$AgenciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ministriesRefs(
    Expression<bool> Function($$MinistriesTableFilterComposer f) f,
  ) {
    final $$MinistriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ministries,
      getReferencedColumn: (t) => t.agencyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MinistriesTableFilterComposer(
            $db: $db,
            $table: $db.ministries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectsRefs(
    Expression<bool> Function($$ProjectsTableFilterComposer f) f,
  ) {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.agencyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AgenciesTableOrderingComposer
    extends Composer<_$AppDatabase, $AgenciesTable> {
  $$AgenciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AgenciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AgenciesTable> {
  $$AgenciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> ministriesRefs<T extends Object>(
    Expression<T> Function($$MinistriesTableAnnotationComposer a) f,
  ) {
    final $$MinistriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ministries,
      getReferencedColumn: (t) => t.agencyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MinistriesTableAnnotationComposer(
            $db: $db,
            $table: $db.ministries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectsRefs<T extends Object>(
    Expression<T> Function($$ProjectsTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.agencyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AgenciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AgenciesTable,
          Agency,
          $$AgenciesTableFilterComposer,
          $$AgenciesTableOrderingComposer,
          $$AgenciesTableAnnotationComposer,
          $$AgenciesTableCreateCompanionBuilder,
          $$AgenciesTableUpdateCompanionBuilder,
          (Agency, $$AgenciesTableReferences),
          Agency,
          PrefetchHooks Function({bool ministriesRefs, bool projectsRefs})
        > {
  $$AgenciesTableTableManager(_$AppDatabase db, $AgenciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgenciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgenciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgenciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AgenciesCompanion(
                id: id,
                name: name,
                code: code,
                remoteId: remoteId,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> code = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => AgenciesCompanion.insert(
                id: id,
                name: name,
                code: code,
                remoteId: remoteId,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AgenciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ministriesRefs = false, projectsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (ministriesRefs) db.ministries,
                    if (projectsRefs) db.projects,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ministriesRefs)
                        await $_getPrefetchedData<
                          Agency,
                          $AgenciesTable,
                          Ministry
                        >(
                          currentTable: table,
                          referencedTable: $$AgenciesTableReferences
                              ._ministriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AgenciesTableReferences(
                                db,
                                table,
                                p0,
                              ).ministriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.agencyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (projectsRefs)
                        await $_getPrefetchedData<
                          Agency,
                          $AgenciesTable,
                          Project
                        >(
                          currentTable: table,
                          referencedTable: $$AgenciesTableReferences
                              ._projectsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$AgenciesTableReferences(
                                db,
                                table,
                                p0,
                              ).projectsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.agencyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$AgenciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AgenciesTable,
      Agency,
      $$AgenciesTableFilterComposer,
      $$AgenciesTableOrderingComposer,
      $$AgenciesTableAnnotationComposer,
      $$AgenciesTableCreateCompanionBuilder,
      $$AgenciesTableUpdateCompanionBuilder,
      (Agency, $$AgenciesTableReferences),
      Agency,
      PrefetchHooks Function({bool ministriesRefs, bool projectsRefs})
    >;
typedef $$MinistriesTableCreateCompanionBuilder =
    MinistriesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> code,
      Value<String?> remoteId,
      required int agencyId,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$MinistriesTableUpdateCompanionBuilder =
    MinistriesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> code,
      Value<String?> remoteId,
      Value<int> agencyId,
      Value<bool> isActive,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$MinistriesTableReferences
    extends BaseReferences<_$AppDatabase, $MinistriesTable, Ministry> {
  $$MinistriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AgenciesTable _agencyIdTable(_$AppDatabase db) =>
      db.agencies.createAlias(
        $_aliasNameGenerator(db.ministries.agencyId, db.agencies.id),
      );

  $$AgenciesTableProcessedTableManager get agencyId {
    final $_column = $_itemColumn<int>('agency_id')!;

    final manager = $$AgenciesTableTableManager(
      $_db,
      $_db.agencies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_agencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ProjectsTable, List<Project>> _projectsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.projects,
    aliasName: $_aliasNameGenerator(db.ministries.id, db.projects.ministryId),
  );

  $$ProjectsTableProcessedTableManager get projectsRefs {
    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.ministryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MinistriesTableFilterComposer
    extends Composer<_$AppDatabase, $MinistriesTable> {
  $$MinistriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AgenciesTableFilterComposer get agencyId {
    final $$AgenciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agencyId,
      referencedTable: $db.agencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenciesTableFilterComposer(
            $db: $db,
            $table: $db.agencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> projectsRefs(
    Expression<bool> Function($$ProjectsTableFilterComposer f) f,
  ) {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.ministryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MinistriesTableOrderingComposer
    extends Composer<_$AppDatabase, $MinistriesTable> {
  $$MinistriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AgenciesTableOrderingComposer get agencyId {
    final $$AgenciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agencyId,
      referencedTable: $db.agencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenciesTableOrderingComposer(
            $db: $db,
            $table: $db.agencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MinistriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MinistriesTable> {
  $$MinistriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AgenciesTableAnnotationComposer get agencyId {
    final $$AgenciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agencyId,
      referencedTable: $db.agencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenciesTableAnnotationComposer(
            $db: $db,
            $table: $db.agencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> projectsRefs<T extends Object>(
    Expression<T> Function($$ProjectsTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.ministryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MinistriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MinistriesTable,
          Ministry,
          $$MinistriesTableFilterComposer,
          $$MinistriesTableOrderingComposer,
          $$MinistriesTableAnnotationComposer,
          $$MinistriesTableCreateCompanionBuilder,
          $$MinistriesTableUpdateCompanionBuilder,
          (Ministry, $$MinistriesTableReferences),
          Ministry,
          PrefetchHooks Function({bool agencyId, bool projectsRefs})
        > {
  $$MinistriesTableTableManager(_$AppDatabase db, $MinistriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MinistriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MinistriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MinistriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<int> agencyId = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MinistriesCompanion(
                id: id,
                name: name,
                code: code,
                remoteId: remoteId,
                agencyId: agencyId,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> code = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                required int agencyId,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => MinistriesCompanion.insert(
                id: id,
                name: name,
                code: code,
                remoteId: remoteId,
                agencyId: agencyId,
                isActive: isActive,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MinistriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({agencyId = false, projectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (projectsRefs) db.projects],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (agencyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.agencyId,
                                referencedTable: $$MinistriesTableReferences
                                    ._agencyIdTable(db),
                                referencedColumn: $$MinistriesTableReferences
                                    ._agencyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (projectsRefs)
                    await $_getPrefetchedData<
                      Ministry,
                      $MinistriesTable,
                      Project
                    >(
                      currentTable: table,
                      referencedTable: $$MinistriesTableReferences
                          ._projectsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MinistriesTableReferences(
                            db,
                            table,
                            p0,
                          ).projectsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.ministryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MinistriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MinistriesTable,
      Ministry,
      $$MinistriesTableFilterComposer,
      $$MinistriesTableOrderingComposer,
      $$MinistriesTableAnnotationComposer,
      $$MinistriesTableCreateCompanionBuilder,
      $$MinistriesTableUpdateCompanionBuilder,
      (Ministry, $$MinistriesTableReferences),
      Ministry,
      PrefetchHooks Function({bool agencyId, bool projectsRefs})
    >;
typedef $$GeopoliticalZonesTableCreateCompanionBuilder =
    GeopoliticalZonesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> code,
      Value<String?> remoteId,
      Value<DateTime> createdAt,
    });
typedef $$GeopoliticalZonesTableUpdateCompanionBuilder =
    GeopoliticalZonesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> code,
      Value<String?> remoteId,
      Value<DateTime> createdAt,
    });

final class $$GeopoliticalZonesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $GeopoliticalZonesTable,
          GeopoliticalZone
        > {
  $$GeopoliticalZonesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$StatesTable, List<State>> _statesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.states,
    aliasName: $_aliasNameGenerator(db.geopoliticalZones.id, db.states.zoneId),
  );

  $$StatesTableProcessedTableManager get statesRefs {
    final manager = $$StatesTableTableManager(
      $_db,
      $_db.states,
    ).filter((f) => f.zoneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_statesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProjectsTable, List<Project>> _projectsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.projects,
    aliasName: $_aliasNameGenerator(
      db.geopoliticalZones.id,
      db.projects.zoneId,
    ),
  );

  $$ProjectsTableProcessedTableManager get projectsRefs {
    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.zoneId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GeopoliticalZonesTableFilterComposer
    extends Composer<_$AppDatabase, $GeopoliticalZonesTable> {
  $$GeopoliticalZonesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> statesRefs(
    Expression<bool> Function($$StatesTableFilterComposer f) f,
  ) {
    final $$StatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.states,
      getReferencedColumn: (t) => t.zoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableFilterComposer(
            $db: $db,
            $table: $db.states,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> projectsRefs(
    Expression<bool> Function($$ProjectsTableFilterComposer f) f,
  ) {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.zoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GeopoliticalZonesTableOrderingComposer
    extends Composer<_$AppDatabase, $GeopoliticalZonesTable> {
  $$GeopoliticalZonesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GeopoliticalZonesTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeopoliticalZonesTable> {
  $$GeopoliticalZonesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> statesRefs<T extends Object>(
    Expression<T> Function($$StatesTableAnnotationComposer a) f,
  ) {
    final $$StatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.states,
      getReferencedColumn: (t) => t.zoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableAnnotationComposer(
            $db: $db,
            $table: $db.states,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> projectsRefs<T extends Object>(
    Expression<T> Function($$ProjectsTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.zoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GeopoliticalZonesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GeopoliticalZonesTable,
          GeopoliticalZone,
          $$GeopoliticalZonesTableFilterComposer,
          $$GeopoliticalZonesTableOrderingComposer,
          $$GeopoliticalZonesTableAnnotationComposer,
          $$GeopoliticalZonesTableCreateCompanionBuilder,
          $$GeopoliticalZonesTableUpdateCompanionBuilder,
          (GeopoliticalZone, $$GeopoliticalZonesTableReferences),
          GeopoliticalZone,
          PrefetchHooks Function({bool statesRefs, bool projectsRefs})
        > {
  $$GeopoliticalZonesTableTableManager(
    _$AppDatabase db,
    $GeopoliticalZonesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeopoliticalZonesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeopoliticalZonesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeopoliticalZonesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GeopoliticalZonesCompanion(
                id: id,
                name: name,
                code: code,
                remoteId: remoteId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> code = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => GeopoliticalZonesCompanion.insert(
                id: id,
                name: name,
                code: code,
                remoteId: remoteId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GeopoliticalZonesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({statesRefs = false, projectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (statesRefs) db.states,
                if (projectsRefs) db.projects,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (statesRefs)
                    await $_getPrefetchedData<
                      GeopoliticalZone,
                      $GeopoliticalZonesTable,
                      State
                    >(
                      currentTable: table,
                      referencedTable: $$GeopoliticalZonesTableReferences
                          ._statesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GeopoliticalZonesTableReferences(
                            db,
                            table,
                            p0,
                          ).statesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.zoneId == item.id),
                      typedResults: items,
                    ),
                  if (projectsRefs)
                    await $_getPrefetchedData<
                      GeopoliticalZone,
                      $GeopoliticalZonesTable,
                      Project
                    >(
                      currentTable: table,
                      referencedTable: $$GeopoliticalZonesTableReferences
                          ._projectsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GeopoliticalZonesTableReferences(
                            db,
                            table,
                            p0,
                          ).projectsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.zoneId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GeopoliticalZonesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GeopoliticalZonesTable,
      GeopoliticalZone,
      $$GeopoliticalZonesTableFilterComposer,
      $$GeopoliticalZonesTableOrderingComposer,
      $$GeopoliticalZonesTableAnnotationComposer,
      $$GeopoliticalZonesTableCreateCompanionBuilder,
      $$GeopoliticalZonesTableUpdateCompanionBuilder,
      (GeopoliticalZone, $$GeopoliticalZonesTableReferences),
      GeopoliticalZone,
      PrefetchHooks Function({bool statesRefs, bool projectsRefs})
    >;
typedef $$StatesTableCreateCompanionBuilder =
    StatesCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> code,
      required int zoneId,
      Value<String?> remoteId,
      Value<DateTime> createdAt,
    });
typedef $$StatesTableUpdateCompanionBuilder =
    StatesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> code,
      Value<int> zoneId,
      Value<String?> remoteId,
      Value<DateTime> createdAt,
    });

final class $$StatesTableReferences
    extends BaseReferences<_$AppDatabase, $StatesTable, State> {
  $$StatesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GeopoliticalZonesTable _zoneIdTable(_$AppDatabase db) =>
      db.geopoliticalZones.createAlias(
        $_aliasNameGenerator(db.states.zoneId, db.geopoliticalZones.id),
      );

  $$GeopoliticalZonesTableProcessedTableManager get zoneId {
    final $_column = $_itemColumn<int>('zone_id')!;

    final manager = $$GeopoliticalZonesTableTableManager(
      $_db,
      $_db.geopoliticalZones,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_zoneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ProjectsTable, List<Project>> _projectsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.projects,
    aliasName: $_aliasNameGenerator(db.states.id, db.projects.stateId),
  );

  $$ProjectsTableProcessedTableManager get projectsRefs {
    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.stateId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_projectsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StatesTableFilterComposer
    extends Composer<_$AppDatabase, $StatesTable> {
  $$StatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$GeopoliticalZonesTableFilterComposer get zoneId {
    final $$GeopoliticalZonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zoneId,
      referencedTable: $db.geopoliticalZones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeopoliticalZonesTableFilterComposer(
            $db: $db,
            $table: $db.geopoliticalZones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> projectsRefs(
    Expression<bool> Function($$ProjectsTableFilterComposer f) f,
  ) {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.stateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatesTableOrderingComposer
    extends Composer<_$AppDatabase, $StatesTable> {
  $$StatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$GeopoliticalZonesTableOrderingComposer get zoneId {
    final $$GeopoliticalZonesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zoneId,
      referencedTable: $db.geopoliticalZones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeopoliticalZonesTableOrderingComposer(
            $db: $db,
            $table: $db.geopoliticalZones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StatesTable> {
  $$StatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$GeopoliticalZonesTableAnnotationComposer get zoneId {
    final $$GeopoliticalZonesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.zoneId,
          referencedTable: $db.geopoliticalZones,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GeopoliticalZonesTableAnnotationComposer(
                $db: $db,
                $table: $db.geopoliticalZones,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  Expression<T> projectsRefs<T extends Object>(
    Expression<T> Function($$ProjectsTableAnnotationComposer a) f,
  ) {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.stateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StatesTable,
          State,
          $$StatesTableFilterComposer,
          $$StatesTableOrderingComposer,
          $$StatesTableAnnotationComposer,
          $$StatesTableCreateCompanionBuilder,
          $$StatesTableUpdateCompanionBuilder,
          (State, $$StatesTableReferences),
          State,
          PrefetchHooks Function({bool zoneId, bool projectsRefs})
        > {
  $$StatesTableTableManager(_$AppDatabase db, $StatesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<int> zoneId = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => StatesCompanion(
                id: id,
                name: name,
                code: code,
                zoneId: zoneId,
                remoteId: remoteId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> code = const Value.absent(),
                required int zoneId,
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => StatesCompanion.insert(
                id: id,
                name: name,
                code: code,
                zoneId: zoneId,
                remoteId: remoteId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StatesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({zoneId = false, projectsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (projectsRefs) db.projects],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (zoneId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.zoneId,
                                referencedTable: $$StatesTableReferences
                                    ._zoneIdTable(db),
                                referencedColumn: $$StatesTableReferences
                                    ._zoneIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (projectsRefs)
                    await $_getPrefetchedData<State, $StatesTable, Project>(
                      currentTable: table,
                      referencedTable: $$StatesTableReferences
                          ._projectsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$StatesTableReferences(db, table, p0).projectsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.stateId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StatesTable,
      State,
      $$StatesTableFilterComposer,
      $$StatesTableOrderingComposer,
      $$StatesTableAnnotationComposer,
      $$StatesTableCreateCompanionBuilder,
      $$StatesTableUpdateCompanionBuilder,
      (State, $$StatesTableReferences),
      State,
      PrefetchHooks Function({bool zoneId, bool projectsRefs})
    >;
typedef $$ProjectsTableCreateCompanionBuilder =
    ProjectsCompanion Function({
      required String code,
      required ProjectStatus status,
      required int agencyId,
      required int ministryId,
      required int stateId,
      required int zoneId,
      required String createdBy,
      Value<String?> modifiedBy,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> lastSyncedAt,
      Value<bool> isSynced,
      required String constituency,
      required double amount,
      required String title,
      Value<String?> sponsor,
      Value<String?> remoteId,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<int> rowid,
    });
typedef $$ProjectsTableUpdateCompanionBuilder =
    ProjectsCompanion Function({
      Value<String> code,
      Value<ProjectStatus> status,
      Value<int> agencyId,
      Value<int> ministryId,
      Value<int> stateId,
      Value<int> zoneId,
      Value<String> createdBy,
      Value<String?> modifiedBy,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> lastSyncedAt,
      Value<bool> isSynced,
      Value<String> constituency,
      Value<double> amount,
      Value<String> title,
      Value<String?> sponsor,
      Value<String?> remoteId,
      Value<DateTime?> startDate,
      Value<DateTime?> endDate,
      Value<int> rowid,
    });

final class $$ProjectsTableReferences
    extends BaseReferences<_$AppDatabase, $ProjectsTable, Project> {
  $$ProjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AgenciesTable _agencyIdTable(_$AppDatabase db) => db.agencies
      .createAlias($_aliasNameGenerator(db.projects.agencyId, db.agencies.id));

  $$AgenciesTableProcessedTableManager get agencyId {
    final $_column = $_itemColumn<int>('agency_id')!;

    final manager = $$AgenciesTableTableManager(
      $_db,
      $_db.agencies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_agencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MinistriesTable _ministryIdTable(_$AppDatabase db) =>
      db.ministries.createAlias(
        $_aliasNameGenerator(db.projects.ministryId, db.ministries.id),
      );

  $$MinistriesTableProcessedTableManager get ministryId {
    final $_column = $_itemColumn<int>('ministry_id')!;

    final manager = $$MinistriesTableTableManager(
      $_db,
      $_db.ministries,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ministryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StatesTable _stateIdTable(_$AppDatabase db) => db.states.createAlias(
    $_aliasNameGenerator(db.projects.stateId, db.states.id),
  );

  $$StatesTableProcessedTableManager get stateId {
    final $_column = $_itemColumn<int>('state_id')!;

    final manager = $$StatesTableTableManager(
      $_db,
      $_db.states,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GeopoliticalZonesTable _zoneIdTable(_$AppDatabase db) =>
      db.geopoliticalZones.createAlias(
        $_aliasNameGenerator(db.projects.zoneId, db.geopoliticalZones.id),
      );

  $$GeopoliticalZonesTableProcessedTableManager get zoneId {
    final $_column = $_itemColumn<int>('zone_id')!;

    final manager = $$GeopoliticalZonesTableTableManager(
      $_db,
      $_db.geopoliticalZones,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_zoneIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _createdByTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.projects.createdBy, db.users.uid),
  );

  $$UsersTableProcessedTableManager get createdBy {
    final $_column = $_itemColumn<String>('created_by')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_createdByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _modifiedByTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.projects.modifiedBy, db.users.uid),
  );

  $$UsersTableProcessedTableManager? get modifiedBy {
    final $_column = $_itemColumn<String>('modified_by');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modifiedByTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ExportHistoryTable, List<ExportHistoryData>>
  _exportHistoryRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.exportHistory,
    aliasName: $_aliasNameGenerator(
      db.projects.code,
      db.exportHistory.projectCode,
    ),
  );

  $$ExportHistoryTableProcessedTableManager get exportHistoryRefs {
    final manager = $$ExportHistoryTableTableManager($_db, $_db.exportHistory)
        .filter(
          (f) => f.projectCode.code.sqlEquals($_itemColumn<String>('code')!),
        );

    final cache = $_typedResult.readTableOrNull(_exportHistoryRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProjectsTableFilterComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ProjectStatus, ProjectStatus, String>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get constituency => $composableBuilder(
    column: $table.constituency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sponsor => $composableBuilder(
    column: $table.sponsor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  $$AgenciesTableFilterComposer get agencyId {
    final $$AgenciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agencyId,
      referencedTable: $db.agencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenciesTableFilterComposer(
            $db: $db,
            $table: $db.agencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MinistriesTableFilterComposer get ministryId {
    final $$MinistriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ministryId,
      referencedTable: $db.ministries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MinistriesTableFilterComposer(
            $db: $db,
            $table: $db.ministries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatesTableFilterComposer get stateId {
    final $$StatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stateId,
      referencedTable: $db.states,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableFilterComposer(
            $db: $db,
            $table: $db.states,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GeopoliticalZonesTableFilterComposer get zoneId {
    final $$GeopoliticalZonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zoneId,
      referencedTable: $db.geopoliticalZones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeopoliticalZonesTableFilterComposer(
            $db: $db,
            $table: $db.geopoliticalZones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get createdBy {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get modifiedBy {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modifiedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> exportHistoryRefs(
    Expression<bool> Function($$ExportHistoryTableFilterComposer f) f,
  ) {
    final $$ExportHistoryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.exportHistory,
      getReferencedColumn: (t) => t.projectCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExportHistoryTableFilterComposer(
            $db: $db,
            $table: $db.exportHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get constituency => $composableBuilder(
    column: $table.constituency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sponsor => $composableBuilder(
    column: $table.sponsor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remoteId => $composableBuilder(
    column: $table.remoteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$AgenciesTableOrderingComposer get agencyId {
    final $$AgenciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agencyId,
      referencedTable: $db.agencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenciesTableOrderingComposer(
            $db: $db,
            $table: $db.agencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MinistriesTableOrderingComposer get ministryId {
    final $$MinistriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ministryId,
      referencedTable: $db.ministries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MinistriesTableOrderingComposer(
            $db: $db,
            $table: $db.ministries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatesTableOrderingComposer get stateId {
    final $$StatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stateId,
      referencedTable: $db.states,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableOrderingComposer(
            $db: $db,
            $table: $db.states,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GeopoliticalZonesTableOrderingComposer get zoneId {
    final $$GeopoliticalZonesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.zoneId,
      referencedTable: $db.geopoliticalZones,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeopoliticalZonesTableOrderingComposer(
            $db: $db,
            $table: $db.geopoliticalZones,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get createdBy {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get modifiedBy {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modifiedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProjectsTable> {
  $$ProjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ProjectStatus, String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<String> get constituency => $composableBuilder(
    column: $table.constituency,
    builder: (column) => column,
  );

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get sponsor =>
      $composableBuilder(column: $table.sponsor, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  $$AgenciesTableAnnotationComposer get agencyId {
    final $$AgenciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.agencyId,
      referencedTable: $db.agencies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AgenciesTableAnnotationComposer(
            $db: $db,
            $table: $db.agencies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MinistriesTableAnnotationComposer get ministryId {
    final $$MinistriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ministryId,
      referencedTable: $db.ministries,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MinistriesTableAnnotationComposer(
            $db: $db,
            $table: $db.ministries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StatesTableAnnotationComposer get stateId {
    final $$StatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stateId,
      referencedTable: $db.states,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StatesTableAnnotationComposer(
            $db: $db,
            $table: $db.states,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GeopoliticalZonesTableAnnotationComposer get zoneId {
    final $$GeopoliticalZonesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.zoneId,
          referencedTable: $db.geopoliticalZones,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GeopoliticalZonesTableAnnotationComposer(
                $db: $db,
                $table: $db.geopoliticalZones,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$UsersTableAnnotationComposer get createdBy {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.createdBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get modifiedBy {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modifiedBy,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> exportHistoryRefs<T extends Object>(
    Expression<T> Function($$ExportHistoryTableAnnotationComposer a) f,
  ) {
    final $$ExportHistoryTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.exportHistory,
      getReferencedColumn: (t) => t.projectCode,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ExportHistoryTableAnnotationComposer(
            $db: $db,
            $table: $db.exportHistory,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ProjectsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProjectsTable,
          Project,
          $$ProjectsTableFilterComposer,
          $$ProjectsTableOrderingComposer,
          $$ProjectsTableAnnotationComposer,
          $$ProjectsTableCreateCompanionBuilder,
          $$ProjectsTableUpdateCompanionBuilder,
          (Project, $$ProjectsTableReferences),
          Project,
          PrefetchHooks Function({
            bool agencyId,
            bool ministryId,
            bool stateId,
            bool zoneId,
            bool createdBy,
            bool modifiedBy,
            bool exportHistoryRefs,
          })
        > {
  $$ProjectsTableTableManager(_$AppDatabase db, $ProjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<ProjectStatus> status = const Value.absent(),
                Value<int> agencyId = const Value.absent(),
                Value<int> ministryId = const Value.absent(),
                Value<int> stateId = const Value.absent(),
                Value<int> zoneId = const Value.absent(),
                Value<String> createdBy = const Value.absent(),
                Value<String?> modifiedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String> constituency = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> sponsor = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion(
                code: code,
                status: status,
                agencyId: agencyId,
                ministryId: ministryId,
                stateId: stateId,
                zoneId: zoneId,
                createdBy: createdBy,
                modifiedBy: modifiedBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastSyncedAt: lastSyncedAt,
                isSynced: isSynced,
                constituency: constituency,
                amount: amount,
                title: title,
                sponsor: sponsor,
                remoteId: remoteId,
                startDate: startDate,
                endDate: endDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required ProjectStatus status,
                required int agencyId,
                required int ministryId,
                required int stateId,
                required int zoneId,
                required String createdBy,
                Value<String?> modifiedBy = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> lastSyncedAt = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                required String constituency,
                required double amount,
                required String title,
                Value<String?> sponsor = const Value.absent(),
                Value<String?> remoteId = const Value.absent(),
                Value<DateTime?> startDate = const Value.absent(),
                Value<DateTime?> endDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProjectsCompanion.insert(
                code: code,
                status: status,
                agencyId: agencyId,
                ministryId: ministryId,
                stateId: stateId,
                zoneId: zoneId,
                createdBy: createdBy,
                modifiedBy: modifiedBy,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastSyncedAt: lastSyncedAt,
                isSynced: isSynced,
                constituency: constituency,
                amount: amount,
                title: title,
                sponsor: sponsor,
                remoteId: remoteId,
                startDate: startDate,
                endDate: endDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProjectsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                agencyId = false,
                ministryId = false,
                stateId = false,
                zoneId = false,
                createdBy = false,
                modifiedBy = false,
                exportHistoryRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (exportHistoryRefs) db.exportHistory,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (agencyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.agencyId,
                                    referencedTable: $$ProjectsTableReferences
                                        ._agencyIdTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._agencyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (ministryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ministryId,
                                    referencedTable: $$ProjectsTableReferences
                                        ._ministryIdTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._ministryIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (stateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.stateId,
                                    referencedTable: $$ProjectsTableReferences
                                        ._stateIdTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._stateIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (zoneId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.zoneId,
                                    referencedTable: $$ProjectsTableReferences
                                        ._zoneIdTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._zoneIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (createdBy) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.createdBy,
                                    referencedTable: $$ProjectsTableReferences
                                        ._createdByTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._createdByTable(db)
                                        .uid,
                                  )
                                  as T;
                        }
                        if (modifiedBy) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.modifiedBy,
                                    referencedTable: $$ProjectsTableReferences
                                        ._modifiedByTable(db),
                                    referencedColumn: $$ProjectsTableReferences
                                        ._modifiedByTable(db)
                                        .uid,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (exportHistoryRefs)
                        await $_getPrefetchedData<
                          Project,
                          $ProjectsTable,
                          ExportHistoryData
                        >(
                          currentTable: table,
                          referencedTable: $$ProjectsTableReferences
                              ._exportHistoryRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ProjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).exportHistoryRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.projectCode == item.code,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ProjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProjectsTable,
      Project,
      $$ProjectsTableFilterComposer,
      $$ProjectsTableOrderingComposer,
      $$ProjectsTableAnnotationComposer,
      $$ProjectsTableCreateCompanionBuilder,
      $$ProjectsTableUpdateCompanionBuilder,
      (Project, $$ProjectsTableReferences),
      Project,
      PrefetchHooks Function({
        bool agencyId,
        bool ministryId,
        bool stateId,
        bool zoneId,
        bool createdBy,
        bool modifiedBy,
        bool exportHistoryRefs,
      })
    >;
typedef $$AuditLogsTableCreateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      required String userId,
      required String tableNameRef,
      Value<String?> recordId,
      required AuditAction action,
      Value<String?> oldValues,
      Value<String?> newValues,
      Value<DateTime> createdAt,
      Value<String?> ipAddress,
    });
typedef $$AuditLogsTableUpdateCompanionBuilder =
    AuditLogsCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> tableNameRef,
      Value<String?> recordId,
      Value<AuditAction> action,
      Value<String?> oldValues,
      Value<String?> newValues,
      Value<DateTime> createdAt,
      Value<String?> ipAddress,
    });

final class $$AuditLogsTableReferences
    extends BaseReferences<_$AppDatabase, $AuditLogsTable, AuditLog> {
  $$AuditLogsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.auditLogs.userId, db.users.uid),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tableNameRef => $composableBuilder(
    column: $table.tableNameRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<AuditAction, AuditAction, String> get action =>
      $composableBuilder(
        column: $table.action,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get oldValues => $composableBuilder(
    column: $table.oldValues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newValues => $composableBuilder(
    column: $table.newValues,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tableNameRef => $composableBuilder(
    column: $table.tableNameRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordId => $composableBuilder(
    column: $table.recordId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get oldValues => $composableBuilder(
    column: $table.oldValues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newValues => $composableBuilder(
    column: $table.newValues,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ipAddress => $composableBuilder(
    column: $table.ipAddress,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsTable> {
  $$AuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tableNameRef => $composableBuilder(
    column: $table.tableNameRef,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<AuditAction, String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get oldValues =>
      $composableBuilder(column: $table.oldValues, builder: (column) => column);

  GeneratedColumn<String> get newValues =>
      $composableBuilder(column: $table.newValues, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get ipAddress =>
      $composableBuilder(column: $table.ipAddress, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AuditLogsTable,
          AuditLog,
          $$AuditLogsTableFilterComposer,
          $$AuditLogsTableOrderingComposer,
          $$AuditLogsTableAnnotationComposer,
          $$AuditLogsTableCreateCompanionBuilder,
          $$AuditLogsTableUpdateCompanionBuilder,
          (AuditLog, $$AuditLogsTableReferences),
          AuditLog,
          PrefetchHooks Function({bool userId})
        > {
  $$AuditLogsTableTableManager(_$AppDatabase db, $AuditLogsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> tableNameRef = const Value.absent(),
                Value<String?> recordId = const Value.absent(),
                Value<AuditAction> action = const Value.absent(),
                Value<String?> oldValues = const Value.absent(),
                Value<String?> newValues = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
              }) => AuditLogsCompanion(
                id: id,
                userId: userId,
                tableNameRef: tableNameRef,
                recordId: recordId,
                action: action,
                oldValues: oldValues,
                newValues: newValues,
                createdAt: createdAt,
                ipAddress: ipAddress,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String tableNameRef,
                Value<String?> recordId = const Value.absent(),
                required AuditAction action,
                Value<String?> oldValues = const Value.absent(),
                Value<String?> newValues = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> ipAddress = const Value.absent(),
              }) => AuditLogsCompanion.insert(
                id: id,
                userId: userId,
                tableNameRef: tableNameRef,
                recordId: recordId,
                action: action,
                oldValues: oldValues,
                newValues: newValues,
                createdAt: createdAt,
                ipAddress: ipAddress,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AuditLogsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$AuditLogsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$AuditLogsTableReferences
                                    ._userIdTable(db)
                                    .uid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AuditLogsTable,
      AuditLog,
      $$AuditLogsTableFilterComposer,
      $$AuditLogsTableOrderingComposer,
      $$AuditLogsTableAnnotationComposer,
      $$AuditLogsTableCreateCompanionBuilder,
      $$AuditLogsTableUpdateCompanionBuilder,
      (AuditLog, $$AuditLogsTableReferences),
      AuditLog,
      PrefetchHooks Function({bool userId})
    >;
typedef $$ExportHistoryTableCreateCompanionBuilder =
    ExportHistoryCompanion Function({
      Value<int> id,
      required String userId,
      required String projectCode,
      required ExportFormat format,
      required int recordCount,
      required String fileName,
      Value<String?> filters,
      Value<DateTime> createdAt,
    });
typedef $$ExportHistoryTableUpdateCompanionBuilder =
    ExportHistoryCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> projectCode,
      Value<ExportFormat> format,
      Value<int> recordCount,
      Value<String> fileName,
      Value<String?> filters,
      Value<DateTime> createdAt,
    });

final class $$ExportHistoryTableReferences
    extends
        BaseReferences<_$AppDatabase, $ExportHistoryTable, ExportHistoryData> {
  $$ExportHistoryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.exportHistory.userId, db.users.uid),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProjectsTable _projectCodeTable(_$AppDatabase db) =>
      db.projects.createAlias(
        $_aliasNameGenerator(db.exportHistory.projectCode, db.projects.code),
      );

  $$ProjectsTableProcessedTableManager get projectCode {
    final $_column = $_itemColumn<String>('project_code')!;

    final manager = $$ProjectsTableTableManager(
      $_db,
      $_db.projects,
    ).filter((f) => f.code.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_projectCodeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ExportHistoryTableFilterComposer
    extends Composer<_$AppDatabase, $ExportHistoryTable> {
  $$ExportHistoryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ExportFormat, ExportFormat, String>
  get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get recordCount => $composableBuilder(
    column: $table.recordCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filters => $composableBuilder(
    column: $table.filters,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectsTableFilterComposer get projectCode {
    final $$ProjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectCode,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableFilterComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExportHistoryTableOrderingComposer
    extends Composer<_$AppDatabase, $ExportHistoryTable> {
  $$ExportHistoryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get recordCount => $composableBuilder(
    column: $table.recordCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filters => $composableBuilder(
    column: $table.filters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectsTableOrderingComposer get projectCode {
    final $$ProjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectCode,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableOrderingComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExportHistoryTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExportHistoryTable> {
  $$ExportHistoryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ExportFormat, String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<int> get recordCount => $composableBuilder(
    column: $table.recordCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get filters =>
      $composableBuilder(column: $table.filters, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProjectsTableAnnotationComposer get projectCode {
    final $$ProjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.projectCode,
      referencedTable: $db.projects,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.projects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ExportHistoryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExportHistoryTable,
          ExportHistoryData,
          $$ExportHistoryTableFilterComposer,
          $$ExportHistoryTableOrderingComposer,
          $$ExportHistoryTableAnnotationComposer,
          $$ExportHistoryTableCreateCompanionBuilder,
          $$ExportHistoryTableUpdateCompanionBuilder,
          (ExportHistoryData, $$ExportHistoryTableReferences),
          ExportHistoryData,
          PrefetchHooks Function({bool userId, bool projectCode})
        > {
  $$ExportHistoryTableTableManager(_$AppDatabase db, $ExportHistoryTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExportHistoryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExportHistoryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExportHistoryTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> projectCode = const Value.absent(),
                Value<ExportFormat> format = const Value.absent(),
                Value<int> recordCount = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String?> filters = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExportHistoryCompanion(
                id: id,
                userId: userId,
                projectCode: projectCode,
                format: format,
                recordCount: recordCount,
                fileName: fileName,
                filters: filters,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String projectCode,
                required ExportFormat format,
                required int recordCount,
                required String fileName,
                Value<String?> filters = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ExportHistoryCompanion.insert(
                id: id,
                userId: userId,
                projectCode: projectCode,
                format: format,
                recordCount: recordCount,
                fileName: fileName,
                filters: filters,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ExportHistoryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, projectCode = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ExportHistoryTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ExportHistoryTableReferences
                                    ._userIdTable(db)
                                    .uid,
                              )
                              as T;
                    }
                    if (projectCode) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.projectCode,
                                referencedTable: $$ExportHistoryTableReferences
                                    ._projectCodeTable(db),
                                referencedColumn: $$ExportHistoryTableReferences
                                    ._projectCodeTable(db)
                                    .code,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ExportHistoryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExportHistoryTable,
      ExportHistoryData,
      $$ExportHistoryTableFilterComposer,
      $$ExportHistoryTableOrderingComposer,
      $$ExportHistoryTableAnnotationComposer,
      $$ExportHistoryTableCreateCompanionBuilder,
      $$ExportHistoryTableUpdateCompanionBuilder,
      (ExportHistoryData, $$ExportHistoryTableReferences),
      ExportHistoryData,
      PrefetchHooks Function({bool userId, bool projectCode})
    >;
typedef $$SessionsTableCreateCompanionBuilder =
    SessionsCompanion Function({
      Value<int> id,
      Value<String?> activeUserId,
      Value<DateTime> createdAt,
    });
typedef $$SessionsTableUpdateCompanionBuilder =
    SessionsCompanion Function({
      Value<int> id,
      Value<String?> activeUserId,
      Value<DateTime> createdAt,
    });

final class $$SessionsTableReferences
    extends BaseReferences<_$AppDatabase, $SessionsTable, Session> {
  $$SessionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _activeUserIdTable(_$AppDatabase db) =>
      db.users.createAlias(
        $_aliasNameGenerator(db.sessions.activeUserId, db.users.uid),
      );

  $$UsersTableProcessedTableManager? get activeUserId {
    final $_column = $_itemColumn<String>('active_user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.uid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_activeUserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get activeUserId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activeUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get activeUserId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activeUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$UsersTableAnnotationComposer get activeUserId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activeUserId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.uid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SessionsTable,
          Session,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (Session, $$SessionsTableReferences),
          Session,
          PrefetchHooks Function({bool activeUserId})
        > {
  $$SessionsTableTableManager(_$AppDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> activeUserId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                activeUserId: activeUserId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> activeUserId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                activeUserId: activeUserId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SessionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({activeUserId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (activeUserId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.activeUserId,
                                referencedTable: $$SessionsTableReferences
                                    ._activeUserIdTable(db),
                                referencedColumn: $$SessionsTableReferences
                                    ._activeUserIdTable(db)
                                    .uid,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SessionsTable,
      Session,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (Session, $$SessionsTableReferences),
      Session,
      PrefetchHooks Function({bool activeUserId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$AgenciesTableTableManager get agencies =>
      $$AgenciesTableTableManager(_db, _db.agencies);
  $$MinistriesTableTableManager get ministries =>
      $$MinistriesTableTableManager(_db, _db.ministries);
  $$GeopoliticalZonesTableTableManager get geopoliticalZones =>
      $$GeopoliticalZonesTableTableManager(_db, _db.geopoliticalZones);
  $$StatesTableTableManager get states =>
      $$StatesTableTableManager(_db, _db.states);
  $$ProjectsTableTableManager get projects =>
      $$ProjectsTableTableManager(_db, _db.projects);
  $$AuditLogsTableTableManager get auditLogs =>
      $$AuditLogsTableTableManager(_db, _db.auditLogs);
  $$ExportHistoryTableTableManager get exportHistory =>
      $$ExportHistoryTableTableManager(_db, _db.exportHistory);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
}
