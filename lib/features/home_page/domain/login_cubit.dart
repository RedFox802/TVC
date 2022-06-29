
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/features/home_page/domain/entity/login_entity.dart';
import 'package:tv/features/home_page/domain/state/login_state.dart';

import '../data/login_data_storage.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginDataStorage _loginDataStorage = LoginDataStorage();

  LoginCubit()
      : super(
          const LoginState(),
        );

  Future<void> loadLoginData() async {
    try {
      List<String> data = await _loginDataStorage.loadData();
      if (data.isNotEmpty) {
        LoginEntity currentEntity = LoginEntity(
          server: data[0],
          database: data[1],
          login: data[2],
          password: data[3],
        );
        emit(state.copyWith(loginEntity: currentEntity));
      }
    } catch (e) {
      emit(state.copyWith(error: true));
    }
  }

  Future<void> saveLoginData(
      String server, String database, String login, String password) async {
    try {
      log('я тут');
      log(server);
      log(login);
      log(database);
      log(password);
      List<String> data = [server, database, login, password];
      log(data.length.toString());
      await _loginDataStorage.saveData(data: data);
    } catch (e) {
      emit(state.copyWith(error: true));
    }
  }
}
