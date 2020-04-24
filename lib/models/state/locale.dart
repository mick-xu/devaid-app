import 'dart:ui';

import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/utils/constant.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin localeModel on Model {
  static String _locale = supportedLocales.values.elementAt(0).toString();
      //S.delegate.supportedLocales.firstWhere((item)=> item.toString() == "en_" ).toString();

  get locale => _toLocale(_locale);

  Future<void> changeLocale({String locale}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _locale = locale;
    await prefs.setString("locale", _locale.toString());
    notifyListeners();
  }

  Future<void> initLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedLocaleInfo = await prefs.getString("locale");
    if (savedLocaleInfo != null && savedLocaleInfo != "default") {
      _locale = savedLocaleInfo;
    }
  }

  Locale getLocale(Locale locale) {
    return _locale == "default" ? locale : _toLocale(_locale);
  }

  Locale _toLocale(String localeName) {
    if (localeName.contains("_")) {
      List<String> code = localeName.split('_');
      return Locale(code[0], code[1]);
    }
    return Locale(localeName);
  }
}
