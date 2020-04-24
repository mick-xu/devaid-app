import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/widgets/index.dart' show Header;
import 'package:flutter_app/utils/index.dart' show util;

class DialogPage extends StatefulWidget {
  const DialogPage({Key key}) : super(key: key);

  @override
  DialogPageState createState() => DialogPageState();
}

class DialogPageState extends State<DialogPage> {
  PersistentBottomSheetController _bootSheet;
  bool closed = true;
  final double spacing = 16.0;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args["title"]),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext _context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Header(
                  title: "BottomSheet",
                  suffix: "查看代码",
                  action: () => util.pushCode("bottom_sheet"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () {
                          _bootSheet = Scaffold.of(_context).showBottomSheet(
                            (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(20),
                                height: 100,
                                width: MediaQuery.of(_context).size.width,
                                child: Text("BottomSheet"),
                              );
                            },
                          );
                          closed = false;
                        },
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                      RaisedButton(
                        child: Text("关闭"),
                        onPressed: () {
                          if (!closed) {
                            _bootSheet.close();
                            _bootSheet.closed.whenComplete(
                              () => {closed = mounted},
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Header(
                  title: "ModalBottomSheet",
                  suffix: "查看代码",
                  action: () => util.pushCode("modal_bottomSheet"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () => {
                          showModalBottomSheet(
                            context: _context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 100.0,
                                padding: EdgeInsets.all(20),
                                child: Text("ModalBottomSheet 点击遮罩层时消失"),
                              );
                            },
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                Header(
                  title: "SnackBar",
                  suffix: "查看代码",
                  action: () => util.pushCode("snack_bar"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () => {
                          Scaffold.of(_context).showSnackBar(
                            SnackBar(
                              duration: Duration(seconds: 2),
                              content: Container(
                                height: 120,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "SnackBar",
                                    ),
                                    Text(
                                      "2s 后自动关闭",
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        },
                      ),
                    ],
                  ),
                ),
                Header(
                  title: "AlertDialog",
                  suffix: "查看代码",
                  action: () => util.pushCode("alert_dialog"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () async => showDialog(
                          context: _context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("AlertDialog"),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text("AlertDialog 弹窗内容"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("取消"),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Header(
                  title: "SimpleDialog",
                  suffix: "查看代码",
                  action: () => util.pushCode("simple_dialog"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () async => showDialog(
                          context: _context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text("SimpleDialog"),
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {},
                                      child: const Text('确定'),
                                    ),
                                    SimpleDialogOption(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('关闭弹窗'),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Header(
                  title: "CupertinoActionSheet",
                  suffix: "查看代码",
                  action: () => util.pushCode("cupertino_action_sheet"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () async => showCupertinoModalPopup(
                          context: _context,
                          builder: (BuildContext context) {
                            return CupertinoActionSheet(
                              title: Text(
                                "选择头像",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              message: Text("请使用相机拍照或者从相册中选择一张照片"),
                              actions: <Widget>[
                                CupertinoActionSheetAction(
                                    onPressed: () => {}, child: Text("相机")),
                                CupertinoActionSheetAction(
                                    onPressed: () => {}, child: Text('相册')),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: Text('取消'),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Header(
                  title: "CupertinoAlertDialog",
                  suffix: "查看代码",
                  action: () => util.pushCode("cupertino_alert_dialog"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () async => showCupertinoDialog(
                          context: _context,
                          builder: (_context) {
                            return CupertinoAlertDialog(
                              title: Text("CupertinoAlertDialog"),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text("CupertinoAlertDialog 弹窗内容"),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                new CupertinoDialogAction(
                                  child: new Text('取消'),
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                new CupertinoDialogAction(
                                  child: new Text('确定'),
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
//                Header(
//                  title: "CupertinoDialog",
//                  suffix: "查看代码",
//                  action: () => util.pushCode("cupertino_dialog"),
//                ),
//                Padding(
//                  padding: EdgeInsets.symmetric(vertical: spacing),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      RaisedButton(
//                        child: Text("弹出"),
//                        onPressed: () async => showCupertinoDialog(
//                          context: _context,
//                          builder: (_context) {
//                            return CupertinoDialog(
//                              child: ListBody(
//                                children: <Widget>[
//                                  Text("CupertinoDialog"),
//                                  Text("已弃用"),
//                                ],
//                              ),
//                            );
//                          },
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
                Header(
                  title: "自定义弹窗",
                  suffix: "查看代码",
                  action: () => util.pushCode("custom_dialog"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: spacing),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("弹出"),
                        onPressed: () async => showGeneralDialog(
                          context: _context,
                          barrierLabel: "自定义弹窗",
                          transitionDuration: Duration(milliseconds: 300),
                          barrierDismissible: true,
                          pageBuilder: (BuildContext context,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Center(
                              child: Container(
                                height: 80.0,
                                color: Color.fromRGBO(0, 0, 0, 0.6),
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    CircularProgressIndicator(
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 0.3),
                                      strokeWidth: 2.0,
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.grey[200]),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 3.0)),
                                    Text(
                                      "Loading",
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
