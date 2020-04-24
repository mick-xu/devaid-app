import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Toast {
  Toast(
    this.context, {
    this.color,
    this.background,
    this.icon,
  });

  final BuildContext context;
  final Color color;
  final Color background;
  final IconData icon;

  Future<void> show(String tips) async {
    Color _color = color ?? Colors.white;
    Color _background = background ?? Color.fromRGBO(0, 0, 0, 0.3);
    new Timer(Duration(seconds: 3), () {
      Navigator.of(context).pop();
    });
    return showGeneralDialog(
      context: context,
      barrierLabel: "Toast",
      transitionDuration: Duration(milliseconds: 300),
      barrierDismissible: false,
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 2,
                maxHeight: MediaQuery.of(context).size.height / 3),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _background,
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    Icon(
                      icon,
                      color: _color,
                      size: 60,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                    Text(
                      tips,
                      style: TextStyle(
                        color: _color,
                        fontSize: 16.0,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> hide() async {
    await Navigator.of(context).pop();
  }
}
