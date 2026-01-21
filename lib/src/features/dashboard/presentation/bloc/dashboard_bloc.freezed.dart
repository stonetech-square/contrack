// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 bool get isLoading; List<ProjectWithDetails> get recentProjects; DashboardStats get stats; String? get error; String? get userId; List<Project>? get importedProjects; bool get isExporting; String? get exportFilePath;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.recentProjects, recentProjects)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.error, error) || other.error == error)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.importedProjects, importedProjects)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(recentProjects),stats,error,userId,const DeepCollectionEquality().hash(importedProjects),isExporting,exportFilePath);

@override
String toString() {
  return 'DashboardState(isLoading: $isLoading, recentProjects: $recentProjects, stats: $stats, error: $error, userId: $userId, importedProjects: $importedProjects, isExporting: $isExporting, exportFilePath: $exportFilePath)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<ProjectWithDetails> recentProjects, DashboardStats stats, String? error, String? userId, List<Project>? importedProjects, bool isExporting, String? exportFilePath
});




}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? recentProjects = null,Object? stats = null,Object? error = freezed,Object? userId = freezed,Object? importedProjects = freezed,Object? isExporting = null,Object? exportFilePath = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,recentProjects: null == recentProjects ? _self.recentProjects : recentProjects // ignore: cast_nullable_to_non_nullable
as List<ProjectWithDetails>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DashboardStats,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,importedProjects: freezed == importedProjects ? _self.importedProjects : importedProjects // ignore: cast_nullable_to_non_nullable
as List<Project>?,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<ProjectWithDetails> recentProjects,  DashboardStats stats,  String? error,  String? userId,  List<Project>? importedProjects,  bool isExporting,  String? exportFilePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.isLoading,_that.recentProjects,_that.stats,_that.error,_that.userId,_that.importedProjects,_that.isExporting,_that.exportFilePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<ProjectWithDetails> recentProjects,  DashboardStats stats,  String? error,  String? userId,  List<Project>? importedProjects,  bool isExporting,  String? exportFilePath)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.isLoading,_that.recentProjects,_that.stats,_that.error,_that.userId,_that.importedProjects,_that.isExporting,_that.exportFilePath);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<ProjectWithDetails> recentProjects,  DashboardStats stats,  String? error,  String? userId,  List<Project>? importedProjects,  bool isExporting,  String? exportFilePath)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.isLoading,_that.recentProjects,_that.stats,_that.error,_that.userId,_that.importedProjects,_that.isExporting,_that.exportFilePath);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({this.isLoading = false, final  List<ProjectWithDetails> recentProjects = const [], required this.stats, this.error, this.userId, final  List<Project>? importedProjects, this.isExporting = false, this.exportFilePath}): _recentProjects = recentProjects,_importedProjects = importedProjects;
  

@override@JsonKey() final  bool isLoading;
 final  List<ProjectWithDetails> _recentProjects;
@override@JsonKey() List<ProjectWithDetails> get recentProjects {
  if (_recentProjects is EqualUnmodifiableListView) return _recentProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentProjects);
}

@override final  DashboardStats stats;
@override final  String? error;
@override final  String? userId;
 final  List<Project>? _importedProjects;
@override List<Project>? get importedProjects {
  final value = _importedProjects;
  if (value == null) return null;
  if (_importedProjects is EqualUnmodifiableListView) return _importedProjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool isExporting;
@override final  String? exportFilePath;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._recentProjects, _recentProjects)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.error, error) || other.error == error)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._importedProjects, _importedProjects)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_recentProjects),stats,error,userId,const DeepCollectionEquality().hash(_importedProjects),isExporting,exportFilePath);

@override
String toString() {
  return 'DashboardState(isLoading: $isLoading, recentProjects: $recentProjects, stats: $stats, error: $error, userId: $userId, importedProjects: $importedProjects, isExporting: $isExporting, exportFilePath: $exportFilePath)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<ProjectWithDetails> recentProjects, DashboardStats stats, String? error, String? userId, List<Project>? importedProjects, bool isExporting, String? exportFilePath
});




}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? recentProjects = null,Object? stats = null,Object? error = freezed,Object? userId = freezed,Object? importedProjects = freezed,Object? isExporting = null,Object? exportFilePath = freezed,}) {
  return _then(_DashboardState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,recentProjects: null == recentProjects ? _self._recentProjects : recentProjects // ignore: cast_nullable_to_non_nullable
as List<ProjectWithDetails>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DashboardStats,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,importedProjects: freezed == importedProjects ? _self._importedProjects : importedProjects // ignore: cast_nullable_to_non_nullable
as List<Project>?,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
