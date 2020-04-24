import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show Header;
import 'package:ali_icons/ali_icons.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final double spacing = 16.0;
  bool _checked = false;
  int _groupValue = 1;
  bool _switchValue = false;
  double _sliderValue = 20;

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
            Header(title: "Checkbox 选择框"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                    value: _checked,
                    onChanged: (value) {
                      setState(() {
                        _checked = value;
                      });
                    },
                  ),
                  Checkbox(
                    value: _checked,
                    checkColor: Colors.blue,
                    activeColor: Color.fromRGBO(255, 255, 255, 0),
                    onChanged: (value) => setState(() {
                      _checked = value;
                    }),
                  )
                ],
              ),
            ),
            Header(title: "Radio 单选按钮"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _groupValue,
                    onChanged: (value) => setState(() {
                      _groupValue = value;
                    }),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _groupValue,
                    onChanged: (value) => setState(() {
                      _groupValue = value;
                    }),
                  ),
                  Radio(
                    value: 3,
                    groupValue: _groupValue,
                    onChanged: (value) => setState(() {
                      _groupValue = value;
                    }),
                  ),
                ],
              ),
            ),
            Header(title: "Switch 开关"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Switch(
                    value: _switchValue,
                    onChanged: (value) => setState(() {
                      _switchValue = value;
                    }),
                  ),
                  Switch(
                    value: _switchValue,
                    activeColor: Colors.red,
                    activeTrackColor: Colors.red,
                    inactiveTrackColor: Colors.orange,
                    inactiveThumbColor: Colors.orange,
                    onChanged: (value) => setState(
                      () {
                        _switchValue = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Header(title: "Slider 滑块"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    label: _sliderValue.toString(),
                    onChanged: (value) => setState(() {
                      _sliderValue = value;
                    }),
                  )
                ],
              ),
            ),
            Header(title: "TextField 文本框"),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: spacing, horizontal: spacing),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '用户名',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: spacing / 2)),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '密码',
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: spacing / 2)),
                  TextField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                      prefixIcon: Icon(
                        AliIcons.user_outline,
                        size: 30,
                      ),
                      hintText: "请输入手机号码",
                    ),
                  ),
                ],
              ),
            ),
            Header(title: "Date & Time Pickers 日期时间选择"),
            Padding(
              padding: EdgeInsets.symmetric(vertical: spacing),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("选择日期"),
                    onPressed: () async {
                      Future<DateTime> selectedDate = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2019),
                        lastDate: DateTime(2030),
                        builder: (BuildContext context, Widget child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: child,
                          );
                        },
                      ).then((value) {
                        print(value);
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20.0)),
                  RaisedButton(
                    child: Text("选择时间"),
                    onPressed: () async {
                      Future<DateTime> selectedTime = showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: child,
                          );
                        },
                      ).then((value) {
                        print(value);
                      });
                    },
                  ),
                ],
              ),
            ),
            //Header(title: "Checkbox 选择框"),
          ],
        ),
      ),
    );
  }
}
