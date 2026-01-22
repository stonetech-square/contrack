// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserManagementState {

 List<db.User> get users; bool get isLoadingUsers; String? get errorMessage; String? get togglingUserId; String? get toggleError; String? get changingRoleUserId; String? get changeRoleError; String? get resendingInvitationUserId; String? get resendInvitationError; String? get resendInvitationSuccess;
/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserManagementStateCopyWith<UserManagementState> get copyWith => _$UserManagementStateCopyWithImpl<UserManagementState>(this as UserManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserManagementState&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.isLoadingUsers, isLoadingUsers) || other.isLoadingUsers == isLoadingUsers)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.togglingUserId, togglingUserId) || other.togglingUserId == togglingUserId)&&(identical(other.toggleError, toggleError) || other.toggleError == toggleError)&&(identical(other.changingRoleUserId, changingRoleUserId) || other.changingRoleUserId == changingRoleUserId)&&(identical(other.changeRoleError, changeRoleError) || other.changeRoleError == changeRoleError)&&(identical(other.resendingInvitationUserId, resendingInvitationUserId) || other.resendingInvitationUserId == resendingInvitationUserId)&&(identical(other.resendInvitationError, resendInvitationError) || other.resendInvitationError == resendInvitationError)&&(identical(other.resendInvitationSuccess, resendInvitationSuccess) || other.resendInvitationSuccess == resendInvitationSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),isLoadingUsers,errorMessage,togglingUserId,toggleError,changingRoleUserId,changeRoleError,resendingInvitationUserId,resendInvitationError,resendInvitationSuccess);

@override
String toString() {
  return 'UserManagementState(users: $users, isLoadingUsers: $isLoadingUsers, errorMessage: $errorMessage, togglingUserId: $togglingUserId, toggleError: $toggleError, changingRoleUserId: $changingRoleUserId, changeRoleError: $changeRoleError, resendingInvitationUserId: $resendingInvitationUserId, resendInvitationError: $resendInvitationError, resendInvitationSuccess: $resendInvitationSuccess)';
}


}

/// @nodoc
abstract mixin class $UserManagementStateCopyWith<$Res>  {
  factory $UserManagementStateCopyWith(UserManagementState value, $Res Function(UserManagementState) _then) = _$UserManagementStateCopyWithImpl;
@useResult
$Res call({
 List<db.User> users, bool isLoadingUsers, String? errorMessage, String? togglingUserId, String? toggleError, String? changingRoleUserId, String? changeRoleError, String? resendingInvitationUserId, String? resendInvitationError, String? resendInvitationSuccess
});




}
/// @nodoc
class _$UserManagementStateCopyWithImpl<$Res>
    implements $UserManagementStateCopyWith<$Res> {
  _$UserManagementStateCopyWithImpl(this._self, this._then);

  final UserManagementState _self;
  final $Res Function(UserManagementState) _then;

/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? isLoadingUsers = null,Object? errorMessage = freezed,Object? togglingUserId = freezed,Object? toggleError = freezed,Object? changingRoleUserId = freezed,Object? changeRoleError = freezed,Object? resendingInvitationUserId = freezed,Object? resendInvitationError = freezed,Object? resendInvitationSuccess = freezed,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<db.User>,isLoadingUsers: null == isLoadingUsers ? _self.isLoadingUsers : isLoadingUsers // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,togglingUserId: freezed == togglingUserId ? _self.togglingUserId : togglingUserId // ignore: cast_nullable_to_non_nullable
as String?,toggleError: freezed == toggleError ? _self.toggleError : toggleError // ignore: cast_nullable_to_non_nullable
as String?,changingRoleUserId: freezed == changingRoleUserId ? _self.changingRoleUserId : changingRoleUserId // ignore: cast_nullable_to_non_nullable
as String?,changeRoleError: freezed == changeRoleError ? _self.changeRoleError : changeRoleError // ignore: cast_nullable_to_non_nullable
as String?,resendingInvitationUserId: freezed == resendingInvitationUserId ? _self.resendingInvitationUserId : resendingInvitationUserId // ignore: cast_nullable_to_non_nullable
as String?,resendInvitationError: freezed == resendInvitationError ? _self.resendInvitationError : resendInvitationError // ignore: cast_nullable_to_non_nullable
as String?,resendInvitationSuccess: freezed == resendInvitationSuccess ? _self.resendInvitationSuccess : resendInvitationSuccess // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserManagementState].
extension UserManagementStatePatterns on UserManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserManagementState value)  $default,){
final _that = this;
switch (_that) {
case _UserManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<db.User> users,  bool isLoadingUsers,  String? errorMessage,  String? togglingUserId,  String? toggleError,  String? changingRoleUserId,  String? changeRoleError,  String? resendingInvitationUserId,  String? resendInvitationError,  String? resendInvitationSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
return $default(_that.users,_that.isLoadingUsers,_that.errorMessage,_that.togglingUserId,_that.toggleError,_that.changingRoleUserId,_that.changeRoleError,_that.resendingInvitationUserId,_that.resendInvitationError,_that.resendInvitationSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<db.User> users,  bool isLoadingUsers,  String? errorMessage,  String? togglingUserId,  String? toggleError,  String? changingRoleUserId,  String? changeRoleError,  String? resendingInvitationUserId,  String? resendInvitationError,  String? resendInvitationSuccess)  $default,) {final _that = this;
switch (_that) {
case _UserManagementState():
return $default(_that.users,_that.isLoadingUsers,_that.errorMessage,_that.togglingUserId,_that.toggleError,_that.changingRoleUserId,_that.changeRoleError,_that.resendingInvitationUserId,_that.resendInvitationError,_that.resendInvitationSuccess);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<db.User> users,  bool isLoadingUsers,  String? errorMessage,  String? togglingUserId,  String? toggleError,  String? changingRoleUserId,  String? changeRoleError,  String? resendingInvitationUserId,  String? resendInvitationError,  String? resendInvitationSuccess)?  $default,) {final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
return $default(_that.users,_that.isLoadingUsers,_that.errorMessage,_that.togglingUserId,_that.toggleError,_that.changingRoleUserId,_that.changeRoleError,_that.resendingInvitationUserId,_that.resendInvitationError,_that.resendInvitationSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _UserManagementState extends UserManagementState {
  const _UserManagementState({final  List<db.User> users = const [], this.isLoadingUsers = false, this.errorMessage = null, this.togglingUserId = null, this.toggleError = null, this.changingRoleUserId = null, this.changeRoleError = null, this.resendingInvitationUserId = null, this.resendInvitationError = null, this.resendInvitationSuccess = null}): _users = users,super._();
  

 final  List<db.User> _users;
@override@JsonKey() List<db.User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  bool isLoadingUsers;
@override@JsonKey() final  String? errorMessage;
@override@JsonKey() final  String? togglingUserId;
@override@JsonKey() final  String? toggleError;
@override@JsonKey() final  String? changingRoleUserId;
@override@JsonKey() final  String? changeRoleError;
@override@JsonKey() final  String? resendingInvitationUserId;
@override@JsonKey() final  String? resendInvitationError;
@override@JsonKey() final  String? resendInvitationSuccess;

/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserManagementStateCopyWith<_UserManagementState> get copyWith => __$UserManagementStateCopyWithImpl<_UserManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserManagementState&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.isLoadingUsers, isLoadingUsers) || other.isLoadingUsers == isLoadingUsers)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.togglingUserId, togglingUserId) || other.togglingUserId == togglingUserId)&&(identical(other.toggleError, toggleError) || other.toggleError == toggleError)&&(identical(other.changingRoleUserId, changingRoleUserId) || other.changingRoleUserId == changingRoleUserId)&&(identical(other.changeRoleError, changeRoleError) || other.changeRoleError == changeRoleError)&&(identical(other.resendingInvitationUserId, resendingInvitationUserId) || other.resendingInvitationUserId == resendingInvitationUserId)&&(identical(other.resendInvitationError, resendInvitationError) || other.resendInvitationError == resendInvitationError)&&(identical(other.resendInvitationSuccess, resendInvitationSuccess) || other.resendInvitationSuccess == resendInvitationSuccess));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),isLoadingUsers,errorMessage,togglingUserId,toggleError,changingRoleUserId,changeRoleError,resendingInvitationUserId,resendInvitationError,resendInvitationSuccess);

