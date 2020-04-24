import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show L;
import 'package:flutter_app/widgets/index.dart' show CircleImage;
import 'package:flutter_app/models/index.dart' show MainStateModel;

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key key}) : super(key: key);

  final _userInfo = MainStateModel().userInfo;

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    return Drawer(
        elevation: 1.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleImage(_userInfo.avatar),
              accountName: Text(i18n.UserName),
              accountEmail: Text("mick@holdcode.com"),
              otherAccountsPictures: <Widget>[
                CircleImage(_userInfo.avatar),
              ],
              onDetailsPressed: () => {},
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    i18n.Profile,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(height: 1.0),
                ListTile(
                  title: Text(
                    L.of(context).Settings,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(height: 1.0),
                ListTile(
                  title: Text(
                    i18n.Logout,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ],
            ))
          ],
        ));
  }
}
