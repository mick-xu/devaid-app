import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show Header;
import 'package:flutter_app/utils/index.dart' show util;

class TextPage extends StatelessWidget {
  const TextPage({ Key key}) : super(key: key);

  final Padding _padding =
      const Padding(padding: EdgeInsets.symmetric(vertical: 10.0));

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text(args['title']),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(
                title: "文本",
                suffix: "查看代码",
                action: () => util.pushCode("text"),
              ),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "这是一行纯文本",
                          ),
                        ],
                      ),
                      _padding,
                      Row(
                        children: <Widget>[
                          Text(
                            "这是一行纯文本",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                      _padding,
                      Row(
                        children: <Widget>[
                          Text("这是一行纯文本",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      _padding,
                      Row(
                        children: <Widget>[
                          Text("这是一行纯文本",
                              style: TextStyle(
                                  fontFamily: 'minicircle',
                                  color: Colors.blue)),
                        ],
                      ),
                      _padding,
                      Row(
                        children: <Widget>[
                          Text("这是一行纯文本", style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                      _padding,
                      Container(
                        child: Text(
                          "这是一段纯文本，当文字长度超出屏幕尺寸部分会自动换行！",
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        ),
                      ),
                      _padding,
                      Container(
                        child: Text(
                          "这是一段纯文本，当文字长度超出屏幕尺寸部分会隐藏起来！",
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                      _padding,
                      Row(
                        children: <Widget>[
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text: "这是",
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: "一段",
                                    style: TextStyle(
                                        color: Colors.purpleAccent,
                                        fontStyle: FontStyle.italic)),
                                TextSpan(
                                    text: "富文本",
                                    style: TextStyle(
                                        color: Colors.pink, fontSize: 18.0))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
