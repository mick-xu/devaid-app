import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Loading {
  Loading(
    this.context, {
    this.cupertinoStyle = false,
    this.displayBackground = false,
  }) {
    _color = displayBackground ? Colors.white54 : Colors.black38;
    _opacity = displayBackground ? 0.3 : 0;
    _indicator = cupertinoStyle
        ? CupertinoActivityIndicator(radius: 20.0, animating: true)
        : CircularProgressIndicator(
            backgroundColor: Color.fromRGBO(200, 200, 200, 0.3),
            strokeWidth: 2.0,
            valueColor: AlwaysStoppedAnimation(_color),
          );
  }

  final bool cupertinoStyle;
  final bool displayBackground;
  final BuildContext context;
  Widget _indicator;
  double _opacity;
  Color _color;

  Future<void> start() async {
    return showGeneralDialog(
      context: context,
      barrierLabel: "加载中",
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: false,
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, _opacity),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: _indicator,
            ),
          ),
        );
      },
    );
  }

  Future<void> stop() async {
    await Navigator.of(context).pop();
  }
}
