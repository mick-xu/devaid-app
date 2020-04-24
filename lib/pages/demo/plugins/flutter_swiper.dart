import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show aliyunOss;
import 'package:flutter_swiper/flutter_swiper.dart';

class FlutterSwiperPage extends StatefulWidget {
  @override
  _FlutterSwiperPageState createState() => _FlutterSwiperPageState();
}

class _FlutterSwiperPageState extends State<FlutterSwiperPage> {
  List<String> images = <String>[
    '$aliyunOss/assets/images/bg-autumn.jpg',
    '$aliyunOss/assets/images/bg-photography.jpg',
    '$aliyunOss/upload/2019/00/banner-1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter_swiper"),
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
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Swiper(
              autoplay: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  images.elementAt(index),
                  fit: BoxFit.cover,
                );
              },
              itemCount: 3,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: 200,
              duration: 800,
            ),
          )
        ],
      ),
    );
  }
}
