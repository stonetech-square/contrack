// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_role_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRoleInfo {

 UserRole get role; bool get isActive;
/// Create a copy of UserRoleInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRoleInfoCopyWith<UserRoleInfo> get copyWith => _$UserRoleInfoCopyWithImpl<UserRoleInfo>(this as UserRoleInfo, _$identity);

  /// Serializes this UserRoleInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRoleInfo&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,isActive);

@override
String toString() {
  return 'UserRoleInfo(role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $UserRoleInfoCopyWith<$Res>  {
  factory $UserRoleInfoCopyWith(UserRoleInfo value, $Res Function(UserRoleInfo) _then) = _$UserRoleInfoCopyWithImpl;
@useResult
$Res call({
 UserRole role, bool isActive
});




}
/// @nodoc
class _$UserRoleInfoCopyWithImpl<$Res>
    implements $UserRoleInfoCopyWith<$Res> {
  _$UserRoleInfoCopyWithImpl(this._self, this._then);

  final UserRoleInfo _self;
  final $Res Function(UserRoleInfo) _then;

/// Create a copy of UserRoleInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserRoleInfo].
extension UserRoleInfoPatterns on UserRoleInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserRoleInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserRoleInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserRoleInfo value)  $default,){
final _that = this;
switch (_that) {
case _UserRoleInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserRoleInfo value)?  $default,){
final _that = this;
switch (_that) {
case _UserRoleInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserRole role,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserRoleInfo() when $default != null:
return $default(_that.role,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserRole role,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _UserRoleInfo():
return $default(_that.role,_that.isActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserRole role,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _UserRoleInfo() when $default != null:
return $default(_that.role,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _UserRoleInfo implements UserRoleInfo {
  const _UserRoleInfo({required this.role, required this.isActive});
  factory _UserRoleInfo.fromJson(Map<String, dynamic> json) => _$UserRoleInfoFromJson(json);

@override final  UserRole role;
@override final  bool isActive;

/// Create a copy of UserRoleInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserRoleInfoCopyWith<_UserRoleInfo> get copyWith => __$UserRoleInfoCopyWithImpl<_UserRoleInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserRoleInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserRoleInfo&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,isActive);

@override
String toString() {
  return 'UserRoleInfo(role: $role, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UserRoleInfoCopyWith<$Res> implements $UserRoleInfoCopyWith<$Res> {
  factory _$UserRoleInfoCopyWith(_UserRoleInfo value, $Res Function(_UserRoleInfo) _then) = __$UserRoleInfoCopyWithImpl;
@override @useResult
$Res call({
 UserRole role, bool isActive
});




}
/// @nodoc
class __$UserRoleInfoCopyWithImpl<$Res>
    implements _$UserRoleInfoCopyWith<$Res> {
  __$UserRoleInfoCopyWithImpl(this._self, this._then);

  final _UserRoleInfo _self;
  final $Res Function(_UserRoleInfo) _then;

/// Create a copy of UserRoleInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? isActive = null,}) {
  return _then(_UserRoleInfo(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as UserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
