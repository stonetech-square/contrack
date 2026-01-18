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

 List<db.User> get users; bool get isLoadingUsers; String? get errorMessage; UserFormStatus get formStatus; RequiredField get fullName; RequiredEmail get email; RequiredField get username; RequiredField get uid; RequiredUserRole get role; bool get isActive; bool get isEditing; String? get formErrorMessage; bool get isValid; bool get isTogglingStatus; String? get toggleError;
/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserManagementStateCopyWith<UserManagementState> get copyWith => _$UserManagementStateCopyWithImpl<UserManagementState>(this as UserManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserManagementState&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.isLoadingUsers, isLoadingUsers) || other.isLoadingUsers == isLoadingUsers)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.formStatus, formStatus) || other.formStatus == formStatus)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.formErrorMessage, formErrorMessage) || other.formErrorMessage == formErrorMessage)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isTogglingStatus, isTogglingStatus) || other.isTogglingStatus == isTogglingStatus)&&(identical(other.toggleError, toggleError) || other.toggleError == toggleError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(users),isLoadingUsers,errorMessage,formStatus,fullName,email,username,uid,role,isActive,isEditing,formErrorMessage,isValid,isTogglingStatus,toggleError);

@override
String toString() {
  return 'UserManagementState(users: $users, isLoadingUsers: $isLoadingUsers, errorMessage: $errorMessage, formStatus: $formStatus, fullName: $fullName, email: $email, username: $username, uid: $uid, role: $role, isActive: $isActive, isEditing: $isEditing, formErrorMessage: $formErrorMessage, isValid: $isValid, isTogglingStatus: $isTogglingStatus, toggleError: $toggleError)';
}


}

