import 'package:flutter/material.dart';
import 'package:ali_icons/ali_icons.dart';

List<WidgetMenu> WidgetMenus = <WidgetMenu>[
  new WidgetMenu("图标", icon: AliIcons.icon, subtitle: "", view: "iconsPage"),
  new WidgetMenu("文本", icon: AliIcons.txt, subtitle: "", view: "textPage"),
  new WidgetMenu("按钮", icon: AliIcons.btn, subtitle: "", view: "buttonsPage"),
  new WidgetMenu("弹出框", icon: AliIcons.dialog, subtitle: "", view: "dialogPage"),
  new WidgetMenu("表单", icon: AliIcons.input, subtitle: "", view: "formPage"),
];

class WidgetMenu {
  WidgetMenu(this.title, {this.icon, this.subtitle, this.view = ""});

  final IconData icon;
  final String title;
  final String subtitle;
  final String view;
}
