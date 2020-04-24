import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show RemoteImage;
import 'package:flutter_app/utils/index.dart' show aliyunOss;
import 'package:cached_network_image/cached_network_image.dart';

class AuthorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("开发者介绍"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Center(
                child: Column(
              children: <Widget>[
                DecoratedBox(
                  child: Container(
                    width: 100,
                    height: 100.0,
                  ),
                  position: DecorationPosition.background,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          "$aliyunOss/upload/2019/00/author.png"),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.white, width: 3),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(3.0, 3.0),
                          blurRadius: 4.0),
                    ],
                  ),
                ),
              ],
            )),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  elevation: 3.0,
                  child: Container(
                    height: 200,
                    padding: EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
                                child: RemoteImage(
                                  "upload/2019/00/runto-logo.png",
                                  height: 40.0,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15)),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Flex(
                                  direction: Axis.vertical,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Mick Xu",
                                      style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      color: Colors.black38,
                                    ),
                                    Text(
                                      "Programmer",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "简介",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                                subtitle: Text(
                                  "Web 前端、.Net、Flutter、Python 程序员，喜欢研究新技术，目前就职于山东润图信息技术有限公司。负责 Web 项目、手机移动端（Android iOS）的研发工作。",
                                  style: TextStyle(fontSize: 12),
                                ),
                                isThreeLine: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
