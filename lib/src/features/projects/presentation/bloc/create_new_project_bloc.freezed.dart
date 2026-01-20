// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_new_project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectEntryFormData {

 String get code; RequiredProjectStatus get status; RequiredId get supervisingMinistryId; RequiredId get implementingAgencyId; RequiredId get stateId; RequiredId get geopoliticalZoneId; RequiredText get constituency; RequiredText get title; String get sponsor; RequiredDouble get budget; RequiredDate get startDate; RequiredDate get endDate; List<ImplementingAgency> get agencies; List<NigerianState> get states;
/// Create a copy of ProjectEntryFormData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectEntryFormDataCopyWith<ProjectEntryFormData> get copyWith => _$ProjectEntryFormDataCopyWithImpl<ProjectEntryFormData>(this as ProjectEntryFormData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectEntryFormData&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.supervisingMinistryId, supervisingMinistryId) || other.supervisingMinistryId == supervisingMinistryId)&&(identical(other.implementingAgencyId, implementingAgencyId) || other.implementingAgencyId == implementingAgencyId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.geopoliticalZoneId, geopoliticalZoneId) || other.geopoliticalZoneId == geopoliticalZoneId)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.title, title) || other.title == title)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other.agencies, agencies)&&const DeepCollectionEquality().equals(other.states, states));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,supervisingMinistryId,implementingAgencyId,stateId,geopoliticalZoneId,constituency,title,sponsor,budget,startDate,endDate,const DeepCollectionEquality().hash(agencies),const DeepCollectionEquality().hash(states));

@override
String toString() {
  return 'ProjectEntryFormData(code: $code, status: $status, supervisingMinistryId: $supervisingMinistryId, implementingAgencyId: $implementingAgencyId, stateId: $stateId, geopoliticalZoneId: $geopoliticalZoneId, constituency: $constituency, title: $title, sponsor: $sponsor, budget: $budget, startDate: $startDate, endDate: $endDate, agencies: $agencies, states: $states)';
}


}

