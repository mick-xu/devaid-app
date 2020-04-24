// Flutter code sample for material.BottomNavigationBar.1

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/utils/index.dart'
    show
        themes,
        platforms,
        CustomLocalizationsDelegate,
        FallbackCupertinoLocalisationsDelegate,
        supportedLocales,
        routers;
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/account/sign_in.dart';

Future<void> main() async {
  await init();
  runApp(MyApp());
}

Future<void> init() async {
  await MainStateModel().initPackageInfo();
  await MainStateModel().initTheme();
  await MainStateModel().initLocale();
  await MainStateModel().initUserInfo();
}

/// This Widget is the main application widget.
class MyApp extends StatefulWidget {
  final String _title = '开发助手';

  @override
  _MyAppSate createState() => _MyAppSate();
}

class _MyAppSate extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainStateModel>(
      model: MainStateModel(),
      child: ScopedModelDescendant<MainStateModel>(
        builder: (context, child, model) {
          return MaterialApp(
            title: widget._title,
            theme: themes[model.themeName]
                .copyWith(platform: platforms[model.platformName]),
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              CustomLocalizationsDelegate(context),
              FallbackCupertinoLocalisationsDelegate(),
            ],
            //supportedLocales: S.delegate.supportedLocales,
            supportedLocales: supportedLocales.values,
            localeResolutionCallback:
                (Locale locale, Iterable<Locale> supportedLocales) {
              return model.getLocale(locale);
            },
            locale: model.locale.toString() == "default" ? null : model.locale,
            routes: routers(context).get(),
            home: model.token == null ? SignInPage() : MainWidget(),
          );
        },
      ),
    );
  }
}
