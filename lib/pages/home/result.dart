import 'package:flutter/material.dart';
import 'package:ali_icons/ali_icons.dart';
import 'package:flutter_app/utils/index.dart' show util;

class ResultPage extends StatefulWidget {
  ResultPage({this.title, this.icon, this.message});

  final String title;
  final Widget icon;
  final String message;

  @override
  ResultPageSate createState() => ResultPageSate();
}

class ResultPageSate extends State<ResultPage> {
  String _title;
  Widget _icon;
  String _message;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    if (args != null) {
      _title = args['title'] ?? "";
      _icon = args['icon'] ?? Icon(AliIcons.smiling_face, size: 130, color: Colors.orange);
      _message = args['message'] ?? "恭喜，执行成功！";
    } else {
      _title = widget.title ?? "";
      _message = widget.message ?? "";
      _icon = widget.icon ?? Icon(AliIcons.smiling_face, size: 130, color: Colors.orange);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SafeArea(
        child: Center(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              _icon,
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  _message,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                  textColor: Theme.of(context).textTheme.subtitle.color,
                  child: Text("返回"),
                  onPressed: () => util.back(context),
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 80)),
            ],
          ),
        ),
      ),
    );
  }
}
