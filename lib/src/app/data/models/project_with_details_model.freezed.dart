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

 String get code; ProjectStatus get status; int get agencyId; String get agencyName; int get ministryId; String get ministryName; int get stateId; String get stateName; int get zoneId; String get zoneName; String get title; double get amount; String get constituency; String? get sponsor; String get createdBy; String? get createdByName; String? get modifiedBy; String? get modifiedByName; DateTime? get startDate; DateTime? get endDate; DateTime get createdAt; DateTime get updatedAt; bool get isSynced; DateTime? get lastSyncedAt; String? get remoteId;
/// Create a copy of ProjectWithDetailsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectWithDetailsModelCopyWith<ProjectWithDetailsModel> get copyWith => _$ProjectWithDetailsModelCopyWithImpl<ProjectWithDetailsModel>(this as ProjectWithDetailsModel, _$identity);

  /// Serializes this ProjectWithDetailsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectWithDetailsModel&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.agencyName, agencyName) || other.agencyName == agencyName)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.ministryName, ministryName) || other.ministryName == ministryName)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.stateName, stateName) || other.stateName == stateName)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.modifiedByName, modifiedByName) || other.modifiedByName == modifiedByName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,code,status,agencyId,agencyName,ministryId,ministryName,stateId,stateName,zoneId,zoneName,title,amount,constituency,sponsor,createdBy,createdByName,modifiedBy,modifiedByName,startDate,endDate,createdAt,updatedAt,isSynced,lastSyncedAt,remoteId]);

@override
String toString() {
  return 'ProjectWithDetailsModel(code: $code, status: $status, agencyId: $agencyId, agencyName: $agencyName, ministryId: $ministryId, ministryName: $ministryName, stateId: $stateId, stateName: $stateName, zoneId: $zoneId, zoneName: $zoneName, title: $title, amount: $amount, constituency: $constituency, sponsor: $sponsor, createdBy: $createdBy, createdByName: $createdByName, modifiedBy: $modifiedBy, modifiedByName: $modifiedByName, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId)';
}


}

