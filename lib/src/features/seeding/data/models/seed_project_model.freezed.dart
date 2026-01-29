// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seed_project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeedProjectModel {

 String get id; String get code; ProjectStatus get status; String get agencyId; String get ministryId; String get stateId; String get zoneId; String get title; double get amount; String get constituency; String? get sponsor; String get createdBy; String? get modifiedBy; DateTime? get startDate; DateTime? get endDate; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of SeedProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeedProjectModelCopyWith<SeedProjectModel> get copyWith => _$SeedProjectModelCopyWithImpl<SeedProjectModel>(this as SeedProjectModel, _$identity);

  /// Serializes this SeedProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeedProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,status,agencyId,ministryId,stateId,zoneId,title,amount,constituency,sponsor,createdBy,modifiedBy,startDate,endDate,createdAt,updatedAt);

@override
String toString() {
  return 'SeedProjectModel(id: $id, code: $code, status: $status, agencyId: $agencyId, ministryId: $ministryId, stateId: $stateId, zoneId: $zoneId, title: $title, amount: $amount, constituency: $constituency, sponsor: $sponsor, createdBy: $createdBy, modifiedBy: $modifiedBy, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SeedProjectModelCopyWith<$Res>  {
  factory $SeedProjectModelCopyWith(SeedProjectModel value, $Res Function(SeedProjectModel) _then) = _$SeedProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String code, ProjectStatus status, String agencyId, String ministryId, String stateId, String zoneId, String title, double amount, String constituency, String? sponsor, String createdBy, String? modifiedBy, DateTime? startDate, DateTime? endDate, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$SeedProjectModelCopyWithImpl<$Res>
    implements $SeedProjectModelCopyWith<$Res> {
  _$SeedProjectModelCopyWithImpl(this._self, this._then);

  final SeedProjectModel _self;
  final $Res Function(SeedProjectModel) _then;

/// Create a copy of SeedProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? status = null,Object? agencyId = null,Object? ministryId = null,Object? stateId = null,Object? zoneId = null,Object? title = null,Object? amount = null,Object? constituency = null,Object? sponsor = freezed,Object? createdBy = null,Object? modifiedBy = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as String,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as String,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SeedProjectModel].
extension SeedProjectModelPatterns on SeedProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeedProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeedProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeedProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _SeedProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeedProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeedProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  ProjectStatus status,  String agencyId,  String ministryId,  String stateId,  String zoneId,  String title,  double amount,  String constituency,  String? sponsor,  String createdBy,  String? modifiedBy,  DateTime? startDate,  DateTime? endDate,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeedProjectModel() when $default != null:
return $default(_that.id,_that.code,_that.status,_that.agencyId,_that.ministryId,_that.stateId,_that.zoneId,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.modifiedBy,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  ProjectStatus status,  String agencyId,  String ministryId,  String stateId,  String zoneId,  String title,  double amount,  String constituency,  String? sponsor,  String createdBy,  String? modifiedBy,  DateTime? startDate,  DateTime? endDate,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SeedProjectModel():
return $default(_that.id,_that.code,_that.status,_that.agencyId,_that.ministryId,_that.stateId,_that.zoneId,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.modifiedBy,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  ProjectStatus status,  String agencyId,  String ministryId,  String stateId,  String zoneId,  String title,  double amount,  String constituency,  String? sponsor,  String createdBy,  String? modifiedBy,  DateTime? startDate,  DateTime? endDate,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SeedProjectModel() when $default != null:
return $default(_that.id,_that.code,_that.status,_that.agencyId,_that.ministryId,_that.stateId,_that.zoneId,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.modifiedBy,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _SeedProjectModel implements SeedProjectModel {
  const _SeedProjectModel({required this.id, required this.code, required this.status, required this.agencyId, required this.ministryId, required this.stateId, required this.zoneId, required this.title, required this.amount, required this.constituency, this.sponsor, required this.createdBy, this.modifiedBy, this.startDate, this.endDate, required this.createdAt, required this.updatedAt});
  factory _SeedProjectModel.fromJson(Map<String, dynamic> json) => _$SeedProjectModelFromJson(json);

@override final  String id;
@override final  String code;
@override final  ProjectStatus status;
@override final  String agencyId;
@override final  String ministryId;
@override final  String stateId;
@override final  String zoneId;
@override final  String title;
@override final  double amount;
@override final  String constituency;
@override final  String? sponsor;
@override final  String createdBy;
@override final  String? modifiedBy;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of SeedProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeedProjectModelCopyWith<_SeedProjectModel> get copyWith => __$SeedProjectModelCopyWithImpl<_SeedProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeedProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeedProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,status,agencyId,ministryId,stateId,zoneId,title,amount,constituency,sponsor,createdBy,modifiedBy,startDate,endDate,createdAt,updatedAt);

@override
String toString() {
  return 'SeedProjectModel(id: $id, code: $code, status: $status, agencyId: $agencyId, ministryId: $ministryId, stateId: $stateId, zoneId: $zoneId, title: $title, amount: $amount, constituency: $constituency, sponsor: $sponsor, createdBy: $createdBy, modifiedBy: $modifiedBy, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SeedProjectModelCopyWith<$Res> implements $SeedProjectModelCopyWith<$Res> {
  factory _$SeedProjectModelCopyWith(_SeedProjectModel value, $Res Function(_SeedProjectModel) _then) = __$SeedProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, ProjectStatus status, String agencyId, String ministryId, String stateId, String zoneId, String title, double amount, String constituency, String? sponsor, String createdBy, String? modifiedBy, DateTime? startDate, DateTime? endDate, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$SeedProjectModelCopyWithImpl<$Res>
    implements _$SeedProjectModelCopyWith<$Res> {
  __$SeedProjectModelCopyWithImpl(this._self, this._then);

  final _SeedProjectModel _self;
  final $Res Function(_SeedProjectModel) _then;

/// Create a copy of SeedProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? status = null,Object? agencyId = null,Object? ministryId = null,Object? stateId = null,Object? zoneId = null,Object? title = null,Object? amount = null,Object? constituency = null,Object? sponsor = freezed,Object? createdBy = null,Object? modifiedBy = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_SeedProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as String,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as String,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
