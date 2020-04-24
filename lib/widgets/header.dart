import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show L;

class Header extends StatelessWidget {
  const Header({
    Key key,
    this.title,
    this.suffix,
    this.action,
  }) : super(key: key);

  final String title;
  final String suffix;
  final GestureTapCallback action;

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    return Container(
      color: Theme.of(context).cardColor,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.title.color,
            ),
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
      width: MediaQuery.of(context).size.width,
    );
  }
}
