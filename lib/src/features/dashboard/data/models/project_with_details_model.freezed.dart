// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_with_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectWithDetailsModel {

 int get id; String get code; ProjectStatus get status; int get agencyId; String get agencyName; int get ministryId; int get stateId; String get stateName; int get zoneId; String get title; double get amount; String get constituency; String? get sponsor; int get createdBy; int? get modifiedBy; DateTime get createdAt; DateTime get updatedAt; bool get isSynced; DateTime? get lastSyncedAt; String? get remoteId;
/// Create a copy of ProjectWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectWithDetailsModelCopyWith<ProjectWithDetailsModel> get copyWith => _$ProjectWithDetailsModelCopyWithImpl<ProjectWithDetailsModel>(this as ProjectWithDetailsModel, _$identity);

  /// Serializes this ProjectWithDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectWithDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.agencyName, agencyName) || other.agencyName == agencyName)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.stateName, stateName) || other.stateName == stateName)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,code,status,agencyId,agencyName,ministryId,stateId,stateName,zoneId,title,amount,constituency,sponsor,createdBy,modifiedBy,createdAt,updatedAt,isSynced,lastSyncedAt,remoteId]);

@override
String toString() {
  return 'ProjectWithDetailsModel(id: $id, code: $code, status: $status, agencyId: $agencyId, agencyName: $agencyName, ministryId: $ministryId, stateId: $stateId, stateName: $stateName, zoneId: $zoneId, title: $title, amount: $amount, constituency: $constituency, sponsor: $sponsor, createdBy: $createdBy, modifiedBy: $modifiedBy, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId)';
}


}

