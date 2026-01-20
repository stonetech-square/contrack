// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency_with_ministry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AgencyWithMinistry {

 Agency get agency; Ministry get ministry;
/// Create a copy of AgencyWithMinistry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AgencyWithMinistryCopyWith<AgencyWithMinistry> get copyWith => _$AgencyWithMinistryCopyWithImpl<AgencyWithMinistry>(this as AgencyWithMinistry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AgencyWithMinistry&&const DeepCollectionEquality().equals(other.agency, agency)&&const DeepCollectionEquality().equals(other.ministry, ministry));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(agency),const DeepCollectionEquality().hash(ministry));

@override
String toString() {
  return 'AgencyWithMinistry(agency: $agency, ministry: $ministry)';
}


}

/// @nodoc
abstract mixin class $AgencyWithMinistryCopyWith<$Res>  {
  factory $AgencyWithMinistryCopyWith(AgencyWithMinistry value, $Res Function(AgencyWithMinistry) _then) = _$AgencyWithMinistryCopyWithImpl;
@useResult
$Res call({
 Agency agency, Ministry ministry
});




}
/// @nodoc
class _$AgencyWithMinistryCopyWithImpl<$Res>
    implements $AgencyWithMinistryCopyWith<$Res> {
  _$AgencyWithMinistryCopyWithImpl(this._self, this._then);

  final AgencyWithMinistry _self;
  final $Res Function(AgencyWithMinistry) _then;

/// Create a copy of AgencyWithMinistry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? agency = freezed,Object? ministry = freezed,}) {
  return _then(_self.copyWith(
agency: freezed == agency ? _self.agency : agency // ignore: cast_nullable_to_non_nullable
as Agency,ministry: freezed == ministry ? _self.ministry : ministry // ignore: cast_nullable_to_non_nullable
as Ministry,
  ));
}

}


/// Adds pattern-matching-related methods to [AgencyWithMinistry].
extension AgencyWithMinistryPatterns on AgencyWithMinistry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AgencyWithMinistry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AgencyWithMinistry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AgencyWithMinistry value)  $default,){
final _that = this;
switch (_that) {
case _AgencyWithMinistry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AgencyWithMinistry value)?  $default,){
final _that = this;
switch (_that) {
case _AgencyWithMinistry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Agency agency,  Ministry ministry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AgencyWithMinistry() when $default != null:
return $default(_that.agency,_that.ministry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Agency agency,  Ministry ministry)  $default,) {final _that = this;
switch (_that) {
case _AgencyWithMinistry():
return $default(_that.agency,_that.ministry);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Agency agency,  Ministry ministry)?  $default,) {final _that = this;
switch (_that) {
case _AgencyWithMinistry() when $default != null:
return $default(_that.agency,_that.ministry);case _:
  return null;

}
}

}

/// @nodoc


class _AgencyWithMinistry implements AgencyWithMinistry {
  const _AgencyWithMinistry({required this.agency, required this.ministry});
  

@override final  Agency agency;
@override final  Ministry ministry;

/// Create a copy of AgencyWithMinistry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AgencyWithMinistryCopyWith<_AgencyWithMinistry> get copyWith => __$AgencyWithMinistryCopyWithImpl<_AgencyWithMinistry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AgencyWithMinistry&&const DeepCollectionEquality().equals(other.agency, agency)&&const DeepCollectionEquality().equals(other.ministry, ministry));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(agency),const DeepCollectionEquality().hash(ministry));

@override
String toString() {
  return 'AgencyWithMinistry(agency: $agency, ministry: $ministry)';
}


}

/// @nodoc
abstract mixin class _$AgencyWithMinistryCopyWith<$Res> implements $AgencyWithMinistryCopyWith<$Res> {
  factory _$AgencyWithMinistryCopyWith(_AgencyWithMinistry value, $Res Function(_AgencyWithMinistry) _then) = __$AgencyWithMinistryCopyWithImpl;
@override @useResult
$Res call({
 Agency agency, Ministry ministry
});




}
/// @nodoc
class __$AgencyWithMinistryCopyWithImpl<$Res>
    implements _$AgencyWithMinistryCopyWith<$Res> {
  __$AgencyWithMinistryCopyWithImpl(this._self, this._then);

  final _AgencyWithMinistry _self;
  final $Res Function(_AgencyWithMinistry) _then;

/// Create a copy of AgencyWithMinistry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? agency = freezed,Object? ministry = freezed,}) {
  return _then(_AgencyWithMinistry(
agency: freezed == agency ? _self.agency : agency // ignore: cast_nullable_to_non_nullable
as Agency,ministry: freezed == ministry ? _self.ministry : ministry // ignore: cast_nullable_to_non_nullable
as Ministry,
  ));
}


}

// dart format on
