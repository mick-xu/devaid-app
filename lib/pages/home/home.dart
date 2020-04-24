import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart'
    show SliverHeader, MainButton, RemoteImage, ImageBox;
import 'package:flutter_app/utils/index.dart' show L, util;
import 'package:ali_icons/ali_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  final double gapSize = 0.0;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          leading: GestureDetector(
            child: Icon(
              Icons.menu,
              color: Colors.white70,
            ),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
          expandedHeight: 220.0,
          flexibleSpace: FlexibleSpaceBar(
            background: RemoteImage(
              "assets/images/banner.png",
            ),
            title: Text(
              "",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                  fontFamily: "minicircle"),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: TextField(
              style: TextStyle(color: Colors.white70, fontSize: 16.0),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white70,
                    size: 18.0,
                  ),
                  hintText: i18n.PleaseInputKeywords,
                  hintStyle: TextStyle(color: Colors.white30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Color.fromRGBO(255, 255, 255, 0.1),
                  contentPadding: EdgeInsets.all(0.0)),
              cursorColor: Colors.grey[400],
              maxLines: 1,
              onTap: () => {},
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              child: Icon(
                AliIcons.scan_ios,
                color: Colors.white70,
              ),
              onTap: () => util.go(context, "qRViewPage"),
            ),
            Padding(padding: EdgeInsets.only(right: 16))
          ],
        ),
        SliverGrid.count(
          crossAxisCount: 4,
          children: <Widget>[
            MainButton(
              title: i18n.Icons,
              icon: Icons.insert_emoticon,
              backgroundColor: Colors.lightGreen,
            ),
            MainButton(
              title: i18n.Widgets,
              icon: Icons.widgets,
              backgroundColor: Colors.lightBlue,
            ),
            MainButton(
              title: i18n.Layout,
              icon: Icons.web,
              backgroundColor: Colors.orangeAccent,
            ),
            MainButton(
              title: i18n.Plugins,
              icon: AliIcons.plugin,
              backgroundColor: Colors.pinkAccent,
            ),
          ],
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: widget.gapSize)),
        SliverHeader(title: i18n.IconLibrary, fontSize: 16),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 0.3)),
        SliverGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          childAspectRatio: 2.7,
          children: <Widget>[
            InkWell(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: RemoteImage(
                    "upload/2019/00/icon_1.png",
                    width: 42.0,
                    loading: true,
                  ),
                  title: Text("Flutter 图标",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle:
                      Text("Cupertino 图标", style: TextStyle(fontSize: 12)),
                ),
              ),
              onTap: () => {},
            ),
            InkWell(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  leading: RemoteImage(
                    "upload/2019/00/icon_2.png",
                    width: 42.0,
                    loading: true,
                  ),
                  title: Text("阿里图标",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "集成阿里图标库",
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
              onTap: () => {},
            ),
          ],
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 0.3)),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: widget.gapSize)),
        SliverHeader(
          title: i18n.Layout,
          fontSize: 16,
          suffix: "",
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 110,
            padding: EdgeInsets.all(10.0),
            color: Theme.of(context).backgroundColor,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ImageBox(
                  title: "通用界面",
                  width: 140,
                  right: 10,
                  image: "assets/images/bg-autumn.jpg",
                  onTap: () => util.go(context, "layoutsPage"),
                ),
                ImageBox(
                  title: "文章资讯",
                  width: 140,
                  right: 10,
                  image: "assets/images/bg-highway.jpg",
                ),
                ImageBox(
                  title: "购物时尚",
                  width: 140,
                  right: 10,
                  image: "assets/images/bg-photography.jpg",
                ),
                ImageBox(
                  title: "音乐视频",
                  width: 140,
                  right: 10,
                  image: "assets/images/bg-technology.jpg",
                ),
                ImageBox(
                  title: "聊天社交",
                  width: 140,
                  right: 10,
                  image: "assets/images/bg-forest.jpg",
                ),
                ImageBox(
                  title: "其他类别",
                  width: 140,
                  image: "assets/images/bg-building.jpg",
                ),
              ],
            ),
          ),
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: widget.gapSize)),
//        SliverList(
//          delegate: SliverChildBuilderDelegate(
//            (BuildContext context, int index) {
//              return Card(
//                color: Colors.pink,
//                margin: EdgeInsets.all(5.0),
//                child: Text(index.toString()),
//              );
//            },
//            childCount: 6,
//          ),
//        ),
        SliverHeader(
          title: i18n.Plugins,
          fontSize: 16,
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 0.3)),
        SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1,
          childAspectRatio: 2.7,
          children: <Widget>[
            InkWell(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  trailing: RemoteImage(
                    "upload/2019/00/amap.png",
                    width: 43.0,
                    loading: true,
                  ),
                  title: Text("amap_base",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "高德地图基于AndroidView 和 UiKitView",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  isThreeLine: true,
                ),
              ),
              onTap: () => {},
            ),
            InkWell(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  trailing: RemoteImage(
                    "upload/2019/00/camera.png",
                    width: 42.0,
                    loading: true,
                  ),
                  title: Text("Camera",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "允许访问 Android IOS 设备摄像头插件",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  isThreeLine: true,
                ),
              ),
              onTap: () => {},
            ),
            InkWell(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  trailing: RemoteImage(
                    "upload/2019/00/location.png",
                    width: 42.0,
                    loading: true,
                  ),
                  title: Text("location",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "获取 Android 和 iOS 设备的位置",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              onTap: () => {},
            ),
            InkWell(
              child: Container(
                color: Theme.of(context).cardColor,
                child: ListTile(
                  trailing: RemoteImage(
                    "upload/2019/00/swiper.png",
                    width: 42.0,
                    loading: true,
                  ),
                  title: Text("flutter_swiper",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "好用的轮播图插件",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
              onTap: () => {},
            ),
          ],
        ),
        SliverPadding(padding: EdgeInsets.symmetric(vertical: 0.3)),
      ],
    );
  }
}
