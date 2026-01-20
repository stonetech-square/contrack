// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_data_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MasterDataState {

 List<Ministry> get ministries; List<AgencyWithMinistry> get agencies; bool get isLoadingMinistries; bool get isLoadingAgencies; bool get isSuccess; bool get isError; String? get error;
/// Create a copy of MasterDataState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MasterDataStateCopyWith<MasterDataState> get copyWith => _$MasterDataStateCopyWithImpl<MasterDataState>(this as MasterDataState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MasterDataState&&const DeepCollectionEquality().equals(other.ministries, ministries)&&const DeepCollectionEquality().equals(other.agencies, agencies)&&(identical(other.isLoadingMinistries, isLoadingMinistries) || other.isLoadingMinistries == isLoadingMinistries)&&(identical(other.isLoadingAgencies, isLoadingAgencies) || other.isLoadingAgencies == isLoadingAgencies)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ministries),const DeepCollectionEquality().hash(agencies),isLoadingMinistries,isLoadingAgencies,isSuccess,isError,error);

@override
String toString() {
  return 'MasterDataState(ministries: $ministries, agencies: $agencies, isLoadingMinistries: $isLoadingMinistries, isLoadingAgencies: $isLoadingAgencies, isSuccess: $isSuccess, isError: $isError, error: $error)';
}


}

