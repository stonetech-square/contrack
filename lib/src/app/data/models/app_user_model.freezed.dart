// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUserModel {

 String get uid; String get username; String get fullName; String get email; UserRole get role; bool get isActive; DateTime get createdAt; DateTime? get lastLoginAt;
/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserModelCopyWith<AppUserModel> get copyWith => _$AppUserModelCopyWithImpl<AppUserModel>(this as AppUserModel, _$identity);

  /// Serializes this AppUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUserModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,fullName,email,role,isActive,createdAt,lastLoginAt);

@override
String toString() {
  return 'AppUserModel(uid: $uid, username: $username, fullName: $fullName, email: $email, role: $role, isActive: $isActive, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $AppUserModelCopyWith<$Res>  {
  factory $AppUserModelCopyWith(AppUserModel value, $Res Function(AppUserModel) _then) = _$AppUserModelCopyWithImpl;
@useResult
$Res call({
 String uid, String username, String fullName, String email, UserRole role, bool isActive, DateTime createdAt, DateTime? lastLoginAt
});




}
/// @nodoc
class _$AppUserModelCopyWithImpl<$Res>
    implements $AppUserModelCopyWith<$Res> {
  _$AppUserModelCopyWithImpl(this._self, this._then);

  final AppUserModel _self;
  final $Res Function(AppUserModel) _then;

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? username = null,Object? fullName = null,Object? email = null,Object? role = null,Object? isActive = null,Object? createdAt = null,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUserModel].
extension AppUserModelPatterns on AppUserModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUserModel value)  $default,){
final _that = this;
switch (_that) {
case _AppUserModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String username,  String fullName,  String email,  UserRole role,  bool isActive,  DateTime createdAt,  DateTime? lastLoginAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
return $default(_that.uid,_that.username,_that.fullName,_that.email,_that.role,_that.isActive,_that.createdAt,_that.lastLoginAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String username,  String fullName,  String email,  UserRole role,  bool isActive,  DateTime createdAt,  DateTime? lastLoginAt)  $default,) {final _that = this;
switch (_that) {
case _AppUserModel():
return $default(_that.uid,_that.username,_that.fullName,_that.email,_that.role,_that.isActive,_that.createdAt,_that.lastLoginAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String username,  String fullName,  String email,  UserRole role,  bool isActive,  DateTime createdAt,  DateTime? lastLoginAt)?  $default,) {final _that = this;
switch (_that) {
case _AppUserModel() when $default != null:
return $default(_that.uid,_that.username,_that.fullName,_that.email,_that.role,_that.isActive,_that.createdAt,_that.lastLoginAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUserModel extends AppUserModel {
  const _AppUserModel({required this.uid, required this.username, required this.fullName, required this.email, required this.role, required this.isActive, required this.createdAt, this.lastLoginAt}): super._();
  factory _AppUserModel.fromJson(Map<String, dynamic> json) => _$AppUserModelFromJson(json);

@override final  String uid;
@override final  String username;
@override final  String fullName;
@override final  String email;
@override final  UserRole role;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime? lastLoginAt;

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserModelCopyWith<_AppUserModel> get copyWith => __$AppUserModelCopyWithImpl<_AppUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUserModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,fullName,email,role,isActive,createdAt,lastLoginAt);

@override
String toString() {
  return 'AppUserModel(uid: $uid, username: $username, fullName: $fullName, email: $email, role: $role, isActive: $isActive, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$AppUserModelCopyWith<$Res> implements $AppUserModelCopyWith<$Res> {
  factory _$AppUserModelCopyWith(_AppUserModel value, $Res Function(_AppUserModel) _then) = __$AppUserModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String username, String fullName, String email, UserRole role, bool isActive, DateTime createdAt, DateTime? lastLoginAt
});




}
/// @nodoc
class __$AppUserModelCopyWithImpl<$Res>
    implements _$AppUserModelCopyWith<$Res> {
  __$AppUserModelCopyWithImpl(this._self, this._then);

  final _AppUserModel _self;
  final $Res Function(_AppUserModel) _then;

/// Create a copy of AppUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? username = null,Object? fullName = null,Object? email = null,Object? role = null,Object? isActive = null,Object? createdAt = null,Object? lastLoginAt = freezed,}) {
  return _then(_AppUserModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
