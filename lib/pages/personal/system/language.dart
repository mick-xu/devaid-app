import 'package:flutter/material.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/utils/index.dart'
    show supportedLocales, localeNames, L;
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_app/widgets/index.dart' show SelectList;

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _currentLocale;

  setLocale(selectedLocale) {
    setState(() {
      MainStateModel().of(context).changeLocale(locale: selectedLocale);
    });
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    _currentLocale = MainStateModel().of(context).locale.toString();
    Map<String, Locale> _map = supportedLocales;
    //S.delegate.supportedLocales.forEach((e) => _map[e.languageCode] = e);

    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.Language),
        centerTitle: true,
      ),
      body: SelectList(
        _map,
        current: _currentLocale,
        names: localeNames,
        callback: setLocale,
      ),
    );
  }
}