/// @nodoc
abstract mixin class $ProjectEntryFormDataCopyWith<$Res>  {
  factory $ProjectEntryFormDataCopyWith(ProjectEntryFormData value, $Res Function(ProjectEntryFormData) _then) = _$ProjectEntryFormDataCopyWithImpl;
@useResult
$Res call({
 String code, RequiredProjectStatus status, RequiredId supervisingMinistryId, RequiredId implementingAgencyId, RequiredId stateId, RequiredId geopoliticalZoneId, RequiredText constituency, RequiredText title, String sponsor, RequiredDouble budget, RequiredDate startDate, RequiredDate endDate, List<ImplementingAgency> agencies, List<NigerianState> states
});




}
/// @nodoc
class _$ProjectEntryFormDataCopyWithImpl<$Res>
    implements $ProjectEntryFormDataCopyWith<$Res> {
  _$ProjectEntryFormDataCopyWithImpl(this._self, this._then);

  final ProjectEntryFormData _self;
  final $Res Function(ProjectEntryFormData) _then;

/// Create a copy of ProjectEntryFormData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? status = null,Object? supervisingMinistryId = null,Object? implementingAgencyId = null,Object? stateId = null,Object? geopoliticalZoneId = null,Object? constituency = null,Object? title = null,Object? sponsor = null,Object? budget = null,Object? startDate = null,Object? endDate = null,Object? agencies = null,Object? states = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequiredProjectStatus,supervisingMinistryId: null == supervisingMinistryId ? _self.supervisingMinistryId : supervisingMinistryId // ignore: cast_nullable_to_non_nullable
as RequiredId,implementingAgencyId: null == implementingAgencyId ? _self.implementingAgencyId : implementingAgencyId // ignore: cast_nullable_to_non_nullable
as RequiredId,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as RequiredId,geopoliticalZoneId: null == geopoliticalZoneId ? _self.geopoliticalZoneId : geopoliticalZoneId // ignore: cast_nullable_to_non_nullable
as RequiredId,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as RequiredText,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as RequiredText,sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as RequiredDouble,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as RequiredDate,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as RequiredDate,agencies: null == agencies ? _self.agencies : agencies // ignore: cast_nullable_to_non_nullable
as List<ImplementingAgency>,states: null == states ? _self.states : states // ignore: cast_nullable_to_non_nullable
as List<NigerianState>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectEntryFormData].
extension ProjectEntryFormDataPatterns on ProjectEntryFormData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectEntryFormData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectEntryFormData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectEntryFormData value)  $default,){
final _that = this;
switch (_that) {
case _ProjectEntryFormData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectEntryFormData value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectEntryFormData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  RequiredProjectStatus status,  RequiredId supervisingMinistryId,  RequiredId implementingAgencyId,  RequiredId stateId,  RequiredId geopoliticalZoneId,  RequiredText constituency,  RequiredText title,  String sponsor,  RequiredDouble budget,  RequiredDate startDate,  RequiredDate endDate,  List<ImplementingAgency> agencies,  List<NigerianState> states)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectEntryFormData() when $default != null:
return $default(_that.code,_that.status,_that.supervisingMinistryId,_that.implementingAgencyId,_that.stateId,_that.geopoliticalZoneId,_that.constituency,_that.title,_that.sponsor,_that.budget,_that.startDate,_that.endDate,_that.agencies,_that.states);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  RequiredProjectStatus status,  RequiredId supervisingMinistryId,  RequiredId implementingAgencyId,  RequiredId stateId,  RequiredId geopoliticalZoneId,  RequiredText constituency,  RequiredText title,  String sponsor,  RequiredDouble budget,  RequiredDate startDate,  RequiredDate endDate,  List<ImplementingAgency> agencies,  List<NigerianState> states)  $default,) {final _that = this;
switch (_that) {
case _ProjectEntryFormData():
return $default(_that.code,_that.status,_that.supervisingMinistryId,_that.implementingAgencyId,_that.stateId,_that.geopoliticalZoneId,_that.constituency,_that.title,_that.sponsor,_that.budget,_that.startDate,_that.endDate,_that.agencies,_that.states);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  RequiredProjectStatus status,  RequiredId supervisingMinistryId,  RequiredId implementingAgencyId,  RequiredId stateId,  RequiredId geopoliticalZoneId,  RequiredText constituency,  RequiredText title,  String sponsor,  RequiredDouble budget,  RequiredDate startDate,  RequiredDate endDate,  List<ImplementingAgency> agencies,  List<NigerianState> states)?  $default,) {final _that = this;
switch (_that) {
case _ProjectEntryFormData() when $default != null:
return $default(_that.code,_that.status,_that.supervisingMinistryId,_that.implementingAgencyId,_that.stateId,_that.geopoliticalZoneId,_that.constituency,_that.title,_that.sponsor,_that.budget,_that.startDate,_that.endDate,_that.agencies,_that.states);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectEntryFormData extends ProjectEntryFormData {
  const _ProjectEntryFormData({required this.code, this.status = const RequiredProjectStatus.pure(), this.supervisingMinistryId = const RequiredId.pure(), this.implementingAgencyId = const RequiredId.pure(), this.stateId = const RequiredId.pure(), this.geopoliticalZoneId = const RequiredId.pure(), this.constituency = const RequiredText.pure(), this.title = const RequiredText.pure(), this.sponsor = '', this.budget = const RequiredDouble.pure(), this.startDate = const RequiredDate.pure(), this.endDate = const RequiredDate.pure(), final  List<ImplementingAgency> agencies = const [], final  List<NigerianState> states = const []}): _agencies = agencies,_states = states,super._();
  

@override final  String code;
@override@JsonKey() final  RequiredProjectStatus status;
@override@JsonKey() final  RequiredId supervisingMinistryId;
@override@JsonKey() final  RequiredId implementingAgencyId;
@override@JsonKey() final  RequiredId stateId;
@override@JsonKey() final  RequiredId geopoliticalZoneId;
@override@JsonKey() final  RequiredText constituency;
@override@JsonKey() final  RequiredText title;
@override@JsonKey() final  String sponsor;
@override@JsonKey() final  RequiredDouble budget;
@override@JsonKey() final  RequiredDate startDate;
@override@JsonKey() final  RequiredDate endDate;
 final  List<ImplementingAgency> _agencies;
@override@JsonKey() List<ImplementingAgency> get agencies {
  if (_agencies is EqualUnmodifiableListView) return _agencies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_agencies);
}

 final  List<NigerianState> _states;
@override@JsonKey() List<NigerianState> get states {
  if (_states is EqualUnmodifiableListView) return _states;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_states);
}


/// Create a copy of ProjectEntryFormData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectEntryFormDataCopyWith<_ProjectEntryFormData> get copyWith => __$ProjectEntryFormDataCopyWithImpl<_ProjectEntryFormData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectEntryFormData&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&(identical(other.supervisingMinistryId, supervisingMinistryId) || other.supervisingMinistryId == supervisingMinistryId)&&(identical(other.implementingAgencyId, implementingAgencyId) || other.implementingAgencyId == implementingAgencyId)&&(identical(other.stateId, stateId) || other.stateId == stateId)&&(identical(other.geopoliticalZoneId, geopoliticalZoneId) || other.geopoliticalZoneId == geopoliticalZoneId)&&(identical(other.constituency, constituency) || other.constituency == constituency)&&(identical(other.title, title) || other.title == title)&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.budget, budget) || other.budget == budget)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&const DeepCollectionEquality().equals(other._agencies, _agencies)&&const DeepCollectionEquality().equals(other._states, _states));
}


