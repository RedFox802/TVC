import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/features/login_page/domain/state/login_state.dart';

import '../auth/firebase_auth_service.dart';
import '../data/login_data_storage.dart';
import 'entity/login_entity.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          const LoginState(),
        );

  final LoginDataStorage _loginDataStorage = LoginDataStorage();
  final FirebaseAuthService _authService = FirebaseAuthService();

  Future<void> loadLoginData() async {
    try {
      emit(state.copyWith(loading: true));
      List<String> data = await _loginDataStorage.loadData();
      if (data.isNotEmpty) {
        LoginEntity currentEntity = LoginEntity(
          server: data[0],
          database: data[1],
          login: data[2],
          password: data[3],
        );
        emit(state.copyWith(loginEntity: currentEntity, loading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: true));
    }
  }

  Future<void> saveLoginData(
      String server, String database, String login, String password) async {
    try {
      List<String> data = [server, database, login, password];
      await _loginDataStorage.saveData(data: data);
    } catch (e) {
      emit(state.copyWith(error: true));
    }
  }

  Future<void> loginIn(String email, String password) async {
    try {
      emit(state.copyWith(loading: true));
      bool isAuth = await _authService.loginIn(email, password);
      if (isAuth) {
        emit(state.copyWith(loading: false, connect: true));
      } else {
        emit(state.copyWith(error: true,loading: false));
      }
    } catch (e) {
      emit(state.copyWith(error: true,loading: false));
    }
  }
}
