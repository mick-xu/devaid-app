import 'package:flutter/material.dart';
import 'package:ali_icons/ali_icons.dart';
import 'package:flutter_app/utils/index.dart'
    show L, util, RegPattern, InfoTypes;
import 'package:flutter_app/widgets/index.dart' show FormText, Toast;
import 'package:flutter_app/api/index.dart' show Account;
import 'package:quiver/async.dart';
import 'package:flutter_app/models/main_state.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPageSate();
}

class _SignUpPageSate extends State<SignUpPage> {
  static const int _seconds = 59;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _userNameEditingController,
      _passwordEditingController,
      _validateCodeEditingController;
  String _userName, _password, _validateCode;
  CountdownTimer _countdownTimer;
  int _countdownCount = _seconds;
  bool _countdownRuning = false;
  GlobalKey<ScaffoldState> _key;

  void minus() {
    setState(() {
      _countdownCount--;
    });
  }

  void init() {
    int remaining = MainStateModel().getCountdown();
    if (remaining > 0) {
      _countdownCount = remaining;
      start();
    }
  }

  void start() {
    _countdownTimer = new CountdownTimer(
      new Duration(seconds: _countdownCount),
      new Duration(
        seconds: 1,
      ),
    );
    _countdownRuning = _countdownTimer.isRunning;
    _countdownTimer.listen(
      (CountdownTimer event) {
        minus();
      },
      onDone: () {
        setState(() {
          _countdownRuning = false;
          _countdownCount = _seconds;
          MainStateModel().setCountdown(0);
        });
      },
      cancelOnError: false,
    );
  }

  @override
  void initState() {
    _userNameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _validateCodeEditingController = TextEditingController();
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.Signup),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    FormText(
                      maxLength: 11,
                      maxLengthEnforced: true,
                      keyboardType: TextInputType.number,
                      controller: _userNameEditingController,
                      hintText: "请输入手机号",
                      prefixIcon: Icon(
                        AliIcons.user_outline,
                        size: 28.0,
                        color: Theme.of(context).hintColor,
                      ),
                      suffixIcon: FlatButton(
                        key: _key,
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).textTheme.display2.color,
                        onPressed: _countdownRuning
                            ? null
                            : () async {
                                _userName = _userNameEditingController.text;
                                if (util.hasMatch(
                                    _userName, RegPattern.mobileNumber)) {
                                  start();
                                  var result = await Account()
                                      .sendValidateCode(_userName);
                                  if (result.code == "OK") {
                                    Toast(context, icon: InfoTypes.success)
                                        .show("发送成功");
                                  } else {
                                    Toast(context, icon: InfoTypes.warning)
                                        .show(result.message);
                                  }
                                } else {
                                  setState(() {
                                    Toast(context, icon: InfoTypes.error)
                                        .show("手机号码不正确");
                                  });
                                }
                              },
                        child: Text(
                          _countdownRuning ? "还剩 $_countdownCount 秒" : "获取验证码",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .appBarTheme
                                  .textTheme
                                  .title
                                  .color),
                        ),
                      ),
                      onSaved: (value) => _userName = value,
                    ),
                    FormText(
                      maxLength: 6,
                      maxLengthEnforced: true,
                      keyboardType: TextInputType.text,
                      controller: _validateCodeEditingController,
                      hintText: "请输入验证码",
                      prefixIcon: Icon(
                        AliIcons.verification_outline,
                        size: 26.0,
                        color: Theme.of(context).hintColor,
                      ),
                      onSaved: (value) => _validateCode = value,
                    ),
                    FormText(
                      obscureText: true,
                      maxLength: 16,
                      keyboardType: TextInputType.text,
                      controller: _passwordEditingController,
                      hintText: "请输入密码",
                      prefixIcon: Icon(
                        AliIcons.lock_outline,
                        size: 26.0,
                        color: Theme.of(context).hintColor,
                      ),
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
                        child: Text(i18n.Signup),
                        onPressed: () async {
                          final form = _formKey.currentState;
                          if (form.validate()) {
                            form.save();
                            var result = await new Account().signup(
                                userName: _userName,
                                password: _password,
                                validateCode: _validateCode);
                            if (result.code == 'OK') {
                              util.go(context, "resultPage",
                                  replacement: true,
                                  arguments: {
                                    "title": "注册成功",
                                    "message": "注册成功，请返回登录"
                                  });
                            } else {
                              Toast(context, icon: InfoTypes.error)
                                  .show(result.message);
                            }
                          } else {
                            Toast(context, icon: InfoTypes.warning)
                                .show("请输入必填信息");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_countdownTimer != null && _countdownTimer.isRunning) {
      MainStateModel().setCountdown(_countdownCount);
      _countdownRuning = false;
      _countdownTimer.cancel();
    }
    super.dispose();
  }
}