@override
int get hashCode => Object.hash(runtimeType,code,status,supervisingMinistryId,implementingAgencyId,stateId,geopoliticalZoneId,constituency,title,sponsor,budget,startDate,endDate,const DeepCollectionEquality().hash(_agencies),const DeepCollectionEquality().hash(_states));

@override
String toString() {
  return 'ProjectEntryFormData(code: $code, status: $status, supervisingMinistryId: $supervisingMinistryId, implementingAgencyId: $implementingAgencyId, stateId: $stateId, geopoliticalZoneId: $geopoliticalZoneId, constituency: $constituency, title: $title, sponsor: $sponsor, budget: $budget, startDate: $startDate, endDate: $endDate, agencies: $agencies, states: $states)';
}


}

/// @nodoc
abstract mixin class _$ProjectEntryFormDataCopyWith<$Res> implements $ProjectEntryFormDataCopyWith<$Res> {
  factory _$ProjectEntryFormDataCopyWith(_ProjectEntryFormData value, $Res Function(_ProjectEntryFormData) _then) = __$ProjectEntryFormDataCopyWithImpl;
@override @useResult
$Res call({
 String code, RequiredProjectStatus status, RequiredId supervisingMinistryId, RequiredId implementingAgencyId, RequiredId stateId, RequiredId geopoliticalZoneId, RequiredText constituency, RequiredText title, String sponsor, RequiredDouble budget, RequiredDate startDate, RequiredDate endDate, List<ImplementingAgency> agencies, List<NigerianState> states
});




}
/// @nodoc
class __$ProjectEntryFormDataCopyWithImpl<$Res>
    implements _$ProjectEntryFormDataCopyWith<$Res> {
  __$ProjectEntryFormDataCopyWithImpl(this._self, this._then);

  final _ProjectEntryFormData _self;
  final $Res Function(_ProjectEntryFormData) _then;

/// Create a copy of ProjectEntryFormData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? status = null,Object? supervisingMinistryId = null,Object? implementingAgencyId = null,Object? stateId = null,Object? geopoliticalZoneId = null,Object? constituency = null,Object? title = null,Object? sponsor = null,Object? budget = null,Object? startDate = null,Object? endDate = null,Object? agencies = null,Object? states = null,}) {
  return _then(_ProjectEntryFormData(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RequiredProjectStatus,supervisingMinistryId: null == supervisingMinistryId ? _self.supervisingMinistryId : supervisingMinistryId // ignore: cast_nullable_to_non_nullable
as RequiredId,implementingAgencyId: null == implementingAgencyId ? _self.implementingAgencyId : implementingAgencyId // ignore: cast_nullable_to_non_nullable
as RequiredId,stateId: null == stateId ? _self.stateId : stateId // ignore: cast_nullable_to_non_nullable
as RequiredId,geopoliticalZoneId: null == geopoliticalZoneId ? _self.geopoliticalZoneId : geopoliticalZoneId // ignore: cast_nullable_to_non_nullable
as RequiredId,constituency: null == constituency ? _self.constituency : constituency // ignore: cast_nullable_to_non_nullable
as RequiredText,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as RequiredText,sponsor: null == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as String,budget: null == budget ? _self.budget : budget // ignore: cast_nullable_to_non_nullable
as RequiredDouble,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as RequiredDate,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as RequiredDate,agencies: null == agencies ? _self._agencies : agencies // ignore: cast_nullable_to_non_nullable
as List<ImplementingAgency>,states: null == states ? _self._states : states // ignore: cast_nullable_to_non_nullable
as List<NigerianState>,
  ));
}


}