/// @nodoc
abstract mixin class $UserManagementStateCopyWith<$Res>  {
  factory $UserManagementStateCopyWith(UserManagementState value, $Res Function(UserManagementState) _then) = _$UserManagementStateCopyWithImpl;
@useResult
$Res call({
 List<db.User> users, bool isLoadingUsers, String? errorMessage, UserFormStatus formStatus, RequiredField fullName, RequiredEmail email, RequiredField username, RequiredField uid, RequiredUserRole role, bool isActive, bool isEditing, String? formErrorMessage, bool isValid, bool isTogglingStatus, String? toggleError
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
@pragma('vm:prefer-inline') @override $Res call({Object? users = null,Object? isLoadingUsers = null,Object? errorMessage = freezed,Object? formStatus = null,Object? fullName = null,Object? email = null,Object? username = null,Object? uid = null,Object? role = null,Object? isActive = null,Object? isEditing = null,Object? formErrorMessage = freezed,Object? isValid = null,Object? isTogglingStatus = null,Object? toggleError = freezed,}) {
  return _then(_self.copyWith(
users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<db.User>,isLoadingUsers: null == isLoadingUsers ? _self.isLoadingUsers : isLoadingUsers // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,formStatus: null == formStatus ? _self.formStatus : formStatus // ignore: cast_nullable_to_non_nullable
as UserFormStatus,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as RequiredField,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as RequiredEmail,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as RequiredField,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as RequiredField,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RequiredUserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,formErrorMessage: freezed == formErrorMessage ? _self.formErrorMessage : formErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isTogglingStatus: null == isTogglingStatus ? _self.isTogglingStatus : isTogglingStatus // ignore: cast_nullable_to_non_nullable
as bool,toggleError: freezed == toggleError ? _self.toggleError : toggleError // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<db.User> users,  bool isLoadingUsers,  String? errorMessage,  UserFormStatus formStatus,  RequiredField fullName,  RequiredEmail email,  RequiredField username,  RequiredField uid,  RequiredUserRole role,  bool isActive,  bool isEditing,  String? formErrorMessage,  bool isValid,  bool isTogglingStatus,  String? toggleError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
return $default(_that.users,_that.isLoadingUsers,_that.errorMessage,_that.formStatus,_that.fullName,_that.email,_that.username,_that.uid,_that.role,_that.isActive,_that.isEditing,_that.formErrorMessage,_that.isValid,_that.isTogglingStatus,_that.toggleError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<db.User> users,  bool isLoadingUsers,  String? errorMessage,  UserFormStatus formStatus,  RequiredField fullName,  RequiredEmail email,  RequiredField username,  RequiredField uid,  RequiredUserRole role,  bool isActive,  bool isEditing,  String? formErrorMessage,  bool isValid,  bool isTogglingStatus,  String? toggleError)  $default,) {final _that = this;
switch (_that) {
case _UserManagementState():
return $default(_that.users,_that.isLoadingUsers,_that.errorMessage,_that.formStatus,_that.fullName,_that.email,_that.username,_that.uid,_that.role,_that.isActive,_that.isEditing,_that.formErrorMessage,_that.isValid,_that.isTogglingStatus,_that.toggleError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<db.User> users,  bool isLoadingUsers,  String? errorMessage,  UserFormStatus formStatus,  RequiredField fullName,  RequiredEmail email,  RequiredField username,  RequiredField uid,  RequiredUserRole role,  bool isActive,  bool isEditing,  String? formErrorMessage,  bool isValid,  bool isTogglingStatus,  String? toggleError)?  $default,) {final _that = this;
switch (_that) {
case _UserManagementState() when $default != null:
return $default(_that.users,_that.isLoadingUsers,_that.errorMessage,_that.formStatus,_that.fullName,_that.email,_that.username,_that.uid,_that.role,_that.isActive,_that.isEditing,_that.formErrorMessage,_that.isValid,_that.isTogglingStatus,_that.toggleError);case _:
  return null;

}
}

}

/// @nodoc


class _UserManagementState extends UserManagementState {
  const _UserManagementState({final  List<db.User> users = const [], this.isLoadingUsers = false, this.errorMessage = null, this.formStatus = UserFormStatus.initial, this.fullName = const RequiredField.pure(), this.email = const RequiredEmail.pure(), this.username = const RequiredField.pure(), this.uid = const RequiredField.pure(), this.role = const RequiredUserRole.pure(), this.isActive = true, this.isEditing = false, this.formErrorMessage = null, this.isValid = false, this.isTogglingStatus = false, this.toggleError = null}): _users = users,super._();
  

 final  List<db.User> _users;
@override@JsonKey() List<db.User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey() final  bool isLoadingUsers;
@override@JsonKey() final  String? errorMessage;
@override@JsonKey() final  UserFormStatus formStatus;
@override@JsonKey() final  RequiredField fullName;
@override@JsonKey() final  RequiredEmail email;
@override@JsonKey() final  RequiredField username;
@override@JsonKey() final  RequiredField uid;
@override@JsonKey() final  RequiredUserRole role;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  bool isEditing;
@override@JsonKey() final  String? formErrorMessage;
@override@JsonKey() final  bool isValid;
@override@JsonKey() final  bool isTogglingStatus;
@override@JsonKey() final  String? toggleError;

/// Create a copy of UserManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserManagementStateCopyWith<_UserManagementState> get copyWith => __$UserManagementStateCopyWithImpl<_UserManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserManagementState&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.isLoadingUsers, isLoadingUsers) || other.isLoadingUsers == isLoadingUsers)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.formStatus, formStatus) || other.formStatus == formStatus)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.role, role) || other.role == role)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing)&&(identical(other.formErrorMessage, formErrorMessage) || other.formErrorMessage == formErrorMessage)&&(identical(other.isValid, isValid) || other.isValid == isValid)&&(identical(other.isTogglingStatus, isTogglingStatus) || other.isTogglingStatus == isTogglingStatus)&&(identical(other.toggleError, toggleError) || other.toggleError == toggleError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_users),isLoadingUsers,errorMessage,formStatus,fullName,email,username,uid,role,isActive,isEditing,formErrorMessage,isValid,isTogglingStatus,toggleError);

@override
String toString() {
  return 'UserManagementState(users: $users, isLoadingUsers: $isLoadingUsers, errorMessage: $errorMessage, formStatus: $formStatus, fullName: $fullName, email: $email, username: $username, uid: $uid, role: $role, isActive: $isActive, isEditing: $isEditing, formErrorMessage: $formErrorMessage, isValid: $isValid, isTogglingStatus: $isTogglingStatus, toggleError: $toggleError)';
}


}

/// @nodoc
abstract mixin class _$UserManagementStateCopyWith<$Res> implements $UserManagementStateCopyWith<$Res> {
  factory _$UserManagementStateCopyWith(_UserManagementState value, $Res Function(_UserManagementState) _then) = __$UserManagementStateCopyWithImpl;
@override @useResult
$Res call({
 List<db.User> users, bool isLoadingUsers, String? errorMessage, UserFormStatus formStatus, RequiredField fullName, RequiredEmail email, RequiredField username, RequiredField uid, RequiredUserRole role, bool isActive, bool isEditing, String? formErrorMessage, bool isValid, bool isTogglingStatus, String? toggleError
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
@override @pragma('vm:prefer-inline') $Res call({Object? users = null,Object? isLoadingUsers = null,Object? errorMessage = freezed,Object? formStatus = null,Object? fullName = null,Object? email = null,Object? username = null,Object? uid = null,Object? role = null,Object? isActive = null,Object? isEditing = null,Object? formErrorMessage = freezed,Object? isValid = null,Object? isTogglingStatus = null,Object? toggleError = freezed,}) {
  return _then(_UserManagementState(
users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<db.User>,isLoadingUsers: null == isLoadingUsers ? _self.isLoadingUsers : isLoadingUsers // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,formStatus: null == formStatus ? _self.formStatus : formStatus // ignore: cast_nullable_to_non_nullable
as UserFormStatus,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as RequiredField,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as RequiredEmail,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as RequiredField,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as RequiredField,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RequiredUserRole,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,formErrorMessage: freezed == formErrorMessage ? _self.formErrorMessage : formErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,isTogglingStatus: null == isTogglingStatus ? _self.isTogglingStatus : isTogglingStatus // ignore: cast_nullable_to_non_nullable
as bool,toggleError: freezed == toggleError ? _self.toggleError : toggleError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
