import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart'
    show util, themeNames, themes, L, localeNames, platforms, platformNames;
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_app/widgets/index.dart' show MenuTile;

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.SystemSettings),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext _context) {
          return Column(
            children: <Widget>[
              Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: <Widget>[
                    MenuTile(
                      title: Text(i18n.Language),
                      trailing: Text(
                        localeNames[
                            MainStateModel().of(context).locale.toString()],
                      ),
                      onTap: () => util.go(context, "languagePage"),
                    ),
                    Divider(height: 1.0, indent: 16.0),
                    MenuTile(
                      title: Text(i18n.Theme),
                      trailing: Text(
                        themeNames[MainStateModel().of(context).themeName],
                      ),
                      onTap: () => util.go(context, "themePage"),
                    ),
                    Divider(height: 1.0, indent: 16.0),
                    MenuTile(
                      title: Text(i18n.Platform),
                      trailing: Text(
                        platformNames[
                            MainStateModel().of(context).platformName],
                      ),
                      onTap: () => util.go(context, "platformPage"),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
