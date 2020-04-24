import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart'
    show RemoteImage, RemoteImageProvider;
import 'package:flutter_app/utils/index.dart' show util;

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 发现
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        textTheme: TextTheme(
          title: TextStyle(
            color: Theme.of(context).textTheme.subtitle.color,
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: GestureDetector(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(41, 60, 85, 1.0),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Container(
                    height: 200.0,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RemoteImage(
                          "upload/2019/00/echarts-logo.png",
                          height: 120.0,
                        ),
                        Text(
                          "ECharts 以 webview 的方式调用",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .appBarTheme
                                  .textTheme
                                  .title
                                  .color,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () => util.go(context, 'echartsWebViewPage'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: RemoteImageProvider("/upload/2019/00/banner-2.jpg"),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                position: DecorationPosition.background,
                child: Container(
                  height: 200.0,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
          ],
        ),
      ),
    );
  }
}
