// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectState {

 String get projectCode; ProjectWithDetails? get project; bool get isLoading; String? get errorMessage; bool get isExporting; String? get exportFilePath; String? get exportError;
/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStateCopyWith<ProjectState> get copyWith => _$ProjectStateCopyWithImpl<ProjectState>(this as ProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectState&&(identical(other.projectCode, projectCode) || other.projectCode == projectCode)&&(identical(other.project, project) || other.project == project)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath)&&(identical(other.exportError, exportError) || other.exportError == exportError));
}


@override
int get hashCode => Object.hash(runtimeType,projectCode,project,isLoading,errorMessage,isExporting,exportFilePath,exportError);

@override
String toString() {
  return 'ProjectState(projectCode: $projectCode, project: $project, isLoading: $isLoading, errorMessage: $errorMessage, isExporting: $isExporting, exportFilePath: $exportFilePath, exportError: $exportError)';
}


}

/// @nodoc
abstract mixin class $ProjectStateCopyWith<$Res>  {
  factory $ProjectStateCopyWith(ProjectState value, $Res Function(ProjectState) _then) = _$ProjectStateCopyWithImpl;
@useResult
$Res call({
 String projectCode, ProjectWithDetails? project, bool isLoading, String? errorMessage, bool isExporting, String? exportFilePath, String? exportError
});




}
/// @nodoc
class _$ProjectStateCopyWithImpl<$Res>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._self, this._then);

  final ProjectState _self;
  final $Res Function(ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectCode = null,Object? project = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? isExporting = null,Object? exportFilePath = freezed,Object? exportError = freezed,}) {
  return _then(_self.copyWith(
projectCode: null == projectCode ? _self.projectCode : projectCode // ignore: cast_nullable_to_non_nullable
as String,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectWithDetails?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,exportError: freezed == exportError ? _self.exportError : exportError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectState].
extension ProjectStatePatterns on ProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectState value)  $default,){
final _that = this;
switch (_that) {
case _ProjectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectState value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String projectCode,  ProjectWithDetails? project,  bool isLoading,  String? errorMessage,  bool isExporting,  String? exportFilePath,  String? exportError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that.projectCode,_that.project,_that.isLoading,_that.errorMessage,_that.isExporting,_that.exportFilePath,_that.exportError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String projectCode,  ProjectWithDetails? project,  bool isLoading,  String? errorMessage,  bool isExporting,  String? exportFilePath,  String? exportError)  $default,) {final _that = this;
switch (_that) {
case _ProjectState():
return $default(_that.projectCode,_that.project,_that.isLoading,_that.errorMessage,_that.isExporting,_that.exportFilePath,_that.exportError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String projectCode,  ProjectWithDetails? project,  bool isLoading,  String? errorMessage,  bool isExporting,  String? exportFilePath,  String? exportError)?  $default,) {final _that = this;
switch (_that) {
case _ProjectState() when $default != null:
return $default(_that.projectCode,_that.project,_that.isLoading,_that.errorMessage,_that.isExporting,_that.exportFilePath,_that.exportError);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectState implements ProjectState {
  const _ProjectState({this.projectCode = '', this.project, this.isLoading = false, this.errorMessage, this.isExporting = false, this.exportFilePath, this.exportError});
  

@override@JsonKey() final  String projectCode;
@override final  ProjectWithDetails? project;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  bool isExporting;
@override final  String? exportFilePath;
@override final  String? exportError;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectStateCopyWith<_ProjectState> get copyWith => __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectState&&(identical(other.projectCode, projectCode) || other.projectCode == projectCode)&&(identical(other.project, project) || other.project == project)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isExporting, isExporting) || other.isExporting == isExporting)&&(identical(other.exportFilePath, exportFilePath) || other.exportFilePath == exportFilePath)&&(identical(other.exportError, exportError) || other.exportError == exportError));
}


@override
int get hashCode => Object.hash(runtimeType,projectCode,project,isLoading,errorMessage,isExporting,exportFilePath,exportError);

@override
String toString() {
  return 'ProjectState(projectCode: $projectCode, project: $project, isLoading: $isLoading, errorMessage: $errorMessage, isExporting: $isExporting, exportFilePath: $exportFilePath, exportError: $exportError)';
}


}

/// @nodoc
abstract mixin class _$ProjectStateCopyWith<$Res> implements $ProjectStateCopyWith<$Res> {
  factory _$ProjectStateCopyWith(_ProjectState value, $Res Function(_ProjectState) _then) = __$ProjectStateCopyWithImpl;
@override @useResult
$Res call({
 String projectCode, ProjectWithDetails? project, bool isLoading, String? errorMessage, bool isExporting, String? exportFilePath, String? exportError
});




}
/// @nodoc
class __$ProjectStateCopyWithImpl<$Res>
    implements _$ProjectStateCopyWith<$Res> {
  __$ProjectStateCopyWithImpl(this._self, this._then);

  final _ProjectState _self;
  final $Res Function(_ProjectState) _then;

/// Create a copy of ProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectCode = null,Object? project = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? isExporting = null,Object? exportFilePath = freezed,Object? exportError = freezed,}) {
  return _then(_ProjectState(
projectCode: null == projectCode ? _self.projectCode : projectCode // ignore: cast_nullable_to_non_nullable
as String,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectWithDetails?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isExporting: null == isExporting ? _self.isExporting : isExporting // ignore: cast_nullable_to_non_nullable
as bool,exportFilePath: freezed == exportFilePath ? _self.exportFilePath : exportFilePath // ignore: cast_nullable_to_non_nullable
as String?,exportError: freezed == exportError ? _self.exportError : exportError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
