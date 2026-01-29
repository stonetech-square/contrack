// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed_ministry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeedMinistryModel {

 String get id; String get name; String get code; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SeedMinistryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedMinistryModelCopyWith<SeedMinistryModel> get copyWith => _$SeedMinistryModelCopyWithImpl<SeedMinistryModel>(this as SeedMinistryModel, _$identity);

  /// Serializes this SeedMinistryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedMinistryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,createdAt,updatedAt);

@override
String toString() {
  return 'SeedMinistryModel(id: $id, name: $name, code: $code, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SeedMinistryModelCopyWith<$Res>  {
  factory $SeedMinistryModelCopyWith(SeedMinistryModel value, $Res Function(SeedMinistryModel) _then) = _$SeedMinistryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SeedMinistryModelCopyWithImpl<$Res>
    implements $SeedMinistryModelCopyWith<$Res> {
  _$SeedMinistryModelCopyWithImpl(this._self, this._then);

  final SeedMinistryModel _self;
  final $Res Function(SeedMinistryModel) _then;

/// Create a copy of SeedMinistryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedMinistryModel].
extension SeedMinistryModelPatterns on SeedMinistryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedMinistryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedMinistryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedMinistryModel value)  $default,){
final _that = this;
switch (_that) {
case _SeedMinistryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedMinistryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeedMinistryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedMinistryModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SeedMinistryModel():
return $default(_that.id,_that.name,_that.code,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SeedMinistryModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SeedMinistryModel implements SeedMinistryModel {
  const _SeedMinistryModel({required this.id, required this.name, required this.code, required this.createdAt, required this.updatedAt});
  factory _SeedMinistryModel.fromJson(Map<String, dynamic> json) => _$SeedMinistryModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SeedMinistryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedMinistryModelCopyWith<_SeedMinistryModel> get copyWith => __$SeedMinistryModelCopyWithImpl<_SeedMinistryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedMinistryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedMinistryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,createdAt,updatedAt);

@override
String toString() {
  return 'SeedMinistryModel(id: $id, name: $name, code: $code, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SeedMinistryModelCopyWith<$Res> implements $SeedMinistryModelCopyWith<$Res> {
  factory _$SeedMinistryModelCopyWith(_SeedMinistryModel value, $Res Function(_SeedMinistryModel) _then) = __$SeedMinistryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SeedMinistryModelCopyWithImpl<$Res>
    implements _$SeedMinistryModelCopyWith<$Res> {
  __$SeedMinistryModelCopyWithImpl(this._self, this._then);

  final _SeedMinistryModel _self;
  final $Res Function(_SeedMinistryModel) _then;

/// Create a copy of SeedMinistryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SeedMinistryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
