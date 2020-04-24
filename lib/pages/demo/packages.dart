import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show RemoteImage;
import 'package:flutter_app/models/plugin.dart';
import 'package:flutter_app/utils/index.dart' show util;

class PackagesPage extends StatelessWidget {
  const PackagesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // implement build
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Theme.of(context).backgroundColor,
          child: ListTile(
            leading: RemoteImage(
              Plugins.elementAt(index).cover,
              width: 90,
              fit: BoxFit.contain,
            ),
            title: Text(
              Plugins.elementAt(index).title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(Plugins.elementAt(index).subtitle),
            isThreeLine: true,
            onTap: () => util.go(context, Plugins.elementAt(index).route),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
      itemCount: Plugins.length,
    );
  }
}
