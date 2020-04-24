import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show Player;

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({Key key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("视频播放器"),
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
      body: SizedBox(
        height: 221.0,
        child: Player(),
      ),
    );
  }
}
