// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed_agency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeedAgencyModel {

 String get id; String get name; String get code; String get ministryId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SeedAgencyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedAgencyModelCopyWith<SeedAgencyModel> get copyWith => _$SeedAgencyModelCopyWithImpl<SeedAgencyModel>(this as SeedAgencyModel, _$identity);

  /// Serializes this SeedAgencyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedAgencyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,ministryId,createdAt,updatedAt);

@override
String toString() {
  return 'SeedAgencyModel(id: $id, name: $name, code: $code, ministryId: $ministryId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SeedAgencyModelCopyWith<$Res>  {
  factory $SeedAgencyModelCopyWith(SeedAgencyModel value, $Res Function(SeedAgencyModel) _then) = _$SeedAgencyModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, String ministryId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SeedAgencyModelCopyWithImpl<$Res>
    implements $SeedAgencyModelCopyWith<$Res> {
  _$SeedAgencyModelCopyWithImpl(this._self, this._then);

  final SeedAgencyModel _self;
  final $Res Function(SeedAgencyModel) _then;

/// Create a copy of SeedAgencyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? ministryId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedAgencyModel].
extension SeedAgencyModelPatterns on SeedAgencyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedAgencyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedAgencyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedAgencyModel value)  $default,){
final _that = this;
switch (_that) {
case _SeedAgencyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedAgencyModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeedAgencyModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String ministryId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedAgencyModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.ministryId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String ministryId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SeedAgencyModel():
return $default(_that.id,_that.name,_that.code,_that.ministryId,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  String ministryId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SeedAgencyModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.ministryId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SeedAgencyModel implements SeedAgencyModel {
  const _SeedAgencyModel({required this.id, required this.name, required this.code, required this.ministryId, required this.createdAt, required this.updatedAt});
  factory _SeedAgencyModel.fromJson(Map<String, dynamic> json) => _$SeedAgencyModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  String ministryId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SeedAgencyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedAgencyModelCopyWith<_SeedAgencyModel> get copyWith => __$SeedAgencyModelCopyWithImpl<_SeedAgencyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedAgencyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedAgencyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,ministryId,createdAt,updatedAt);

@override
String toString() {
  return 'SeedAgencyModel(id: $id, name: $name, code: $code, ministryId: $ministryId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SeedAgencyModelCopyWith<$Res> implements $SeedAgencyModelCopyWith<$Res> {
  factory _$SeedAgencyModelCopyWith(_SeedAgencyModel value, $Res Function(_SeedAgencyModel) _then) = __$SeedAgencyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, String ministryId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SeedAgencyModelCopyWithImpl<$Res>
    implements _$SeedAgencyModelCopyWith<$Res> {
  __$SeedAgencyModelCopyWithImpl(this._self, this._then);

  final _SeedAgencyModel _self;
  final $Res Function(_SeedAgencyModel) _then;

/// Create a copy of SeedAgencyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? ministryId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SeedAgencyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
