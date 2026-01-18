// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateUserState {

 FormzSubmissionStatus get status; RequiredField get fullName; RequiredEmail get email; RequiredField get username; RequiredUserRole get role; String? get errorMessage; bool get isValid;
/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateUserStateCopyWith<CreateUserState> get copyWith => _$CreateUserStateCopyWithImpl<CreateUserState>(this as CreateUserState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateUserState&&(identical(other.status, status) || other.status == status)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,status,fullName,email,username,role,errorMessage,isValid);

@override
String toString() {
  return 'CreateUserState(status: $status, fullName: $fullName, email: $email, username: $username, role: $role, errorMessage: $errorMessage, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class $CreateUserStateCopyWith<$Res>  {
  factory $CreateUserStateCopyWith(CreateUserState value, $Res Function(CreateUserState) _then) = _$CreateUserStateCopyWithImpl;
@useResult
$Res call({
 FormzSubmissionStatus status, RequiredField fullName, RequiredEmail email, RequiredField username, RequiredUserRole role, String? errorMessage, bool isValid
});




}
/// @nodoc
class _$CreateUserStateCopyWithImpl<$Res>
    implements $CreateUserStateCopyWith<$Res> {
  _$CreateUserStateCopyWithImpl(this._self, this._then);

  final CreateUserState _self;
  final $Res Function(CreateUserState) _then;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? fullName = null,Object? email = null,Object? username = null,Object? role = null,Object? errorMessage = freezed,Object? isValid = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as RequiredField,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as RequiredEmail,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as RequiredField,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RequiredUserRole,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateUserState].
extension CreateUserStatePatterns on CreateUserState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateUserState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateUserState value)  $default,){
final _that = this;
switch (_that) {
case _CreateUserState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateUserState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FormzSubmissionStatus status,  RequiredField fullName,  RequiredEmail email,  RequiredField username,  RequiredUserRole role,  String? errorMessage,  bool isValid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
return $default(_that.status,_that.fullName,_that.email,_that.username,_that.role,_that.errorMessage,_that.isValid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FormzSubmissionStatus status,  RequiredField fullName,  RequiredEmail email,  RequiredField username,  RequiredUserRole role,  String? errorMessage,  bool isValid)  $default,) {final _that = this;
switch (_that) {
case _CreateUserState():
return $default(_that.status,_that.fullName,_that.email,_that.username,_that.role,_that.errorMessage,_that.isValid);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FormzSubmissionStatus status,  RequiredField fullName,  RequiredEmail email,  RequiredField username,  RequiredUserRole role,  String? errorMessage,  bool isValid)?  $default,) {final _that = this;
switch (_that) {
case _CreateUserState() when $default != null:
return $default(_that.status,_that.fullName,_that.email,_that.username,_that.role,_that.errorMessage,_that.isValid);case _:
  return null;

}
}

}

/// @nodoc


class _CreateUserState extends CreateUserState {
  const _CreateUserState({this.status = FormzSubmissionStatus.initial, this.fullName = const RequiredField.pure(), this.email = const RequiredEmail.pure(), this.username = const RequiredField.pure(), this.role = const RequiredUserRole.pure(), this.errorMessage = null, this.isValid = false}): super._();
  

@override@JsonKey() final  FormzSubmissionStatus status;
@override@JsonKey() final  RequiredField fullName;
@override@JsonKey() final  RequiredEmail email;
@override@JsonKey() final  RequiredField username;
@override@JsonKey() final  RequiredUserRole role;
@override@JsonKey() final  String? errorMessage;
@override@JsonKey() final  bool isValid;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateUserStateCopyWith<_CreateUserState> get copyWith => __$CreateUserStateCopyWithImpl<_CreateUserState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateUserState&&(identical(other.status, status) || other.status == status)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isValid, isValid) || other.isValid == isValid));
}


@override
int get hashCode => Object.hash(runtimeType,status,fullName,email,username,role,errorMessage,isValid);

@override
String toString() {
  return 'CreateUserState(status: $status, fullName: $fullName, email: $email, username: $username, role: $role, errorMessage: $errorMessage, isValid: $isValid)';
}


}

/// @nodoc
abstract mixin class _$CreateUserStateCopyWith<$Res> implements $CreateUserStateCopyWith<$Res> {
  factory _$CreateUserStateCopyWith(_CreateUserState value, $Res Function(_CreateUserState) _then) = __$CreateUserStateCopyWithImpl;
@override @useResult
$Res call({
 FormzSubmissionStatus status, RequiredField fullName, RequiredEmail email, RequiredField username, RequiredUserRole role, String? errorMessage, bool isValid
});




}
/// @nodoc
class __$CreateUserStateCopyWithImpl<$Res>
    implements _$CreateUserStateCopyWith<$Res> {
  __$CreateUserStateCopyWithImpl(this._self, this._then);

  final _CreateUserState _self;
  final $Res Function(_CreateUserState) _then;

/// Create a copy of CreateUserState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? fullName = null,Object? email = null,Object? username = null,Object? role = null,Object? errorMessage = freezed,Object? isValid = null,}) {
  return _then(_CreateUserState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FormzSubmissionStatus,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as RequiredField,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as RequiredEmail,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as RequiredField,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RequiredUserRole,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isValid: null == isValid ? _self.isValid : isValid // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