/// @nodoc
mixin _$CreateNewProjectState {

 CreateProjectViewStatus get viewStatus; String get errorMessage; List<ProjectEntryFormData> get entries; int get currentEntryIndex; bool get showErrors; List<SupervisingMinistry> get ministries; List<GeopoliticalZone> get zones;
/// Create a copy of CreateNewProjectState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewProjectStateCopyWith<CreateNewProjectState> get copyWith => _$CreateNewProjectStateCopyWithImpl<CreateNewProjectState>(this as CreateNewProjectState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewProjectState&&(identical(other.viewStatus, viewStatus) || other.viewStatus == viewStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.entries, entries)&&(identical(other.currentEntryIndex, currentEntryIndex) || other.currentEntryIndex == currentEntryIndex)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors)&&const DeepCollectionEquality().equals(other.ministries, ministries)&&const DeepCollectionEquality().equals(other.zones, zones));
}


@override
int get hashCode => Object.hash(runtimeType,viewStatus,errorMessage,const DeepCollectionEquality().hash(entries),currentEntryIndex,showErrors,const DeepCollectionEquality().hash(ministries),const DeepCollectionEquality().hash(zones));

@override
String toString() {
  return 'CreateNewProjectState(viewStatus: $viewStatus, errorMessage: $errorMessage, entries: $entries, currentEntryIndex: $currentEntryIndex, showErrors: $showErrors, ministries: $ministries, zones: $zones)';
}


}

/// @nodoc
abstract mixin class $CreateNewProjectStateCopyWith<$Res>  {
  factory $CreateNewProjectStateCopyWith(CreateNewProjectState value, $Res Function(CreateNewProjectState) _then) = _$CreateNewProjectStateCopyWithImpl;
@useResult
$Res call({
 CreateProjectViewStatus viewStatus, String errorMessage, List<ProjectEntryFormData> entries, int currentEntryIndex, bool showErrors, List<SupervisingMinistry> ministries, List<GeopoliticalZone> zones
});




}
/// @nodoc
class _$CreateNewProjectStateCopyWithImpl<$Res>
    implements $CreateNewProjectStateCopyWith<$Res> {
  _$CreateNewProjectStateCopyWithImpl(this._self, this._then);

  final CreateNewProjectState _self;
  final $Res Function(CreateNewProjectState) _then;

/// Create a copy of CreateNewProjectState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? viewStatus = null,Object? errorMessage = null,Object? entries = null,Object? currentEntryIndex = null,Object? showErrors = null,Object? ministries = null,Object? zones = null,}) {
  return _then(_self.copyWith(
viewStatus: null == viewStatus ? _self.viewStatus : viewStatus // ignore: cast_nullable_to_non_nullable
as CreateProjectViewStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<ProjectEntryFormData>,currentEntryIndex: null == currentEntryIndex ? _self.currentEntryIndex : currentEntryIndex // ignore: cast_nullable_to_non_nullable
as int,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,ministries: null == ministries ? _self.ministries : ministries // ignore: cast_nullable_to_non_nullable
as List<SupervisingMinistry>,zones: null == zones ? _self.zones : zones // ignore: cast_nullable_to_non_nullable
as List<GeopoliticalZone>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateNewProjectState].
extension CreateNewProjectStatePatterns on CreateNewProjectState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateNewProjectState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateNewProjectState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateNewProjectState value)  $default,){
final _that = this;
switch (_that) {
case _CreateNewProjectState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateNewProjectState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateNewProjectState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateProjectViewStatus viewStatus,  String errorMessage,  List<ProjectEntryFormData> entries,  int currentEntryIndex,  bool showErrors,  List<SupervisingMinistry> ministries,  List<GeopoliticalZone> zones)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateNewProjectState() when $default != null:
return $default(_that.viewStatus,_that.errorMessage,_that.entries,_that.currentEntryIndex,_that.showErrors,_that.ministries,_that.zones);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateProjectViewStatus viewStatus,  String errorMessage,  List<ProjectEntryFormData> entries,  int currentEntryIndex,  bool showErrors,  List<SupervisingMinistry> ministries,  List<GeopoliticalZone> zones)  $default,) {final _that = this;
switch (_that) {
case _CreateNewProjectState():
return $default(_that.viewStatus,_that.errorMessage,_that.entries,_that.currentEntryIndex,_that.showErrors,_that.ministries,_that.zones);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateProjectViewStatus viewStatus,  String errorMessage,  List<ProjectEntryFormData> entries,  int currentEntryIndex,  bool showErrors,  List<SupervisingMinistry> ministries,  List<GeopoliticalZone> zones)?  $default,) {final _that = this;
switch (_that) {
case _CreateNewProjectState() when $default != null:
return $default(_that.viewStatus,_that.errorMessage,_that.entries,_that.currentEntryIndex,_that.showErrors,_that.ministries,_that.zones);case _:
  return null;

}
}

}

