import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesTest  {

  Future<bool>  getcheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = 'check';
    bool value = prefs.getBool(key);
    return value;
  }

  setcheck(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = 'check';

    prefs.setBool(key, value);
    print('saved $value');
    prefs.setBool("check", value);

  }
  Future<bool>  getlogincheck() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = 'logincheck';
    bool value = prefs.getBool(key);
    return value;
  }

  setlogincheck(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final key = 'logincheck';

    prefs.setBool(key, value);
    print('saved $value');
    prefs.setBool("logincheck", value);

  }

}