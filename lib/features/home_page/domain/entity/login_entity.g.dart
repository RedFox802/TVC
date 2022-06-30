// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginEntity _$$_LoginEntityFromJson(Map<String, dynamic> json) =>
    _$_LoginEntity(
      server: json['server'] ?? '',
      database: json['database'] ?? '',
      login: json['login'] ?? '',
      password: json['password'] ?? '',
    );

Map<String, dynamic> _$$_LoginEntityToJson(_$_LoginEntity instance) =>
    <String, dynamic>{
      'server': instance.server,
      'database': instance.database,
      'login': instance.login,
      'password': instance.password,
    };
