import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //helper
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static const String isLoginPrefs = "isLoginPrefs";

  static Future<bool> isLogin() async {
    final p = await prefs;
    return p.getBool(isLoginPrefs) ?? false;
  }

  static Future setLogin(bool value) async {
    final p = await prefs;
    return p.setBool(isLoginPrefs, value);
  }
}
