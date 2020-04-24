import 'package:flutter/material.dart';

class MenuTile extends StatefulWidget {
  MenuTile(
      {this.leading,
      this.title,
      this.trailing,
      this.editable = true,
      this.alignment,
      this.onTap});

  final Widget leading;
  final Widget title;
  final Widget trailing;
  final bool editable;
  final WrapAlignment alignment;
  final GestureTapCallback onTap;

  @override
  _MenuTileSate createState() => _MenuTileSate();
}

class _MenuTileSate extends State<MenuTile> {
  @override
  Widget build(BuildContext context) {
    // 菜单条
    return ListTile(
      title: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: widget.alignment ?? WrapAlignment.start,
        children: <Widget>[
          widget.leading ?? const SizedBox(),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.leading == null ? 0.0 : 3.0)),
          widget.title
        ],
      ),
      trailing: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          widget.trailing ?? const SizedBox(),
          Visibility(
            visible: widget.editable,
            child: Icon(
              Icons.chevron_right,
              color: Theme.of(context).textTheme.display2.color,
            ),
          ),
        ],
      ),
      onTap: widget.onTap,
    );
  }
}
