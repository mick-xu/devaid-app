import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show themes, themeNames, L;
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_app/widgets/index.dart' show SelectList;

class ThemePage extends StatefulWidget {
  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  String _currentTheme = "";

  setTheme(selectedTheme) {
    setState(() {
      MainStateModel().of(context).changeTheme(selectedTheme);
    });
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    _currentTheme = MainStateModel().of(context).themeName;
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.Theme),
        centerTitle: true,
      ),
      body: SelectList<ThemeData>(
        themes,
        current: _currentTheme,
        names: themeNames,
        callback: setTheme,
      ),
    );
  }
}
