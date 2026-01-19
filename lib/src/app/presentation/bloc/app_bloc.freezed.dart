// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {

 int get themeMode;//0: system, 1: light, 2: dark
 AppUserModel? get user; String? get error; AppSyncStatus get syncStatus; bool get isSeeding; bool get isUpdatingProfile;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  /// Serializes this AppState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.user, user) || other.user == user)&&(identical(other.error, error) || other.error == error)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.isSeeding, isSeeding) || other.isSeeding == isSeeding)&&(identical(other.isUpdatingProfile, isUpdatingProfile) || other.isUpdatingProfile == isUpdatingProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,user,error,syncStatus,isSeeding,isUpdatingProfile);

@override
String toString() {
  return 'AppState(themeMode: $themeMode, user: $user, error: $error, syncStatus: $syncStatus, isSeeding: $isSeeding, isUpdatingProfile: $isUpdatingProfile)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 int themeMode, AppUserModel? user, String? error, AppSyncStatus syncStatus, bool isSeeding, bool isUpdatingProfile
});


$AppUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? themeMode = null,Object? user = freezed,Object? error = freezed,Object? syncStatus = null,Object? isSeeding = null,Object? isUpdatingProfile = null,}) {
  return _then(_self.copyWith(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AppUserModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as AppSyncStatus,isSeeding: null == isSeeding ? _self.isSeeding : isSeeding // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingProfile: null == isUpdatingProfile ? _self.isUpdatingProfile : isUpdatingProfile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AppUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int themeMode,  AppUserModel? user,  String? error,  AppSyncStatus syncStatus,  bool isSeeding,  bool isUpdatingProfile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.themeMode,_that.user,_that.error,_that.syncStatus,_that.isSeeding,_that.isUpdatingProfile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int themeMode,  AppUserModel? user,  String? error,  AppSyncStatus syncStatus,  bool isSeeding,  bool isUpdatingProfile)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.themeMode,_that.user,_that.error,_that.syncStatus,_that.isSeeding,_that.isUpdatingProfile);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int themeMode,  AppUserModel? user,  String? error,  AppSyncStatus syncStatus,  bool isSeeding,  bool isUpdatingProfile)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.themeMode,_that.user,_that.error,_that.syncStatus,_that.isSeeding,_that.isUpdatingProfile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppState implements AppState {
  const _AppState({this.themeMode = 0, this.user, this.error, this.syncStatus = AppSyncStatus.offline, this.isSeeding = false, this.isUpdatingProfile = false});
  factory _AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

@override@JsonKey() final  int themeMode;
//0: system, 1: light, 2: dark
@override final  AppUserModel? user;
@override final  String? error;
@override@JsonKey() final  AppSyncStatus syncStatus;
@override@JsonKey() final  bool isSeeding;
@override@JsonKey() final  bool isUpdatingProfile;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.user, user) || other.user == user)&&(identical(other.error, error) || other.error == error)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.isSeeding, isSeeding) || other.isSeeding == isSeeding)&&(identical(other.isUpdatingProfile, isUpdatingProfile) || other.isUpdatingProfile == isUpdatingProfile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,themeMode,user,error,syncStatus,isSeeding,isUpdatingProfile);

@override
String toString() {
  return 'AppState(themeMode: $themeMode, user: $user, error: $error, syncStatus: $syncStatus, isSeeding: $isSeeding, isUpdatingProfile: $isUpdatingProfile)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 int themeMode, AppUserModel? user, String? error, AppSyncStatus syncStatus, bool isSeeding, bool isUpdatingProfile
});


@override $AppUserModelCopyWith<$Res>? get user;

}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? themeMode = null,Object? user = freezed,Object? error = freezed,Object? syncStatus = null,Object? isSeeding = null,Object? isUpdatingProfile = null,}) {
  return _then(_AppState(
themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as int,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AppUserModel?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as AppSyncStatus,isSeeding: null == isSeeding ? _self.isSeeding : isSeeding // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingProfile: null == isUpdatingProfile ? _self.isUpdatingProfile : isUpdatingProfile // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $AppUserModelCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