/// @nodoc


class _CreateNewProjectState extends CreateNewProjectState {
  const _CreateNewProjectState({this.viewStatus = CreateProjectViewStatus.initial, this.errorMessage = '', final  List<ProjectEntryFormData> entries = const [], this.currentEntryIndex = 0, this.showErrors = false, final  List<SupervisingMinistry> ministries = const [], final  List<GeopoliticalZone> zones = const []}): _entries = entries,_ministries = ministries,_zones = zones,super._();
  

@override@JsonKey() final  CreateProjectViewStatus viewStatus;
@override@JsonKey() final  String errorMessage;
 final  List<ProjectEntryFormData> _entries;
@override@JsonKey() List<ProjectEntryFormData> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override@JsonKey() final  int currentEntryIndex;
@override@JsonKey() final  bool showErrors;
 final  List<SupervisingMinistry> _ministries;
@override@JsonKey() List<SupervisingMinistry> get ministries {
  if (_ministries is EqualUnmodifiableListView) return _ministries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ministries);
}

 final  List<GeopoliticalZone> _zones;
@override@JsonKey() List<GeopoliticalZone> get zones {
  if (_zones is EqualUnmodifiableListView) return _zones;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_zones);
}


/// Create a copy of CreateNewProjectState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNewProjectStateCopyWith<_CreateNewProjectState> get copyWith => __$CreateNewProjectStateCopyWithImpl<_CreateNewProjectState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNewProjectState&&(identical(other.viewStatus, viewStatus) || other.viewStatus == viewStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._entries, _entries)&&(identical(other.currentEntryIndex, currentEntryIndex) || other.currentEntryIndex == currentEntryIndex)&&(identical(other.showErrors, showErrors) || other.showErrors == showErrors)&&const DeepCollectionEquality().equals(other._ministries, _ministries)&&const DeepCollectionEquality().equals(other._zones, _zones));
}


@override
int get hashCode => Object.hash(runtimeType,viewStatus,errorMessage,const DeepCollectionEquality().hash(_entries),currentEntryIndex,showErrors,const DeepCollectionEquality().hash(_ministries),const DeepCollectionEquality().hash(_zones));

@override
String toString() {
  return 'CreateNewProjectState(viewStatus: $viewStatus, errorMessage: $errorMessage, entries: $entries, currentEntryIndex: $currentEntryIndex, showErrors: $showErrors, ministries: $ministries, zones: $zones)';
}


}

/// @nodoc
abstract mixin class _$CreateNewProjectStateCopyWith<$Res> implements $CreateNewProjectStateCopyWith<$Res> {
  factory _$CreateNewProjectStateCopyWith(_CreateNewProjectState value, $Res Function(_CreateNewProjectState) _then) = __$CreateNewProjectStateCopyWithImpl;
@override @useResult
$Res call({
 CreateProjectViewStatus viewStatus, String errorMessage, List<ProjectEntryFormData> entries, int currentEntryIndex, bool showErrors, List<SupervisingMinistry> ministries, List<GeopoliticalZone> zones
});




}
/// @nodoc
class __$CreateNewProjectStateCopyWithImpl<$Res>
    implements _$CreateNewProjectStateCopyWith<$Res> {
  __$CreateNewProjectStateCopyWithImpl(this._self, this._then);

  final _CreateNewProjectState _self;
  final $Res Function(_CreateNewProjectState) _then;

/// Create a copy of CreateNewProjectState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? viewStatus = null,Object? errorMessage = null,Object? entries = null,Object? currentEntryIndex = null,Object? showErrors = null,Object? ministries = null,Object? zones = null,}) {
  return _then(_CreateNewProjectState(
viewStatus: null == viewStatus ? _self.viewStatus : viewStatus // ignore: cast_nullable_to_non_nullable
as CreateProjectViewStatus,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<ProjectEntryFormData>,currentEntryIndex: null == currentEntryIndex ? _self.currentEntryIndex : currentEntryIndex // ignore: cast_nullable_to_non_nullable
as int,showErrors: null == showErrors ? _self.showErrors : showErrors // ignore: cast_nullable_to_non_nullable
as bool,ministries: null == ministries ? _self._ministries : ministries // ignore: cast_nullable_to_non_nullable
as List<SupervisingMinistry>,zones: null == zones ? _self._zones : zones // ignore: cast_nullable_to_non_nullable
as List<GeopoliticalZone>,
  ));
}


}

// dart format on
