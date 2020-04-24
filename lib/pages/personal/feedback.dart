import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show Selector;

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  Map<int, String> _types = <int, String>{1: '问题反馈', 2: '意见建议'};
  int _type = 1;

  @override
  Widget build(BuildContext context) {
    // feedback
    return Scaffold(
      appBar: AppBar(
        title: Text("反馈建议"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Text(
                      "选择类型",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    child: Selector(
                      _types,
                      value: _type,
                      onChange: (value) => setState(() {
                        _type = value;
                      }),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Text(
                      "详细描述",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      minLines: 5,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Text(
                      "图片上传",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      children: <Widget>[
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                          ),
                          child: Container(
                            color: Theme.of(context).dialogBackgroundColor,
                            padding: EdgeInsets.all(24.0),
                            margin: EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).textTheme.caption.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Text(
                      "联系方式",
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    color: Theme.of(context).backgroundColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        hintText: "请输入联系方式",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: MaterialButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text("正在开发中"),
                              titlePadding: EdgeInsets.all(16.0),
                            );
                          }),
                      minWidth: MediaQuery.of(context).size.width,
                      height: 42,
                      color: Theme.of(context).primaryColor,
                      textColor:
                          Theme.of(context).appBarTheme.textTheme.title.color,
                      child: Text("提交"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
