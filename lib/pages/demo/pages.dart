import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart'
    show SliverHeader, RemoteImage, RemoteImageProvider, RichTile;
import 'package:flutter_app/utils/index.dart' show util;

class PagesPage extends StatefulWidget {
  const PagesPage({Key key}) : super(key: key);

  @override
  _PagesPageState createState() => _PagesPageState();
}

class _PagesPageState extends State<PagesPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            padding: EdgeInsets.all(16.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                  image:
                      RemoteImageProvider("upload/2019/00/banner-1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SliverHeader(
          title: "通用界面",
          color: Color.fromRGBO(255, 255, 255, 0),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: <Widget>[
              RichTile(
                background:
                    RemoteImageProvider("upload/2019/00/signin-page.jpg"),
                title: Text(
                  "登录界面",
                  textAlign: TextAlign.center,
                ),
                onTap: ()=>util.go(context, "loginPage"),
              ),
              RichTile(
                background:
                RemoteImageProvider("upload/2019/00/personal-page.jpg"),
                title: Text(
                  "个人中心",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        SliverHeader(
          title: "其他",
          color: Color.fromRGBO(255, 255, 255, 0),
        ),
      ],
    );
  }
}
