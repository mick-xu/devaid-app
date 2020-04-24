import 'package:flutter/material.dart';

const Map<String, Locale> supportedLocales = <String, Locale>{
  "default": Locale("default"),
  "en_US": Locale('en', "US"),
  "zh_CN": Locale('zh', "CN"),
  "zh_TW": Locale('zh', "TW"),
};

const Map<String, String> localeNames = {
  "default": "跟随系统",
  "en_US": "English",
  "zh_CN": "简体中文",
  "zh_TW": "繁体中文"
};

const dev_env = false;

const String host =
    dev_env ? "http://192.168.0.128:5000/" : "http://nas.devaid.cn:8092/";

const String aliyunOss = "https://devaid.oss-cn-qingdao.aliyuncs.com";

class Page {
  get p401 => "box_401";

  get p403 => "star_403";

  get p404 => "star_404";

  get p500 => "star_500";
}

class RegPattern {
  static String get mobileNumber => r"^1(3|4|5|7|8)\d{9}$";
}

class InfoTypes {
  InfoTypes._();

  static const IconData error = Icons.cancel;
  static const IconData warning = Icons.error;
  static const IconData success = Icons.check_circle;
}
