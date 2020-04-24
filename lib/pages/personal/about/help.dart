import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show RemoteImage;

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("功能介绍"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "1、在个人电脑上打开桌面版 Chrome 浏览器，输入网址 http://47.104.190.206",
                style: TextStyle(fontSize: 14.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: RemoteImage("upload/2019/00/web-login.png"),
              ),
              Text(
                "2、使用客户端扫描二维码进行登陆，登陆成功后跳转到 Web 代码编辑器",
                style: TextStyle(fontSize: 14.0),
              ),
              Text(
                "3、查看客户端示例，点击查看代码按钮，将实现此示例的代码推送至浏览器 Web 编辑器中",
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
