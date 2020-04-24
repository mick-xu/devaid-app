import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/index.dart'
    show AppLocales, supportedLocales, util;

class L {
  L(this._localizedValues);

  Map<String, dynamic> _localizedValues;

  static L of(BuildContext context) {
    return Localizations.of<L>(context, L);
  }

  String get Home {
    return _localizedValues['Home'];
  }

  String get Personal {
    return _localizedValues['Personal'];
  }

  String get Discover {
    return _localizedValues['Discover'];
  }

  String get Settings {
    return _localizedValues['Settings'];
  }

  String get Message {
    return _localizedValues['Message'];
  }

  String get Menu {
    return _localizedValues['Menu'];
  }

  String get Theme {
    return _localizedValues['Theme'];
  }

  String get Language {
    return _localizedValues['Language'];
  }

  String get Platform {
    return _localizedValues['Platform'];
  }

  String get Upgrade {
    return _localizedValues['Upgrade'];
  }

  String get CheckVersion {
    return _localizedValues['CheckVersion'];
  }

  String get Login {
    return _localizedValues['Login'];
  }

  String get Logout {
    return _localizedValues['Logout'];
  }

  String get Signup {
    return _localizedValues['Signup'];
  }

  String get Account {
    return _localizedValues['Account'];
  }

  String get UserName {
    return _localizedValues['UserName'];
  }

  String get Password {
    return _localizedValues['Password'];
  }

  String get ForgotPassword {
    return _localizedValues['ForgotPassword'];
  }

  String get Mobile {
    return _localizedValues['Mobile'];
  }

  String get Email {
    return _localizedValues['Email'];
  }

  String get NickName {
    return _localizedValues['NickName'];
  }

  String get Avatar {
    return _localizedValues['Avatar'];
  }

  String get Name {
    return _localizedValues['Name'];
  }

  String get Birthday {
    return _localizedValues['Birthday'];
  }

  String get Gender {
    return _localizedValues['Gender'];
  }

  String get FullName {
    return _localizedValues['FullName'];
  }

  String get Location {
    return _localizedValues['Location'];
  }

  String get Address {
    return _localizedValues['Address'];
  }

  String get School {
    return _localizedValues['School'];
  }

  String get Friends {
    return _localizedValues['Friends'];
  }

  String get Mine {
    return _localizedValues['Mine'];
  }

  String get Common {
    return _localizedValues['Common'];
  }

  String get Profile {
    return _localizedValues['Profile'];
  }

  String get SystemSettings {
    return _localizedValues['SystemSettings'];
  }

  String get About {
    return _localizedValues['About'];
  }

  String get Feedback {
    return _localizedValues['Feedback'];
  }

  String get Search {
    return _localizedValues['Search'];
  }

  String get PleaseInputKeywords {
    return _localizedValues['PleaseInputKeywords'];
  }

  String get Keywords {
    return _localizedValues['Keywords'];
  }

  String get Back {
    return _localizedValues['Back'];
  }

  String get Next {
    return _localizedValues['Next'];
  }

  String get Scan {
    return _localizedValues['Scan'];
  }

  String get QRCode {
    return _localizedValues['QRCode'];
  }

  String get More {
    return _localizedValues['More'];
  }

  String get Demo {
    return _localizedValues['Demo'];
  }

  String get Help {
    return _localizedValues['Help'];
  }

  String get Favorite {
    return _localizedValues['Favorite'];
  }

  String get Share {
    return _localizedValues['Share'];
  }

  String get Edit {
    return _localizedValues['Edit'];
  }

  String get Delete {
    return _localizedValues['Delete'];
  }

  String get Add {
    return _localizedValues['Add'];
  }

  String get Save {
    return _localizedValues['Save'];
  }

  String get Submit {
    return _localizedValues['Submit'];
  }

  String get Config {
    return _localizedValues['Config'];
  }

  String get Reset {
    return _localizedValues['Reset'];
  }

  String get NextStep {
    return _localizedValues['NextStep'];
  }

  String get Completed {
    return _localizedValues['Completed'];
  }

  String get Icons {
    return _localizedValues['Icons'];
  }

  String get IconLibrary {
    return _localizedValues['IconLibrary'];
  }

  String get Widget {
    return _localizedValues['Widget'];
  }

  String get Widgets {
    return _localizedValues['Widgets'];
  }

  String get Components {
    return _localizedValues['Components'];
  }

  String get Plugins {
    return _localizedValues['Plugins'];
  }

  String get Layout {
    return _localizedValues['Layout'];
  }

  String get Text {
    return _localizedValues['Text'];
  }
}

class CustomLocalizationsDelegate extends LocalizationsDelegate<L> {
  CustomLocalizationsDelegate(this.context);

  BuildContext context;

  @override
  bool isSupported(Locale locale) {
    return supportedLocales.values.contains(locale);
  }

  @override
  Future<L> load(Locale locale) async {
    var localizedValues =
        await util.loadJson(context, "lib/locales/$locale.json");
    return SynchronousFuture<L>(L(localizedValues));
  }

  @override
  bool shouldReload(LocalizationsDelegate<L> old) {
    return false;
  }
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}
