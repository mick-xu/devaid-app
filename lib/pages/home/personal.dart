import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show util, L, aliyunOss;
import 'package:ali_icons/ali_icons.dart';
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_app/widgets/index.dart'
    show CircleImage, Loading, MenuTile, RemoteImage;
import 'package:flutter_app/api/index.dart' show Account, UserInfo;

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key key}) : super(key: key);

  @override
  PersonalPageState createState() => PersonalPageState();
}

class PersonalPageState extends State<PersonalPage> {
  UserInfo userInfo = MainStateModel().userInfo;

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 260.0,
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: CircleImage(userInfo.avatar),
                    onTap: () => {},
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                  Text(
                    userInfo.userName,
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  )
                ],
              )),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: <Widget>[
                  MenuTile(
                    leading: Icon(
                      AliIcons.user_outline,
                      size: 22,
                    ),
                    title: Text(
                      "${i18n.Profile}",
                    ),
                    onTap: () => util.go(context, "profilePage"),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: <Widget>[
                  MenuTile(
                    leading: Icon(
                      AliIcons.settings_outline,
                      size: 20,
                    ),
                    title: Text(
                      i18n.SystemSettings,
                    ),
                    onTap: () => util.go(context, "settingsPage"),
                  ),
                  Divider(height: 1, indent: 16.0),
                  MenuTile(
                    leading: Icon(
                      AliIcons.smiling_face_outline,
                      size: 20,
                    ),
                    title: Text(
                      i18n.Feedback,
                    ),
                    onTap: () => util.go(context, "feedbackPage"),
                  ),
                  Divider(height: 1, indent: 16.0),
                  MenuTile(
                    leading: Icon(
                      AliIcons.about,
                      size: 20,
                    ),
                    title: Text(
                      i18n.About,
                    ),
                    onTap: () => util.go(context, "aboutPage"),
                  ),
                  Divider(height: 1, indent: 16.0),
                  MenuTile(
                    leading: Icon(
                      AliIcons.plane,
                      size: 22,
                    ),
                    title: Text(
                      i18n.CheckVersion,
                    ),
                    trailing: Text(
                      'v ${MainStateModel().version}',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.display2.color,
                          fontSize: 14.0),
                    ),
                    onTap: () =>
                        Loading(context, displayBackground: true).start(),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              child: Column(
                children: <Widget>[
                  MenuTile(
                    leading: Icon(
                      AliIcons.logout,
                      size: 20,
                    ),
                    title: Text(
                      i18n.Logout,
                    ),
                    alignment: WrapAlignment.center,
                    editable: false,
                    onTap: () => showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text(
                            "您确定要退出吗？",
                            style: TextStyle(
                                color: Theme.of(context).textTheme.title.color),
                          ),
                          content: ListBody(
                            children: <Widget>[
                              Text(
                                "退出后可重新登录",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .color),
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            new CupertinoDialogAction(
                              child: new Text(
                                '取消',
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .subtitle
                                        .color),
                              ),
                              isDestructiveAction: false,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            new CupertinoDialogAction(
                              child: new Text(
                                '确定',
                              ),
                              isDefaultAction: false,
                              onPressed: () => Account().signout(context),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
