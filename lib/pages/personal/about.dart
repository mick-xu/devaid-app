import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show util, aliyunOss;
import 'package:flutter_app/widgets/index.dart' show MenuTile;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_app/models/main_state.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: "$aliyunOss/upload/2019/00/app_icon.png",
                  placeholder: (context, url) => Image.asset(
                    "assets/images/image-loading.png",
                    width: 76.0,
                  ),
                  width: 76.0,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                Text(
                  "v ${MainStateModel().version}+${MainStateModel().buildNumber}",
                  style:
                      TextStyle(color: Theme.of(context).textTheme.body2.color),
                ),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: <Widget>[
                MenuTile(
                  title: Text("官网"),
                  trailing: Text(
                    "http://47.104.190.206",
                  ),
                  onTap: () async => await launch("http://47.104.190.206"),
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("功能介绍"),
                  onTap: () => util.go(context, 'helpPage'),
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("服务条款"),
                  onTap: () => {},
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("版权声明"),
                  onTap: () => {},
                ),
                Divider(height: 1.0, indent: 16.0),
                MenuTile(
                  title: Text("开发者"),
                  onTap: () => util.go(context, "authorPage"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