/// @nodoc
abstract mixin class $MasterDataStateCopyWith<$Res>  {
  factory $MasterDataStateCopyWith(MasterDataState value, $Res Function(MasterDataState) _then) = _$MasterDataStateCopyWithImpl;
@useResult
$Res call({
 List<Ministry> ministries, List<AgencyWithMinistry> agencies, bool isLoadingMinistries, bool isLoadingAgencies, bool isSuccess, bool isError, String? error
});




}
/// @nodoc
class _$MasterDataStateCopyWithImpl<$Res>
    implements $MasterDataStateCopyWith<$Res> {
  _$MasterDataStateCopyWithImpl(this._self, this._then);

  final MasterDataState _self;
  final $Res Function(MasterDataState) _then;

/// Create a copy of MasterDataState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ministries = null,Object? agencies = null,Object? isLoadingMinistries = null,Object? isLoadingAgencies = null,Object? isSuccess = null,Object? isError = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
ministries: null == ministries ? _self.ministries : ministries // ignore: cast_nullable_to_non_nullable
as List<Ministry>,agencies: null == agencies ? _self.agencies : agencies // ignore: cast_nullable_to_non_nullable
as List<AgencyWithMinistry>,isLoadingMinistries: null == isLoadingMinistries ? _self.isLoadingMinistries : isLoadingMinistries // ignore: cast_nullable_to_non_nullable
as bool,isLoadingAgencies: null == isLoadingAgencies ? _self.isLoadingAgencies : isLoadingAgencies // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MasterDataState].
extension MasterDataStatePatterns on MasterDataState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MasterDataState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MasterDataState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MasterDataState value)  $default,){
final _that = this;
switch (_that) {
case _MasterDataState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MasterDataState value)?  $default,){
final _that = this;
switch (_that) {
case _MasterDataState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Ministry> ministries,  List<AgencyWithMinistry> agencies,  bool isLoadingMinistries,  bool isLoadingAgencies,  bool isSuccess,  bool isError,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MasterDataState() when $default != null:
return $default(_that.ministries,_that.agencies,_that.isLoadingMinistries,_that.isLoadingAgencies,_that.isSuccess,_that.isError,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Ministry> ministries,  List<AgencyWithMinistry> agencies,  bool isLoadingMinistries,  bool isLoadingAgencies,  bool isSuccess,  bool isError,  String? error)  $default,) {final _that = this;
switch (_that) {
case _MasterDataState():
return $default(_that.ministries,_that.agencies,_that.isLoadingMinistries,_that.isLoadingAgencies,_that.isSuccess,_that.isError,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Ministry> ministries,  List<AgencyWithMinistry> agencies,  bool isLoadingMinistries,  bool isLoadingAgencies,  bool isSuccess,  bool isError,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _MasterDataState() when $default != null:
return $default(_that.ministries,_that.agencies,_that.isLoadingMinistries,_that.isLoadingAgencies,_that.isSuccess,_that.isError,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _MasterDataState implements MasterDataState {
  const _MasterDataState({final  List<Ministry> ministries = const [], final  List<AgencyWithMinistry> agencies = const [], this.isLoadingMinistries = false, this.isLoadingAgencies = false, this.isSuccess = false, this.isError = false, this.error}): _ministries = ministries,_agencies = agencies;
  

 final  List<Ministry> _ministries;
@override@JsonKey() List<Ministry> get ministries {
  if (_ministries is EqualUnmodifiableListView) return _ministries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ministries);
}

 final  List<AgencyWithMinistry> _agencies;
@override@JsonKey() List<AgencyWithMinistry> get agencies {
  if (_agencies is EqualUnmodifiableListView) return _agencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_agencies);
}

@override@JsonKey() final  bool isLoadingMinistries;
@override@JsonKey() final  bool isLoadingAgencies;
@override@JsonKey() final  bool isSuccess;
@override@JsonKey() final  bool isError;
@override final  String? error;

/// Create a copy of MasterDataState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MasterDataStateCopyWith<_MasterDataState> get copyWith => __$MasterDataStateCopyWithImpl<_MasterDataState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MasterDataState&&const DeepCollectionEquality().equals(other._ministries, _ministries)&&const DeepCollectionEquality().equals(other._agencies, _agencies)&&(identical(other.isLoadingMinistries, isLoadingMinistries) || other.isLoadingMinistries == isLoadingMinistries)&&(identical(other.isLoadingAgencies, isLoadingAgencies) || other.isLoadingAgencies == isLoadingAgencies)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.isError, isError) || other.isError == isError)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ministries),const DeepCollectionEquality().hash(_agencies),isLoadingMinistries,isLoadingAgencies,isSuccess,isError,error);

@override
String toString() {
  return 'MasterDataState(ministries: $ministries, agencies: $agencies, isLoadingMinistries: $isLoadingMinistries, isLoadingAgencies: $isLoadingAgencies, isSuccess: $isSuccess, isError: $isError, error: $error)';
}


}

/// @nodoc
abstract mixin class _$MasterDataStateCopyWith<$Res> implements $MasterDataStateCopyWith<$Res> {
  factory _$MasterDataStateCopyWith(_MasterDataState value, $Res Function(_MasterDataState) _then) = __$MasterDataStateCopyWithImpl;
@override @useResult
$Res call({
 List<Ministry> ministries, List<AgencyWithMinistry> agencies, bool isLoadingMinistries, bool isLoadingAgencies, bool isSuccess, bool isError, String? error
});




}
/// @nodoc
class __$MasterDataStateCopyWithImpl<$Res>
    implements _$MasterDataStateCopyWith<$Res> {
  __$MasterDataStateCopyWithImpl(this._self, this._then);

  final _MasterDataState _self;
  final $Res Function(_MasterDataState) _then;

/// Create a copy of MasterDataState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ministries = null,Object? agencies = null,Object? isLoadingMinistries = null,Object? isLoadingAgencies = null,Object? isSuccess = null,Object? isError = null,Object? error = freezed,}) {
  return _then(_MasterDataState(
ministries: null == ministries ? _self._ministries : ministries // ignore: cast_nullable_to_non_nullable
as List<Ministry>,agencies: null == agencies ? _self._agencies : agencies // ignore: cast_nullable_to_non_nullable
as List<AgencyWithMinistry>,isLoadingMinistries: null == isLoadingMinistries ? _self.isLoadingMinistries : isLoadingMinistries // ignore: cast_nullable_to_non_nullable
as bool,isLoadingAgencies: null == isLoadingAgencies ? _self.isLoadingAgencies : isLoadingAgencies // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,isError: null == isError ? _self.isError : isError // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