/// @nodoc
abstract mixin class $ProjectWithDetailsModelCopyWith<$Res>  {
  factory $ProjectWithDetailsModelCopyWith(ProjectWithDetailsModel value, $Res Function(ProjectWithDetailsModel) _then) = _$ProjectWithDetailsModelCopyWithImpl;
@useResult
$Res call({
 String code, ProjectStatus status, int agencyId, String agencyName, int ministryId, String ministryName, int stateId, String stateName, int zoneId, String zoneName, String title, double amount, String constituency, String? sponsor, String createdBy, String? createdByName, String? modifiedBy, String? modifiedByName, DateTime? startDate, DateTime? endDate, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? lastSyncedAt, String? remoteId
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
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? status = null,Object? agencyId = null,Object? agencyName = null,Object? ministryId = null,Object? ministryName = null,Object? stateId = null,Object? stateName = null,Object? zoneId = null,Object? zoneName = null,Object? title = null,Object? amount = null,Object? constituency = null,Object? sponsor = freezed,Object? createdBy = null,Object? createdByName = freezed,Object? modifiedBy = freezed,Object? modifiedByName = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? lastSyncedAt = freezed,Object? remoteId = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as int,agencyName: null == agencyName ? _self.agencyName : agencyName // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as int,ministryName: null == ministryName ? _self.ministryName : ministryName // ignore: cast_nullable_to_non_nullable
as String,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int,stateName: null == stateName ? _self.stateName : stateName // ignore: cast_nullable_to_non_nullable
as String,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as int,zoneName: null == zoneName ? _self.zoneName : zoneName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdByName: freezed == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedByName: freezed == modifiedByName ? _self.modifiedByName : modifiedByName // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  ProjectStatus status,  int agencyId,  String agencyName,  int ministryId,  String ministryName,  int stateId,  String stateName,  int zoneId,  String zoneName,  String title,  double amount,  String constituency,  String? sponsor,  String createdBy,  String? createdByName,  String? modifiedBy,  String? modifiedByName,  DateTime? startDate,  DateTime? endDate,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? lastSyncedAt,  String? remoteId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectWithDetailsModel() when $default != null:
return $default(_that.code,_that.status,_that.agencyId,_that.agencyName,_that.ministryId,_that.ministryName,_that.stateId,_that.stateName,_that.zoneId,_that.zoneName,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.createdByName,_that.modifiedBy,_that.modifiedByName,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt,_that.isSynced,_that.lastSyncedAt,_that.remoteId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  ProjectStatus status,  int agencyId,  String agencyName,  int ministryId,  String ministryName,  int stateId,  String stateName,  int zoneId,  String zoneName,  String title,  double amount,  String constituency,  String? sponsor,  String createdBy,  String? createdByName,  String? modifiedBy,  String? modifiedByName,  DateTime? startDate,  DateTime? endDate,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? lastSyncedAt,  String? remoteId)  $default,) {final _that = this;
switch (_that) {
case _ProjectWithDetailsModel():
return $default(_that.code,_that.status,_that.agencyId,_that.agencyName,_that.ministryId,_that.ministryName,_that.stateId,_that.stateName,_that.zoneId,_that.zoneName,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.createdByName,_that.modifiedBy,_that.modifiedByName,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt,_that.isSynced,_that.lastSyncedAt,_that.remoteId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  ProjectStatus status,  int agencyId,  String agencyName,  int ministryId,  String ministryName,  int stateId,  String stateName,  int zoneId,  String zoneName,  String title,  double amount,  String constituency,  String? sponsor,  String createdBy,  String? createdByName,  String? modifiedBy,  String? modifiedByName,  DateTime? startDate,  DateTime? endDate,  DateTime createdAt,  DateTime updatedAt,  bool isSynced,  DateTime? lastSyncedAt,  String? remoteId)?  $default,) {final _that = this;
switch (_that) {
case _ProjectWithDetailsModel() when $default != null:
return $default(_that.code,_that.status,_that.agencyId,_that.agencyName,_that.ministryId,_that.ministryName,_that.stateId,_that.stateName,_that.zoneId,_that.zoneName,_that.title,_that.amount,_that.constituency,_that.sponsor,_that.createdBy,_that.createdByName,_that.modifiedBy,_that.modifiedByName,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt,_that.isSynced,_that.lastSyncedAt,_that.remoteId);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ProjectWithDetailsModel extends ProjectWithDetailsModel {
  const _ProjectWithDetailsModel({required this.code, required this.status, required this.agencyId, required this.agencyName, required this.ministryId, required this.ministryName, required this.stateId, required this.stateName, required this.zoneId, required this.zoneName, required this.title, required this.amount, required this.constituency, this.sponsor, required this.createdBy, this.createdByName, this.modifiedBy, this.modifiedByName, this.startDate, this.endDate, required this.createdAt, required this.updatedAt, this.isSynced = false, this.lastSyncedAt, this.remoteId}): super._();
  factory _ProjectWithDetailsModel.fromJson(Map<String, dynamic> json) => _$ProjectWithDetailsModelFromJson(json);

@override final  String code;
@override final  ProjectStatus status;
@override final  int agencyId;
@override final  String agencyName;
@override final  int ministryId;
@override final  String ministryName;
@override final  int stateId;
@override final  String stateName;
@override final  int zoneId;
@override final  String zoneName;
@override final  String title;
@override final  double amount;
@override final  String constituency;
@override final  String? sponsor;
@override final  String createdBy;
@override final  String? createdByName;
@override final  String? modifiedBy;
@override final  String? modifiedByName;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectWithDetailsModel&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.agencyId, agencyId) || other.agencyId == agencyId)&&(identical(other.agencyName, agencyName) || other.agencyName == agencyName)&&(identical(other.ministryId, ministryId) || other.ministryId == ministryId)&&(identical(other.ministryName, ministryName) || other.ministryName == ministryName)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.stateName, stateName) || other.stateName == stateName)&&(identical(other.zoneId, zoneId) || other.zoneId == zoneId)&&(identical(other.zoneName, zoneName) || other.zoneName == zoneName)&&(identical(other.title, title) || other.title == title)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByName, createdByName) || other.createdByName == createdByName)&&(identical(other.modifiedBy, modifiedBy) || other.modifiedBy == modifiedBy)&&(identical(other.modifiedByName, modifiedByName) || other.modifiedByName == modifiedByName)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.lastSyncedAt, lastSyncedAt) || other.lastSyncedAt == lastSyncedAt)&&(identical(other.remoteId, remoteId) || other.remoteId == remoteId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,code,status,agencyId,agencyName,ministryId,ministryName,stateId,stateName,zoneId,zoneName,title,amount,constituency,sponsor,createdBy,createdByName,modifiedBy,modifiedByName,startDate,endDate,createdAt,updatedAt,isSynced,lastSyncedAt,remoteId]);

