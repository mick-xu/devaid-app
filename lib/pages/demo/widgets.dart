import 'package:flutter/material.dart';
import 'package:flutter_app/models/widget_menu.dart';
import 'package:flutter_app/utils/index.dart' show util;

class WidgetsPage extends StatelessWidget {
  WidgetsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 5),
            itemCount: WidgetMenus.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(WidgetMenus[index].icon),
                  title: Text(
                    WidgetMenus[index].title,
                  ),
                  trailing: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Text(
                        WidgetMenus[index].subtitle,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Theme.of(context).hintColor,
                      )
                    ],
                  ),
                  onTap: () => util.go(
                    context,
                    WidgetMenus[index].view,
                    arguments: <String, String>{
                      'title': WidgetMenus[index].title
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