@override
String toString() {
  return 'UserManagementState(users: $users, isLoadingUsers: $isLoadingUsers, errorMessage: $errorMessage, togglingUserId: $togglingUserId, toggleError: $toggleError, changingRoleUserId: $changingRoleUserId, changeRoleError: $changeRoleError, resendingInvitationUserId: $resendingInvitationUserId, resendInvitationError: $resendInvitationError, resendInvitationSuccess: $resendInvitationSuccess)';
}


}

/// @nodoc
abstract mixin class _$UserManagementStateCopyWith<$Res> implements $UserManagementStateCopyWith<$Res> {
  factory _$UserManagementStateCopyWith(_UserManagementState value, $Res Function(_UserManagementState) _then) = __$UserManagementStateCopyWithImpl;
@override @useResult
$Res call({
 List<db.User> users, bool isLoadingUsers, String? errorMessage, String? togglingUserId, String? toggleError, String? changingRoleUserId, String? changeRoleError, String? resendingInvitationUserId, String? resendInvitationError, String? resendInvitationSuccess
});




}
/// @nodoc
class __$UserManagementStateCopyWithImpl<$Res>
    implements _$UserManagementStateCopyWith<$Res> {
  __$UserManagementStateCopyWithImpl(this._self, this._then);

  final _UserManagementState _self;
  final $Res Function(_UserManagementState) _then;

/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? isLoadingUsers = null,Object? errorMessage = freezed,Object? togglingUserId = freezed,Object? toggleError = freezed,Object? changingRoleUserId = freezed,Object? changeRoleError = freezed,Object? resendingInvitationUserId = freezed,Object? resendInvitationError = freezed,Object? resendInvitationSuccess = freezed,}) {
  return _then(_UserManagementState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<db.User>,isLoadingUsers: null == isLoadingUsers ? _self.isLoadingUsers : isLoadingUsers // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,togglingUserId: freezed == togglingUserId ? _self.togglingUserId : togglingUserId // ignore: cast_nullable_to_non_nullable
as String?,toggleError: freezed == toggleError ? _self.toggleError : toggleError // ignore: cast_nullable_to_non_nullable
as String?,changingRoleUserId: freezed == changingRoleUserId ? _self.changingRoleUserId : changingRoleUserId // ignore: cast_nullable_to_non_nullable
as String?,changeRoleError: freezed == changeRoleError ? _self.changeRoleError : changeRoleError // ignore: cast_nullable_to_non_nullable
as String?,resendingInvitationUserId: freezed == resendingInvitationUserId ? _self.resendingInvitationUserId : resendingInvitationUserId // ignore: cast_nullable_to_non_nullable
as String?,resendInvitationError: freezed == resendInvitationError ? _self.resendInvitationError : resendInvitationError // ignore: cast_nullable_to_non_nullable
as String?,resendInvitationSuccess: freezed == resendInvitationSuccess ? _self.resendInvitationSuccess : resendInvitationSuccess // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