@override
String toString() {
  return 'ProjectWithDetailsModel(code: $code, status: $status, agencyId: $agencyId, agencyName: $agencyName, ministryId: $ministryId, ministryName: $ministryName, stateId: $stateId, stateName: $stateName, zoneId: $zoneId, zoneName: $zoneName, title: $title, amount: $amount, constituency: $constituency, sponsor: $sponsor, createdBy: $createdBy, createdByName: $createdByName, modifiedBy: $modifiedBy, modifiedByName: $modifiedByName, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, isSynced: $isSynced, lastSyncedAt: $lastSyncedAt, remoteId: $remoteId)';
}


}

/// @nodoc
abstract mixin class _$ProjectWithDetailsModelCopyWith<$Res> implements $ProjectWithDetailsModelCopyWith<$Res> {
  factory _$ProjectWithDetailsModelCopyWith(_ProjectWithDetailsModel value, $Res Function(_ProjectWithDetailsModel) _then) = __$ProjectWithDetailsModelCopyWithImpl;
@override @useResult
$Res call({
 String code, ProjectStatus status, int agencyId, String agencyName, int ministryId, String ministryName, int stateId, String stateName, int zoneId, String zoneName, String title, double amount, String constituency, String? sponsor, String createdBy, String? createdByName, String? modifiedBy, String? modifiedByName, DateTime? startDate, DateTime? endDate, DateTime createdAt, DateTime updatedAt, bool isSynced, DateTime? lastSyncedAt, String? remoteId
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
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? status = null,Object? agencyId = null,Object? agencyName = null,Object? ministryId = null,Object? ministryName = null,Object? stateId = null,Object? stateName = null,Object? zoneId = null,Object? zoneName = null,Object? title = null,Object? amount = null,Object? constituency = null,Object? sponsor = freezed,Object? createdBy = null,Object? createdByName = freezed,Object? modifiedBy = freezed,Object? modifiedByName = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isSynced = null,Object? lastSyncedAt = freezed,Object? remoteId = freezed,}) {
  return _then(_ProjectWithDetailsModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,agencyId: null == agencyId ? _self.agencyId : agencyId // ignore: cast_nullable_to_non_nullable
as int,agencyName: null == agencyName ? _self.agencyName : agencyName // ignore: cast_nullable_to_non_nullable
as String,ministryId: null == ministryId ? _self.ministryId : ministryId // ignore: cast_nullable_to_non_nullable
as int,ministryName: null == ministryName ? _self.ministryName : ministryName // ignore: cast_nullable_to_non_nullable
as String,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as int,stateName: null == stateName ? _self.stateName : stateName // ignore: cast_nullable_to_non_nullable
as String,zoneId: null == zoneId ? _self.zoneId : zoneId // ignore: cast_nullable_to_non_nullable
as int,zoneName: null == zoneName ? _self.zoneName : zoneName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as String,sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String?,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String,createdByName: freezed == createdByName ? _self.createdByName : createdByName // ignore: cast_nullable_to_non_nullable
as String?,modifiedBy: freezed == modifiedBy ? _self.modifiedBy : modifiedBy // ignore: cast_nullable_to_non_nullable
as String?,modifiedByName: freezed == modifiedByName ? _self.modifiedByName : modifiedByName // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,lastSyncedAt: freezed == lastSyncedAt ? _self.lastSyncedAt : lastSyncedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,remoteId: freezed == remoteId ? _self.remoteId : remoteId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
