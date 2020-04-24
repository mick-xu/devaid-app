import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show FormText;
import 'package:ali_icons/ali_icons.dart';

class RetrievePasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RetrievePasswordPageSate();
}

class _RetrievePasswordPageSate extends State<RetrievePasswordPage> {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("找回密码"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                FormText(
                  hintText: "请输入手机号码",
                  prefixIcon: Icon(
                    AliIcons.user_outline,
                    size: 28.0,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {},
                    child: Text(
                      "下一步",
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryTextTheme.title.color),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
