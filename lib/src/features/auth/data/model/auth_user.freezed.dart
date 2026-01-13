// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserModel {

 String get uid; String get username; String get fullName; String get email; UserRole get role; bool get isActive; DateTime get createdAt;
/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserModelCopyWith<AuthUserModel> get copyWith => _$AuthUserModelCopyWithImpl<AuthUserModel>(this as AuthUserModel, _$identity);

  /// Serializes this AuthUserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,fullName,email,role,isActive,createdAt);

@override
String toString() {
  return 'AuthUserModel(uid: $uid, username: $username, fullName: $fullName, email: $email, role: $role, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AuthUserModelCopyWith<$Res>  {
  factory $AuthUserModelCopyWith(AuthUserModel value, $Res Function(AuthUserModel) _then) = _$AuthUserModelCopyWithImpl;
@useResult
$Res call({
 String uid, String username, String fullName, String email, UserRole role, bool isActive, DateTime createdAt
});




}
/// @nodoc
class _$AuthUserModelCopyWithImpl<$Res>
    implements $AuthUserModelCopyWith<$Res> {
  _$AuthUserModelCopyWithImpl(this._self, this._then);

  final AuthUserModel _self;
  final $Res Function(AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? username = null,Object? fullName = null,Object? email = null,Object? role = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserModel].
extension AuthUserModelPatterns on AuthUserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String username,  String fullName,  String email,  UserRole role,  bool isActive,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that.uid,_that.username,_that.fullName,_that.email,_that.role,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String username,  String fullName,  String email,  UserRole role,  bool isActive,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuthUserModel():
return $default(_that.uid,_that.username,_that.fullName,_that.email,_that.role,_that.isActive,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String username,  String fullName,  String email,  UserRole role,  bool isActive,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserModel() when $default != null:
return $default(_that.uid,_that.username,_that.fullName,_that.email,_that.role,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserModel extends AuthUserModel {
  const _AuthUserModel({required this.uid, required this.username, required this.fullName, required this.email, required this.role, required this.isActive, required this.createdAt}): super._();
  factory _AuthUserModel.fromJson(Map<String, dynamic> json) => _$AuthUserModelFromJson(json);

@override final  String uid;
@override final  String username;
@override final  String fullName;
@override final  String email;
@override final  UserRole role;
@override final  bool isActive;
@override final  DateTime createdAt;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserModelCopyWith<_AuthUserModel> get copyWith => __$AuthUserModelCopyWithImpl<_AuthUserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserModel&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.username, username) || other.username == username)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,username,fullName,email,role,isActive,createdAt);

@override
String toString() {
  return 'AuthUserModel(uid: $uid, username: $username, fullName: $fullName, email: $email, role: $role, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuthUserModelCopyWith<$Res> implements $AuthUserModelCopyWith<$Res> {
  factory _$AuthUserModelCopyWith(_AuthUserModel value, $Res Function(_AuthUserModel) _then) = __$AuthUserModelCopyWithImpl;
@override @useResult
$Res call({
 String uid, String username, String fullName, String email, UserRole role, bool isActive, DateTime createdAt
});




}
/// @nodoc
class __$AuthUserModelCopyWithImpl<$Res>
    implements _$AuthUserModelCopyWith<$Res> {
  __$AuthUserModelCopyWithImpl(this._self, this._then);

  final _AuthUserModel _self;
  final $Res Function(_AuthUserModel) _then;

/// Create a copy of AuthUserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? username = null,Object? fullName = null,Object? email = null,Object? role = null,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_AuthUserModel(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
