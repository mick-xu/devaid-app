import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main_page.dart';
import 'package:flutter_app/pages/home/index.dart';
import 'package:flutter_app/pages/personal/index.dart';
import 'package:flutter_app/pages/demo/index.dart';
import 'package:flutter_app/pages/account/index.dart';
import 'package:flutter_app/pages/discovry/index.dart';


class routers {
  routers(@required this.context);

  final BuildContext context;

  Map<String, WidgetBuilder> get() {
    return {
      "mainPage": (context) => MainWidget(),
      "homePage": (context) => HomePage(),
      "demoPage": (context) => DemoPage(),
      "personalPage": (context) => PersonalPage(),
      "profilePage": (_) => ProfilePage(),
      "settingsPage": (_) => SettingsPage(),
      "feedbackPage": (_) => FeedbackPage(),
      "aboutPage": (_) => AboutPage(),
      "authorPage": (_) => AuthorPage(),
      "helpPage": (_) => HelpPage(),
      "qRViewPage": (_) => QRViewPage(),
      "signInPage": (_) => SignInPage(),
      "signUpPage": (_) => SignUpPage(),
      "retrievePasswordPage": (_) => RetrievePasswordPage(),
      "iconsPage": (ctx) => IconsPage(),
      "textPage": (_) => TextPage(),
      "buttonsPage": (_) => ButtonsPage(),
      "dialogPage": (_) => DialogPage(),
      "formPage": (_) => FormPage(),
      "languagePage": (_) => LanguagePage(),
      "themePage": (_) => ThemePage(),
      "platformPage": (_) => PlatformPage(),
      "resultPage": (_) => ResultPage(),
      "flutterSwiperPage": (_) => FlutterSwiperPage(),
      "deviceInfoPage": (_) => DeviceInfoPage(),
      "videoPlayerPage": (_) => VideoPlayerPage(),
      "pagesPage": (_) => PagesPage(),
      "layoutsPage": (_) => LayoutsPage(),
      "loginPage": (_) => LoginPage(),
      "webviewPage": (_) => WebViewPage(),
      "echartsWebViewPage": (_) => EchartsWebViewPage(),
    };
  }
}
