import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LoginDataStorage {

  Future<void> saveData({required List<String> data}) async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setStringList('login_data', data);
      log('готово');
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> loadData() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();

      final cityList = sharedPreferences.containsKey('login_data')
          ? sharedPreferences.getStringList('login_data')
          : null;

      return cityList ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
