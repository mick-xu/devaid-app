import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ali_icons/ali_icons.dart';
import 'package:flutter_app/utils/index.dart'
    show InfoTypes, L, util, aliyunOss;
import 'package:flutter_app/widgets/index.dart'
    show CircleImage, Loading, FormText, Toast;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageSate();
}

class _LoginPageSate extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameEditingController, _passwordEditingController;

  bool _obscureText = true;
  String _password;
  IconData _eyeIcon = AliIcons.eye_close;

  changeEye() {
    setState(() {
      _obscureText = !_obscureText;
      _eyeIcon = _obscureText ? AliIcons.eye_close : AliIcons.eye_open;
    });
  }

  @override
  void initState() {
    _userNameEditingController = TextEditingController(text: "");
    _passwordEditingController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("登录界面"),
          actions: <Widget>[
            FlatButton(
              onPressed: () => {},
              child: Text(
                "查看代码",
                style: TextStyle(
                    color: Theme.of(context).appBarTheme.textTheme.title.color),
              ),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("$aliyunOss/upload/2019/00/login-bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: CircleImage(
                    "$aliyunOss/upload/2019/00/avatar-female.jpg",
                    radius: 48.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        cursorColor: Colors.white30,
                        maxLength: 11,
                        maxLengthEnforced: true,
                        keyboardType: TextInputType.number,
                        controller: _userNameEditingController,
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          hintText: "请输入手机号",
                          hintStyle: TextStyle(color: Colors.white70),
                          contentPadding: const EdgeInsets.all(0.0),
                          prefixIcon: Icon(
                            AliIcons.user_outline,
                            size: 28.0,
                            color: Colors.white70,
                          ),
                          suffixIcon: null,
                          counter: Text(""),
                          errorText: "",
                          filled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).highlightColor),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '';
                          }
                        },
                        onSaved: (value) => {},
                      ),
                      TextFormField(
                        cursorColor: Colors.white30,
                        maxLength: 11,
                        maxLengthEnforced: true,
                        obscureText: _obscureText,
                        keyboardType: TextInputType.number,
                        controller: _userNameEditingController,
                        decoration: InputDecoration(
                          fillColor: Colors.black12,
                          hintText: "请输入密码",
                          hintStyle: TextStyle(color: Colors.white70),
                          contentPadding: const EdgeInsets.all(0.0),
                          prefixIcon: Icon(
                            AliIcons.lock_outline,
                            size: 28.0,
                            color: Colors.white70,
                          ),
                          suffixIcon: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            child: Icon(
                              _eyeIcon,
                              color: Colors.white70,
                              size: 20,
                            ),
                            onTap: () => changeEye(),
                          ),
                          counter: Text(""),
                          errorText: "",
                          filled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).highlightColor),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return '';
                          }
                        },
                        onSaved: (value) => {},
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: MaterialButton(
                          color: Color.fromRGBO(0, 120, 255, 0.6),
                          textColor: Colors.white,
                          minWidth: MediaQuery.of(context).size.width,
                          height: 42,
                          child: Text(i18n.Login),
                          onPressed: () async {
                            final form = _formKey.currentState;
                            if (form.validate()) {
                              Loading(context, displayBackground: true).start();
                              form.save();
                              new Timer(Duration(seconds: 3), () {
                                Loading(context, displayBackground: true)
                                    .stop();
                                Toast(context, icon: InfoTypes.success)
                                    .show("登录成功");
                              });
                            } else {
                              Toast(context, icon: InfoTypes.warning)
                                  .show("请输入用户名密码");
                            }
                          },
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              child: Text("忘记密码？",
                                  style: TextStyle(color: Colors.white70)),
                              onTap: () => {},
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              child: Text(
                                "立即注册",
                                style: TextStyle(color: Colors.white70),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Positioned(
                          top: -6.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Divider(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            height: 24,
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 2,
                            ),
                            child: Text(
                              "快捷登录",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Icon(
                              AliIcons.qq_circle,
                              color: Colors.white70,
                              size: 36,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              AliIcons.wechat_circle,
                              color: Colors.white70,
                              size: 36,
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              AliIcons.alipay_outline,
                              color: Colors.white70,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
