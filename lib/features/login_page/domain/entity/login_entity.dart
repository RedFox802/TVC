import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_entity.g.dart';
part 'login_entity.freezed.dart';

@freezed
class LoginEntity with _$LoginEntity {
  const factory LoginEntity({
    @Default('') server,
    @Default('') database,
    @Default('') login,
    @Default('') password,
  }) = _LoginEntity;

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);
}
