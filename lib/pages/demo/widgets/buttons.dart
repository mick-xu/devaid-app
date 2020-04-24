import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show Header;
import 'package:flutter_app/utils/index.dart' show util;

class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key key}) : super(key: key);

  final double spacing = 20.0;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args["title"]),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header(
              title: "漂浮按钮 RaisedButton",
              suffix: "查看代码",
              action: () => util.pushCode("raised_button"),
            ),
            Padding(
              padding: EdgeInsets.all(spacing),
              child: Row(
                children: <Widget>[
                  RaisedButton(child: Text("按钮"), onPressed: () => {}),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("按钮"),
                    onPressed: () => {},
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text("按钮"),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            Header(
              title: "扁平按钮 FlatButton",
              suffix: "查看代码",
              action: () => util.pushCode("flat_button"),
            ),
            Padding(
              padding: EdgeInsets.all(spacing),
              child: Row(
                children: <Widget>[
                  FlatButton(child: Text("按钮"), onPressed: () => {}),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text("按钮"),
                    onPressed: () => {},
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: Colors.orange,
                    textColor: Colors.white,
                    child: Text("按钮"),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            Header(
              title: "OutlineButton",
              suffix: "查看代码",
              action: () => util.pushCode("outline_button"),
            ),
            Padding(
              padding: EdgeInsets.all(spacing),
              child: Row(
                children: <Widget>[
                  OutlineButton(child: Text("按钮"), onPressed: () => {}),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  OutlineButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text("按钮"),
                    onPressed: () => {},
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  OutlineButton(
                    textColor: Colors.blue,
                    child: Text(
                      "按钮",
                      style: TextStyle(fontSize: 12),
                    ),
                    borderSide: BorderSide(color: Colors.blue),
                    shape: CircleBorder(),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            Header(
              title: "图标按钮 IconButton",
              suffix: "查看代码",
              action: () => util.pushCode("icon_button"),
            ),
            Padding(
              padding: EdgeInsets.all(spacing),
              child: Row(
                children: <Widget>[
                  IconButton(
                    color: Colors.lightBlueAccent,
                    icon: Icon(Icons.wifi),
                    splashColor: Colors.blue,
                    highlightColor: Colors.blueAccent,
                    tooltip: "点击开启 Wifi",
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            Header(
              title: "MaterialButton",
              suffix: "查看代码",
              action: () => util.pushCode("material_button"),
            ),
            Padding(
              padding: EdgeInsets.all(spacing),
              child: Row(
                children: <Widget>[
                  MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(5),
                    height: 36,
                    minWidth: MediaQuery.of(context).size.width - 40,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Icon(
                          Icons.exit_to_app,
                          size: 17,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 3)),
                        Text("退出")
                      ],
                    ),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            Header(
              title: "CupertinoButton",
              suffix: "查看代码",
              action: () => util.pushCode("cupertino_button"),
            ),
            Padding(
              padding: EdgeInsets.all(spacing),
              child: Row(
                children: <Widget>[
                  CupertinoButton(
                    color: Colors.blueAccent,
                    child: Text("确定"),
                    onPressed: () => {},
                  ),
                ],
              ),
            ),
            Header(
              title: "漂浮按钮 FloatingActionButton",
              suffix: "查看代码",
              action: () => util.pushCode("floating_action_button"),
            ),
            Padding(padding: EdgeInsets.all(spacing * 2)),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          // Add your onPressed code here!
//        },
//        child: Icon(Icons.thumb_up),
//        backgroundColor: Colors.pink,
//        isExtended: true,
//        tooltip: "点赞",
//      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('攒'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
        tooltip: '点赞了',
      ),
    );
  }
}