/// @nodoc
abstract mixin class $ProjectWithDetailsModelCopyWith<$Res>  {
  factory $ProjectWithDetailsModelCopyWith(ProjectWithDetailsModel value, $Res Function(ProjectWithDetailsModel) _then) = _$ProjectWithDetailsModelCopyWithImpl;
@useResult
$Res call({
 int id, String code, ProjectStatus status, int agencyId, String agencyName, int ministryId, int stateId, String stateName, int zoneId, String title, double amount, String constituency, String? sponsor, int createdBy, int? modifiedBy, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? lastSyncedAt, String? remoteId
});




}
/// @nodoc
class _$ProjectWithDetailsModelCopyWithImpl<$Res>
    implements $ProjectWithDetailsModelCopyWith<$Res> {
  _$ProjectWithDetailsModelCopyWithImpl(this._self, this._then);

  final ProjectWithDetailsModel _self;
  final $Res Function(ProjectWithDetailsModel) _then;

/// Create a copy of ProjectWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? status = null,Object? agencyId = null,Object? agencyName = null,Object? ministryId = null,Object? stateId = null,Object? stateName = null,Object? zoneId = null,Object? title = null,Object? amount = null,Object? constituency = null,Object? sponsor = freezed,Object? createdBy = null,Object? modifiedBy = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? lastSyncedAt = freezed,Object? remoteId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as int,agencyName: null == agencyName ? _self.agencyName : agencyName // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as int,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int,stateName: null == stateName ? _self.stateName : stateName // ignore: cast_nullable_to_non_nullable
as String,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectWithDetailsModel].
extension ProjectWithDetailsModelPatterns on ProjectWithDetailsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectWithDetailsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectWithDetailsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectWithDetailsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectWithDetailsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectWithDetailsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectWithDetailsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  ProjectStatus status,  int agencyId,  String agencyName,  int ministryId,  int stateId,  String stateName,  int zoneId,  String title,  double amount,  String constituency,  String? sponsor,  int createdBy,  int? modifiedBy,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? lastSyncedAt,  String? remoteId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectWithDetailsModel() when $default != null:
return $default(_that.id,_that.code,_that.status,_that.agencyId,_that.agencyName,_that.ministryId,_that.stateId,_that.stateName,_that.zoneId,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.modifiedBy,_that.createdAt,_that.updatedAt,_that.isSynced,_that.lastSyncedAt,_that.remoteId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  ProjectStatus status,  int agencyId,  String agencyName,  int ministryId,  int stateId,  String stateName,  int zoneId,  String title,  double amount,  String constituency,  String? sponsor,  int createdBy,  int? modifiedBy,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? lastSyncedAt,  String? remoteId)  $default,) {final _that = this;
switch (_that) {
case _ProjectWithDetailsModel():
return $default(_that.id,_that.code,_that.status,_that.agencyId,_that.agencyName,_that.ministryId,_that.stateId,_that.stateName,_that.zoneId,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.modifiedBy,_that.createdAt,_that.updatedAt,_that.isSynced,_that.lastSyncedAt,_that.remoteId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  ProjectStatus status,  int agencyId,  String agencyName,  int ministryId,  int stateId,  String stateName,  int zoneId,  String title,  double amount,  String constituency,  String? sponsor,  int createdBy,  int? modifiedBy,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? lastSyncedAt,  String? remoteId)?  $default,) {final _that = this;
switch (_that) {
case _ProjectWithDetailsModel() when $default != null:
return $default(_that.id,_that.code,_that.status,_that.agencyId,_that.agencyName,_that.ministryId,_that.stateId,_that.stateName,_that.zoneId,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.modifiedBy,_that.createdAt,_that.updatedAt,_that.isSynced,_that.lastSyncedAt,_that.remoteId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ProjectWithDetailsModel extends ProjectWithDetailsModel {
  const _ProjectWithDetailsModel({required this.id, required this.code, required this.status, required this.agencyId, required this.agencyName, required this.ministryId, required this.stateId, required this.stateName, required this.zoneId, required this.title, required this.amount, required this.constituency, this.sponsor, required this.createdBy, this.modifiedBy, required this.createdAt, required this.updatedAt, this.isSynced = false, this.lastSyncedAt, this.remoteId}): super._();
  factory _ProjectWithDetailsModel.fromJson(Map<String, dynamic> json) => _$ProjectWithDetailsModelFromJson(json);

@override final  int id;
@override final  String code;
@override final  ProjectStatus status;
@override final  int agencyId;
@override final  String agencyName;
@override final  int ministryId;
@override final  int stateId;
@override final  String stateName;
@override final  int zoneId;
@override final  String title;
@override final  double amount;
@override final  String constituency;
@override final  String? sponsor;
@override final  int createdBy;
@override final  int? modifiedBy;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isSynced;
@override final  DateTime? lastSyncedAt;
@override final  String? remoteId;

/// Create a copy of ProjectWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectWithDetailsModelCopyWith<_ProjectWithDetailsModel> get copyWith => __$ProjectWithDetailsModelCopyWithImpl<_ProjectWithDetailsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectWithDetailsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectWithDetailsModel&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.agencyName, agencyName) || other.agencyName == agencyName)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.stateName, stateName) || other.stateName == stateName)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,code,status,agencyId,agencyName,ministryId,stateId,stateName,zoneId,title,amount,constituency,sponsor,createdBy,modifiedBy,createdAt,updatedAt,isSynced,lastSyncedAt,remoteId]);

@override
String toString() {
  return 'ProjectWithDetailsModel(id: $id, code: $code, status: $status, agencyId: $agencyId, agencyName: $agencyName, ministryId: $ministryId, stateId: $stateId, stateName: $stateName, zoneId: $zoneId, title: $title, amount: $amount, constituency: $constituency, sponsor: $sponsor, createdBy: $createdBy, modifiedBy: $modifiedBy, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId)';
}


}

/// @nodoc
abstract mixin class _$ProjectWithDetailsModelCopyWith<$Res> implements $ProjectWithDetailsModelCopyWith<$Res> {
  factory _$ProjectWithDetailsModelCopyWith(_ProjectWithDetailsModel value, $Res Function(_ProjectWithDetailsModel) _then) = __$ProjectWithDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, ProjectStatus status, int agencyId, String agencyName, int ministryId, int stateId, String stateName, int zoneId, String title, double amount, String constituency, String? sponsor, int createdBy, int? modifiedBy, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? lastSyncedAt, String? remoteId
});




}
/// @nodoc
class __$ProjectWithDetailsModelCopyWithImpl<$Res>
    implements _$ProjectWithDetailsModelCopyWith<$Res> {
  __$ProjectWithDetailsModelCopyWithImpl(this._self, this._then);

  final _ProjectWithDetailsModel _self;
  final $Res Function(_ProjectWithDetailsModel) _then;

/// Create a copy of ProjectWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? status = null,Object? agencyId = null,Object? agencyName = null,Object? ministryId = null,Object? stateId = null,Object? stateName = null,Object? zoneId = null,Object? title = null,Object? amount = null,Object? constituency = null,Object? sponsor = freezed,Object? createdBy = null,Object? modifiedBy = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? lastSyncedAt = freezed,Object? remoteId = freezed,}) {
  return _then(_ProjectWithDetailsModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as int,agencyName: null == agencyName ? _self.agencyName : agencyName // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as int,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int,stateName: null == stateName ? _self.stateName : stateName // ignore: cast_nullable_to_non_nullable
as String,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
