import 'package:flutter/material.dart';

class RichTile extends StatelessWidget {
  RichTile({this.background, this.color, this.title, this.onTap});

  final ImageProvider background;
  final Color color;
  final Widget title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    // implement build
    return GestureDetector(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: color ?? Theme.of(context).backgroundColor,
          image: background == null
              ? null
              : DecorationImage(
                  image: background,
                  fit: BoxFit.cover,
                ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(0),
              child: Card(
                margin: EdgeInsets.all(0),
                elevation: 0,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(5.0),
                  ),
                ),
                child: title == null
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: title,
                      ),
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
