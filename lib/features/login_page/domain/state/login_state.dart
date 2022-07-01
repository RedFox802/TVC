import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/login_entity.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoginEntity()) final LoginEntity loginEntity,
    @Default(false) final bool error,
    @Default(false) final bool connect,
    @Default(false) final bool loading,
  }) = _LoginState;
}
