import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({this.title, this.icon, this.backgroundColor});

  final String title;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      color: Theme.of(context).cardColor,
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 20,
            backgroundColor: backgroundColor ?? Colors.grey,
            foregroundColor: Colors.white,
            child: Icon(
              icon,
              size: 22,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Text(title,
              style: TextStyle(color: Theme.of(context).textTheme.title.color))
        ],
      ),
      onPressed: () => {},
    );
  }
}
