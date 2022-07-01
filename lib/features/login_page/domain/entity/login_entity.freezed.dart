// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) {
  return _LoginEntity.fromJson(json);
}

/// @nodoc
mixin _$LoginEntity {
  dynamic get server => throw _privateConstructorUsedError;
  dynamic get database => throw _privateConstructorUsedError;
  dynamic get login => throw _privateConstructorUsedError;
  dynamic get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginEntityCopyWith<LoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEntityCopyWith<$Res> {
  factory $LoginEntityCopyWith(
          LoginEntity value, $Res Function(LoginEntity) then) =
      _$LoginEntityCopyWithImpl<$Res>;
  $Res call(
      {dynamic server, dynamic database, dynamic login, dynamic password});
}

/// @nodoc
class _$LoginEntityCopyWithImpl<$Res> implements $LoginEntityCopyWith<$Res> {
  _$LoginEntityCopyWithImpl(this._value, this._then);

  final LoginEntity _value;
  // ignore: unused_field
  final $Res Function(LoginEntity) _then;

  @override
  $Res call({
    Object? server = freezed,
    Object? database = freezed,
    Object? login = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      server: server == freezed
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as dynamic,
      database: database == freezed
          ? _value.database
          : database // ignore: cast_nullable_to_non_nullable
              as dynamic,
      login: login == freezed
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as dynamic,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginEntityCopyWith<$Res>
    implements $LoginEntityCopyWith<$Res> {
  factory _$$_LoginEntityCopyWith(
          _$_LoginEntity value, $Res Function(_$_LoginEntity) then) =
      __$$_LoginEntityCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic server, dynamic database, dynamic login, dynamic password});
}

/// @nodoc
class __$$_LoginEntityCopyWithImpl<$Res> extends _$LoginEntityCopyWithImpl<$Res>
    implements _$$_LoginEntityCopyWith<$Res> {
  __$$_LoginEntityCopyWithImpl(
      _$_LoginEntity _value, $Res Function(_$_LoginEntity) _then)
      : super(_value, (v) => _then(v as _$_LoginEntity));

  @override
  _$_LoginEntity get _value => super._value as _$_LoginEntity;

  @override
  $Res call({
    Object? server = freezed,
    Object? database = freezed,
    Object? login = freezed,
    Object? password = freezed,
  }) {
    return _then(_$_LoginEntity(
      server: server == freezed ? _value.server : server,
      database: database == freezed ? _value.database : database,
      login: login == freezed ? _value.login : login,
      password: password == freezed ? _value.password : password,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginEntity implements _LoginEntity {
  const _$_LoginEntity(
      {this.server = '',
      this.database = '',
      this.login = '',
      this.password = ''});

  factory _$_LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$$_LoginEntityFromJson(json);

  @override
  @JsonKey()
  final dynamic server;
  @override
  @JsonKey()
  final dynamic database;
  @override
  @JsonKey()
  final dynamic login;
  @override
  @JsonKey()
  final dynamic password;

  @override
  String toString() {
    return 'LoginEntity(server: $server, database: $database, login: $login, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginEntity &&
            const DeepCollectionEquality().equals(other.server, server) &&
            const DeepCollectionEquality().equals(other.database, database) &&
            const DeepCollectionEquality().equals(other.login, login) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(server),
      const DeepCollectionEquality().hash(database),
      const DeepCollectionEquality().hash(login),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$$_LoginEntityCopyWith<_$_LoginEntity> get copyWith =>
      __$$_LoginEntityCopyWithImpl<_$_LoginEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginEntityToJson(this);
  }
}

abstract class _LoginEntity implements LoginEntity {
  const factory _LoginEntity(
      {final dynamic server,
      final dynamic database,
      final dynamic login,
      final dynamic password}) = _$_LoginEntity;

  factory _LoginEntity.fromJson(Map<String, dynamic> json) =
      _$_LoginEntity.fromJson;

  @override
  dynamic get server => throw _privateConstructorUsedError;
  @override
  dynamic get database => throw _privateConstructorUsedError;
  @override
  dynamic get login => throw _privateConstructorUsedError;
  @override
  dynamic get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LoginEntityCopyWith<_$_LoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
