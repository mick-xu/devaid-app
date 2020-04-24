import 'package:flutter/material.dart';

class EditTile extends StatefulWidget {
  EditTile({
    this.leading,
    this.title,
    this.controller,
    this.editable = true,
    this.alignment,
    this.onTap,
    this.onCompleted,
  });

  final Widget leading;
  final Widget title;
  final TextEditingController controller;
  final bool editable;
  final WrapAlignment alignment;
  final GestureTapCallback onTap;
  final Function onCompleted;

  @override
  _EditTileSate createState() => _EditTileSate();
}

class _EditTileSate extends State<EditTile> {
  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            width: 100,
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                isDense: true,
                counterText: "",
              ),
              style: TextStyle(
                color: Theme.of(context).textTheme.caption.color,
                fontSize: 14.0,
              ),
              cursorColor: Theme.of(context).primaryColor,
              maxLines: 1,
              textAlign: TextAlign.end,
            ),
          ),
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
