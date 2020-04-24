import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show Request;

class util {
  const util();

  static go(BuildContext context, String route,
      {Object arguments, replacement = false}) async {
    route = route ?? "homePage";
    return replacement
        ? Navigator.pushReplacementNamed(context, route, arguments: arguments)
        : Navigator.pushNamed(context, route, arguments: arguments);
  }

  static goTo(BuildContext context, String route, {Object arguments}) {
    return Navigator.pushNamedAndRemoveUntil(
        context, route, (route) => route == null);
  }

  static pushView(BuildContext context, StatefulWidget widget,
      {Object arguments}) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) => widget));
  }

  static back(BuildContext context) {
    return Navigator.of(context).pop();
  }

  static loadJson(BuildContext context, String path) async {
    String content = await DefaultAssetBundle.of(context).loadString(path);
    return json.decode(content);
  }

  static loadFile(BuildContext context, String path) async {
    return await DefaultAssetBundle.of(context).loadString(path);
  }

  static DateTime toDateTime(String dateStr) {
    String formattedString = dateStr.replaceAll("T", " ");
    formattedString =
        formattedString.substring(0, formattedString.lastIndexOf('.'));
    return DateTime.parse(formattedString);
  }

  static pushCode(String alias) async {
    await Request().dio.post("/api/code", data: {"alias": alias});
  }

  static bool hasMatch(String input, String pattern) {
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(input);
  }
}
