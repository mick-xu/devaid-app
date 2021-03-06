import 'package:flutter/material.dart';

final Map<String, ThemeData> themes = <String, ThemeData>{
  "blue": ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[200],
    backgroundColor: Colors.white,
    dividerColor: Colors.black26,
    dialogBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle: TextStyle(color: Colors.white70),
        subhead: TextStyle(color: Colors.white60),
        caption: TextStyle(color: Colors.white54),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      subtitle: TextStyle(color: Colors.white70),
      subhead: TextStyle(color: Colors.white60),
      caption: TextStyle(color: Colors.white54),
      body1: TextStyle(color: Colors.white60),
      body2: TextStyle(color: Colors.white54),
      display1: TextStyle(color: Colors.white30),
      display2: TextStyle(color: Colors.white24),
      display3: TextStyle(color: Colors.white12),
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Color.fromRGBO(68, 68, 68, 1.0), fontWeight: FontWeight.bold, fontSize: 14.0),
      subtitle: TextStyle(color: Colors.black54),
      caption: TextStyle(color: Colors.black38),
      subhead: TextStyle(color: Colors.black45),
      body1: TextStyle(color: Colors.black54, fontSize: 14),
      body2: TextStyle(color: Colors.black45, fontSize: 14),
      display1: TextStyle(color: Colors.black38),
      display2: TextStyle(color: Colors.black26),
      display3: TextStyle(color: Colors.black12),
      display4: TextStyle(color: Colors.grey[100]),
    ),
    hintColor: Colors.black26,
    tabBarTheme: TabBarTheme(labelColor: Colors.black54),
    iconTheme: IconThemeData(color: Colors.black45),
    accentIconTheme: IconThemeData(color: Colors.white54),
    primaryIconTheme: IconThemeData(color: Colors.black54),
    selectedRowColor: Colors.blueAccent,
  ),
  "red": ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.grey[200],
    backgroundColor: Colors.white,
    dividerColor: Colors.black26,
    dialogBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle: TextStyle(color: Colors.white70),
        subhead: TextStyle(color: Colors.white60),
        caption: TextStyle(color: Colors.white54),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      subtitle: TextStyle(color: Colors.white70),
      subhead: TextStyle(color: Colors.white60),
      caption: TextStyle(color: Colors.white54),
      body1: TextStyle(color: Colors.white60),
      body2: TextStyle(color: Colors.white54),
      display1: TextStyle(color: Colors.white30),
      display2: TextStyle(color: Colors.white24),
      display3: TextStyle(color: Colors.white12),
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      subtitle: TextStyle(color: Colors.black54),
      caption: TextStyle(color: Colors.black38),
      subhead: TextStyle(color: Colors.black45),
      body1: TextStyle(color: Colors.black54, fontSize: 14),
      body2: TextStyle(color: Colors.black45, fontSize: 14),
      display1: TextStyle(color: Colors.black38),
      display2: TextStyle(color: Colors.black26),
      display3: TextStyle(color: Colors.black12),
      display4: TextStyle(color: Colors.grey[100]),
    ),
    hintColor: Colors.black26,
    tabBarTheme: TabBarTheme(labelColor: Colors.black54),
    iconTheme: IconThemeData(color: Colors.black45),
    accentIconTheme: IconThemeData(color: Colors.white54),
    primaryIconTheme: IconThemeData(color: Colors.black54),
    selectedRowColor: Colors.blueAccent,
  ),
  "green": ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.grey[200],
    backgroundColor: Colors.white,
    dividerColor: Colors.black26,
    dialogBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle: TextStyle(color: Colors.white70),
        subhead: TextStyle(color: Colors.white60),
        caption: TextStyle(color: Colors.white54),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      subtitle: TextStyle(color: Colors.white70),
      subhead: TextStyle(color: Colors.white60),
      caption: TextStyle(color: Colors.white54),
      body1: TextStyle(color: Colors.white60),
      body2: TextStyle(color: Colors.white54),
      display1: TextStyle(color: Colors.white30),
      display2: TextStyle(color: Colors.white24),
      display3: TextStyle(color: Colors.white12),
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      subtitle: TextStyle(color: Colors.black54),
      caption: TextStyle(color: Colors.black38),
      subhead: TextStyle(color: Colors.black45),
      body1: TextStyle(color: Colors.black54, fontSize: 14),
      body2: TextStyle(color: Colors.black45, fontSize: 14),
      display1: TextStyle(color: Colors.black38),
      display2: TextStyle(color: Colors.black26),
      display3: TextStyle(color: Colors.black12),
      display4: TextStyle(color: Colors.grey[100]),
    ),
    hintColor: Colors.black26,
    tabBarTheme: TabBarTheme(labelColor: Colors.black54),
    iconTheme: IconThemeData(color: Colors.black45),
    accentIconTheme: IconThemeData(color: Colors.white54),
    primaryIconTheme: IconThemeData(color: Colors.black54),
    selectedRowColor: Colors.blueAccent,
  ),
  "orange": ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    primarySwatch: Colors.orange,
    scaffoldBackgroundColor: Colors.grey[200],
    backgroundColor: Colors.white,
    dividerColor: Colors.black26,
    dialogBackgroundColor: Color.fromRGBO(240, 240, 240, 1),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
            fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle: TextStyle(color: Colors.white70),
        subhead: TextStyle(color: Colors.white60),
        caption: TextStyle(color: Colors.white54),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      subtitle: TextStyle(color: Colors.white70),
      subhead: TextStyle(color: Colors.white60),
      caption: TextStyle(color: Colors.white54),
      body1: TextStyle(color: Colors.white60),
      body2: TextStyle(color: Colors.white54),
      display1: TextStyle(color: Colors.white30),
      display2: TextStyle(color: Colors.white24),
      display3: TextStyle(color: Colors.white12),
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
      subtitle: TextStyle(color: Colors.black54),
      caption: TextStyle(color: Colors.black38),
      subhead: TextStyle(color: Colors.black45),
      body1: TextStyle(color: Colors.black54, fontSize: 14),
      body2: TextStyle(color: Colors.black45, fontSize: 14),
      display1: TextStyle(color: Colors.black38),
      display2: TextStyle(color: Colors.black26),
      display3: TextStyle(color: Colors.black12),
      display4: TextStyle(color: Colors.grey[100]),
    ),
    hintColor: Colors.black26,
    tabBarTheme: TabBarTheme(labelColor: Colors.black54),
    iconTheme: IconThemeData(color: Colors.black45),
    accentIconTheme: IconThemeData(color: Colors.white54),
    primaryIconTheme: IconThemeData(color: Colors.black54),
    selectedRowColor: Colors.blueAccent,
  ),
  "dark": ThemeData(
    brightness: Brightness.dark,
    //primaryColor: Colors.teal,
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Colors.tealAccent,
    primaryColorDark: Colors.teal,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Color.fromRGBO(51, 51, 51, 1.0),
    backgroundColor: Color.fromRGBO(34, 34, 34, 1.0),
    dividerColor: Colors.black,
    dialogBackgroundColor: Colors.black54,
    cardColor: Color.fromRGBO(68, 68, 68, 1.0),
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        title: TextStyle(
            fontSize: 16.0, color: Colors.white70, fontWeight: FontWeight.bold),
        subtitle: TextStyle(color: Colors.white60),
        subhead: TextStyle(color: Colors.white54),
        caption: TextStyle(color: Colors.white30),
      ),
      iconTheme: IconThemeData(color: Colors.white70),
      actionsIconTheme: IconThemeData(color: Colors.white70),
    ),
    primaryTextTheme: TextTheme(
      title: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold),
      subtitle: TextStyle(color: Colors.white70),
      subhead: TextStyle(color: Colors.white60),
      caption: TextStyle(color: Colors.white54),
      body1: TextStyle(color: Colors.white60),
      body2: TextStyle(color: Colors.white54),
      display1: TextStyle(color: Colors.white30),
      display2: TextStyle(color: Colors.white24),
      display3: TextStyle(color: Colors.white10),
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14),
      subtitle: TextStyle(color: Colors.white54),
      subhead: TextStyle(color: Colors.greenAccent[600]),
      caption: TextStyle(color: Colors.greenAccent[600]),
      body1: TextStyle(color: Colors.white70, fontSize: 14),
      body2: TextStyle(color: Colors.white54, fontSize: 12),
      display1: TextStyle(color: Colors.black87),
      display2: TextStyle(color: Colors.black54),
      display3: TextStyle(color: Colors.black38),
      display4: TextStyle(color: Colors.black26),
      headline: TextStyle(color: Colors.black87),
    ),
    hintColor: Colors.black38,
    highlightColor: Colors.white70,
    tabBarTheme: TabBarTheme(
      labelColor: Colors.tealAccent,
      labelStyle: TextStyle(color: Colors.white70),
    ),
    iconTheme: IconThemeData(color: Colors.white54),
    accentIconTheme: IconThemeData(color: Colors.white54),
    primaryIconTheme: IconThemeData(color: Colors.white54),
    selectedRowColor: Colors.tealAccent,
  ),
};

const Map<String, String> themeNames = <String, String>{
  "blue": "蓝色主题",
  "red": "红色主题",
  "green": "绿色主题",
  "orange": "橙色主题",
  "dark": "深色主题"
};

final Map<String, dynamic> platforms = <String, dynamic>{
  "android": TargetPlatform.android,
  "fuchsia": TargetPlatform.fuchsia,
  "iOS": TargetPlatform.iOS,
};

const Map<String, String> platformNames = <String, String>{
  "android": "Android 风格",
  "fuchsia": "Fuchsia 风格",
  "iOS": "IOS 风格",
};
