// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ministry_with_agency.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MinistryWithAgency {

 Ministry get ministry; Agency get agency;
/// Create a copy of MinistryWithAgency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MinistryWithAgencyCopyWith<MinistryWithAgency> get copyWith => _$MinistryWithAgencyCopyWithImpl<MinistryWithAgency>(this as MinistryWithAgency, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MinistryWithAgency&&const DeepCollectionEquality().equals(other.ministry, ministry)&&const DeepCollectionEquality().equals(other.agency, agency));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ministry),const DeepCollectionEquality().hash(agency));

@override
String toString() {
  return 'MinistryWithAgency(ministry: $ministry, agency: $agency)';
}


}

/// @nodoc
abstract mixin class $MinistryWithAgencyCopyWith<$Res>  {
  factory $MinistryWithAgencyCopyWith(MinistryWithAgency value, $Res Function(MinistryWithAgency) _then) = _$MinistryWithAgencyCopyWithImpl;
@useResult
$Res call({
 Ministry ministry, Agency agency
});




}
/// @nodoc
class _$MinistryWithAgencyCopyWithImpl<$Res>
    implements $MinistryWithAgencyCopyWith<$Res> {
  _$MinistryWithAgencyCopyWithImpl(this._self, this._then);

  final MinistryWithAgency _self;
  final $Res Function(MinistryWithAgency) _then;

/// Create a copy of MinistryWithAgency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ministry = freezed,Object? agency = freezed,}) {
  return _then(_self.copyWith(
ministry: freezed == ministry ? _self.ministry : ministry // ignore: cast_nullable_to_non_nullable
as Ministry,agency: freezed == agency ? _self.agency : agency // ignore: cast_nullable_to_non_nullable
as Agency,
  ));
}

}


/// Adds pattern-matching-related methods to [MinistryWithAgency].
extension MinistryWithAgencyPatterns on MinistryWithAgency {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MinistryWithAgency value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MinistryWithAgency() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MinistryWithAgency value)  $default,){
final _that = this;
switch (_that) {
case _MinistryWithAgency():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MinistryWithAgency value)?  $default,){
final _that = this;
switch (_that) {
case _MinistryWithAgency() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Ministry ministry,  Agency agency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MinistryWithAgency() when $default != null:
return $default(_that.ministry,_that.agency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Ministry ministry,  Agency agency)  $default,) {final _that = this;
switch (_that) {
case _MinistryWithAgency():
return $default(_that.ministry,_that.agency);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Ministry ministry,  Agency agency)?  $default,) {final _that = this;
switch (_that) {
case _MinistryWithAgency() when $default != null:
return $default(_that.ministry,_that.agency);case _:
  return null;

}
}

}

/// @nodoc


class _MinistryWithAgency implements MinistryWithAgency {
  const _MinistryWithAgency({required this.ministry, required this.agency});
  

@override final  Ministry ministry;
@override final  Agency agency;

/// Create a copy of MinistryWithAgency
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MinistryWithAgencyCopyWith<_MinistryWithAgency> get copyWith => __$MinistryWithAgencyCopyWithImpl<_MinistryWithAgency>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MinistryWithAgency&&const DeepCollectionEquality().equals(other.ministry, ministry)&&const DeepCollectionEquality().equals(other.agency, agency));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ministry),const DeepCollectionEquality().hash(agency));

@override
String toString() {
  return 'MinistryWithAgency(ministry: $ministry, agency: $agency)';
}


}

/// @nodoc
abstract mixin class _$MinistryWithAgencyCopyWith<$Res> implements $MinistryWithAgencyCopyWith<$Res> {
  factory _$MinistryWithAgencyCopyWith(_MinistryWithAgency value, $Res Function(_MinistryWithAgency) _then) = __$MinistryWithAgencyCopyWithImpl;
@override @useResult
$Res call({
 Ministry ministry, Agency agency
});




}
/// @nodoc
class __$MinistryWithAgencyCopyWithImpl<$Res>
    implements _$MinistryWithAgencyCopyWith<$Res> {
  __$MinistryWithAgencyCopyWithImpl(this._self, this._then);

  final _MinistryWithAgency _self;
  final $Res Function(_MinistryWithAgency) _then;

/// Create a copy of MinistryWithAgency
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ministry = freezed,Object? agency = freezed,}) {
  return _then(_MinistryWithAgency(
ministry: freezed == ministry ? _self.ministry : ministry // ignore: cast_nullable_to_non_nullable
as Ministry,agency: freezed == agency ? _self.agency : agency // ignore: cast_nullable_to_non_nullable
as Agency,
  ));
}


}

// dart format on
