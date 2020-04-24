import 'package:flutter/material.dart';
import 'package:ali_icons/ali_icons.dart';
import 'package:flutter_app/utils/index.dart' show InfoTypes, L, util;
import 'package:flutter_app/models/index.dart' show MainStateModel;
import 'package:flutter_app/widgets/index.dart'
    show CircleImage, Loading, FormText, Toast;
import 'package:flutter_app/api/index.dart'
    show Account, UserInfo, ResultWithToken, Result, Token;

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInPageSate();
}

class _SignInPageSate extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameEditingController, _passwordEditingController;

  bool _obscureText = true;
  UserInfo _userInfo;
  String _password;
  String _tips;

  @override
  void initState() {
    _userInfo = MainStateModel().userInfo;
    _userNameEditingController =
        TextEditingController(text: _userInfo.userName ?? "");
    _passwordEditingController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: CircleImage(
                  _userInfo.avatar,
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
                    FormText(
                      hintText: "请输入手机号",
                      maxLength: 11,
                      maxLengthEnforced: true,
                      keyboardType: TextInputType.number,
                      controller: _userNameEditingController,
                      prefixIcon: Icon(
                        AliIcons.user_outline,
                        size: 28.0,
                        color: Theme.of(context).hintColor,
                      ),
                      onSaved: (value) => _userInfo.userName = value,
                    ),
                    FormText(
                      hintText: "请输入密码",
                      obscureText: _obscureText,
                      maxLength: 16,
                      keyboardType: TextInputType.text,
                      controller: _passwordEditingController,
                      prefixIcon: Icon(
                        AliIcons.lock_outline,
                        size: 26.0,
                        color: Theme.of(context).hintColor,
                      ),
                      errorText: _tips,
                      onSaved: (value) => _password = value,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: MaterialButton(
                        color: Theme.of(context).primaryColor,
                        textColor:
                            Theme.of(context).appBarTheme.textTheme.title.color,
                        minWidth: MediaQuery.of(context).size.width,
                        height: 42,
                        child: Text(i18n.Login),
                        onPressed: () async {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            Loading(context, displayBackground: true).start();
                            form.save();
                            var response = await Account().signin(
                                userName: _userInfo.userName,
                                password: _password);
                            String code = response.data['code'];
                            String message = response.data['message'];
                            if (response.statusCode == 200 && code == "OK") {
                              ResultWithToken<UserInfo> result =
                                  ResultWithToken<UserInfo>(code,
                                      message: message,
                                      token: Token.fromJson(
                                          response.data['token']),
                                      data: UserInfo.fromJson(
                                          response.data['data']));
                              await Loading(context).stop();
                              await MainStateModel()
                                  .of(context)
                                  .setToken(token: result.token.access_token);
                              await MainStateModel()
                                  .of(context)
                                  .setUserInfo(result.data);
                              util.go(context, "mainPage", replacement: true);
                            } else {
                              print(response.statusCode);
                              await Loading(context).stop();
                              Toast(context, icon: InfoTypes.error)
                                  .show(message);
                            }
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
                            child: Text("忘记密码？"),
                            onTap: () =>
                                util.go(context, "retrievePasswordPage"),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Text(
                              "立即注册",
                              textAlign: TextAlign.right,
                            ),
                            onTap: () => util.go(context, "signUpPage"),
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
                            color: Theme.of(context).highlightColor,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 24,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            "快捷登录",
                            style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).hintColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Icon(
                            AliIcons.qq_circle,
                            color: Theme.of(context).hintColor,
                            size: 36,
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            AliIcons.wechat_circle,
                            color: Theme.of(context).hintColor,
                            size: 36,
                          ),
                        ),
                        Expanded(
                          child: Icon(
                            AliIcons.alipay_outline,
                            color: Theme.of(context).hintColor,
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
      ),
    );
  }
}
