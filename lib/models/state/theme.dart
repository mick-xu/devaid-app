import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/utils/theme_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin themeModel on Model {
  static String _themeName = themes.keys.elementAt(0);
  static String _platformName = platforms.keys.elementAt(0);

  String get themeName => _themeName;

  String get platformName => _platformName;

  Future<void> changeTheme(String themeName) async {
    _themeName = themeName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("theme", _themeName);
    notifyListeners();
  }

  Future<void> changePlatform(String platformName) async {
    _platformName = platformName;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("platform", _platformName);
    notifyListeners();
  }

  Future<void> initTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String theme = await prefs.getString("theme");
    _themeName = theme ?? themes.keys.elementAt(0);
    String platform = await prefs.getString("platform");
    _platformName = platform ?? platforms.keys.elementAt(0);
  }
}
