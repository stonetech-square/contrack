// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_projects_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AllProjectsState {

 List<Project> get projects; bool get isLoading; String? get errorMessage; bool get isExporting; String? get exportFilePath; String? get exportError;
/// Create a copy of AllProjectsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AllProjectsStateCopyWith<AllProjectsState> get copyWith => _$AllProjectsStateCopyWithImpl<AllProjectsState>(this as AllProjectsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllProjectsState&&const DeepCollectionEquality().equals(other.projects, projects)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath)&&(identical(other.exportError, exportError) || other.exportError == exportError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects),isLoading,errorMessage,isExporting,exportFilePath,exportError);

@override
String toString() {
  return 'AllProjectsState(projects: $projects, isLoading: $isLoading, errorMessage: $errorMessage, isExporting: $isExporting, exportFilePath: $exportFilePath, exportError: $exportError)';
}


}

/// @nodoc
abstract mixin class $AllProjectsStateCopyWith<$Res>  {
  factory $AllProjectsStateCopyWith(AllProjectsState value, $Res Function(AllProjectsState) _then) = _$AllProjectsStateCopyWithImpl;
@useResult
$Res call({
 List<Project> projects, bool isLoading, String? errorMessage, bool isExporting, String? exportFilePath, String? exportError
});




}
/// @nodoc
class _$AllProjectsStateCopyWithImpl<$Res>
    implements $AllProjectsStateCopyWith<$Res> {
  _$AllProjectsStateCopyWithImpl(this._self, this._then);

  final AllProjectsState _self;
  final $Res Function(AllProjectsState) _then;

/// Create a copy of AllProjectsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isExporting = null,Object? exportFilePath = freezed,Object? exportError = freezed,}) {
  return _then(_self.copyWith(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,exportError: freezed == exportError ? _self.exportError : exportError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AllProjectsState].
extension AllProjectsStatePatterns on AllProjectsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AllProjectsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AllProjectsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AllProjectsState value)  $default,){
final _that = this;
switch (_that) {
case _AllProjectsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AllProjectsState value)?  $default,){
final _that = this;
switch (_that) {
case _AllProjectsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Project> projects,  bool isLoading,  String? errorMessage,  bool isExporting,  String? exportFilePath,  String? exportError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AllProjectsState() when $default != null:
return $default(_that.projects,_that.isLoading,_that.errorMessage,_that.isExporting,_that.exportFilePath,_that.exportError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Project> projects,  bool isLoading,  String? errorMessage,  bool isExporting,  String? exportFilePath,  String? exportError)  $default,) {final _that = this;
switch (_that) {
case _AllProjectsState():
return $default(_that.projects,_that.isLoading,_that.errorMessage,_that.isExporting,_that.exportFilePath,_that.exportError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Project> projects,  bool isLoading,  String? errorMessage,  bool isExporting,  String? exportFilePath,  String? exportError)?  $default,) {final _that = this;
switch (_that) {
case _AllProjectsState() when $default != null:
return $default(_that.projects,_that.isLoading,_that.errorMessage,_that.isExporting,_that.exportFilePath,_that.exportError);case _:
  return null;

}
}

}

/// @nodoc


class _AllProjectsState implements AllProjectsState {
  const _AllProjectsState({final  List<Project> projects = const [], this.isLoading = false, this.errorMessage, this.isExporting = false, this.exportFilePath, this.exportError}): _projects = projects;
  

 final  List<Project> _projects;
@override@JsonKey() List<Project> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  bool isExporting;
@override final  String? exportFilePath;
@override final  String? exportError;

/// Create a copy of AllProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AllProjectsStateCopyWith<_AllProjectsState> get copyWith => __$AllProjectsStateCopyWithImpl<_AllProjectsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllProjectsState&&const DeepCollectionEquality().equals(other._projects, _projects)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath)&&(identical(other.exportError, exportError) || other.exportError == exportError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects),isLoading,errorMessage,isExporting,exportFilePath,exportError);

@override
String toString() {
  return 'AllProjectsState(projects: $projects, isLoading: $isLoading, errorMessage: $errorMessage, isExporting: $isExporting, exportFilePath: $exportFilePath, exportError: $exportError)';
}


}

/// @nodoc
abstract mixin class _$AllProjectsStateCopyWith<$Res> implements $AllProjectsStateCopyWith<$Res> {
  factory _$AllProjectsStateCopyWith(_AllProjectsState value, $Res Function(_AllProjectsState) _then) = __$AllProjectsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Project> projects, bool isLoading, String? errorMessage, bool isExporting, String? exportFilePath, String? exportError
});




}
/// @nodoc
class __$AllProjectsStateCopyWithImpl<$Res>
    implements _$AllProjectsStateCopyWith<$Res> {
  __$AllProjectsStateCopyWithImpl(this._self, this._then);

  final _AllProjectsState _self;
  final $Res Function(_AllProjectsState) _then;

/// Create a copy of AllProjectsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,Object? isLoading = null,Object? errorMessage = freezed,Object? isExporting = null,Object? exportFilePath = freezed,Object? exportError = freezed,}) {
  return _then(_AllProjectsState(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<Project>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,exportError: freezed == exportError ? _self.exportError : exportError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
