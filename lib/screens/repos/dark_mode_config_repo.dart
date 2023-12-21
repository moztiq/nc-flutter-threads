import 'package:shared_preferences/shared_preferences.dart';

class DarkModeConfigRepository {
  static const String darkMode = 'darkMode';
  SharedPreferences _preferences;

  DarkModeConfigRepository(this._preferences);

  bool isDarkMode() {
    return _preferences.getBool(darkMode) ?? false;
  }

  Future<void> setDarkMode(bool value) async {
    await _preferences.setBool(darkMode, value);
  }
}
