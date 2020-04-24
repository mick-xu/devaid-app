import 'dart:async';

import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show aliyunOss;

class Player extends StatefulWidget {
  Player({Key key}) : super(key: key);

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _visible = false;
  Timer _timer;

  changeControl() {
    setState(() {
      if (_controller.value.isPlaying) {
        _visible = !_visible;
      }
    });
  }

  delayChangeControl() {
    _timer = new Timer(new Duration(seconds: 3), () {
      if (_visible && _controller.value.isPlaying) {
        changeControl();
      }
    });
  }

  @override
  void initState() {
    _controller =
        VideoPlayerController.network('$aliyunOss/upload/2019/00/video.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    _visible = _controller.value.isPlaying ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the VideoPlayer.
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: VideoPlayer(_controller),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Visibility(
                      visible: _visible,
                      child: Container(
                        color: Colors.black26,
                        child: Center(
                          child: GestureDetector(
                            child: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle_outline,
                              size: 72,
                              color: Colors.white,
                            ),
                            onTap: () async {
                              _controller.value.isPlaying
                                  ? await _controller.pause()
                                  : await _controller.play();
                              setState(() {});
                              delayChangeControl();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTapDown: (TapDownDetails e) {
                changeControl();
                delayChangeControl();
              },
            ),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Container(
            color: Colors.black87,
            width: MediaQuery.of(context).size.width,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 72,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
