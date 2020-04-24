import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show L;

class SliverHeader extends StatelessWidget {
  const SliverHeader({
    Key key,
    this.title,
    this.color,
    this.fontSize,
    this.textColor,
    this.height,
    this.horizontal,
    this.suffix,
    this.action,
  }) : super(key: key);

  final String title;
  final Color color;
  final double horizontal;
  final double height;
  final double fontSize;
  final Color textColor;
  final String suffix;
  final GestureTapCallback action;

  @override
  Widget build(BuildContext context) {
    double _fontSize = fontSize ?? 16.0;
    double _height = height ?? 42;
    L i18n = L.of(context);
    return SliverPersistentHeader(
      delegate: _SliverHeaderDelegate(
        child: PreferredSize(
          child: Container(
            color: color ?? Theme.of(context).cardColor,
            height: _height,
            padding: EdgeInsets.symmetric(horizontal: horizontal ?? 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _fontSize,
                    color: textColor ?? Theme.of(context).textTheme.title.color,
                  ),
                  textAlign: TextAlign.start,
                ),
                GestureDetector(
                  child: suffix == null
                      ? Icon(
                          Icons.more_horiz,
                          color: Theme.of(context).textTheme.subhead.color,
                        )
                      : Text(
                          suffix,
                          style: TextStyle(
                              color: Theme.of(context).textTheme.subtitle.color,
                              fontSize: 12.0),
                          textAlign: TextAlign.end,
                        ),
                  onTap: action,
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(_height),
        ),
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverHeaderDelegate({this.child});

  final PreferredSize child;

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }
}
