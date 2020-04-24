import 'package:flutter/material.dart';

class SelectList<T> extends StatefulWidget {
  SelectList(this.data, {this.current, this.names, this.callback});

  String current;
  final Map<String, T> data;
  final Map<String, String> names;
  final Function callback;

  @override
  _SelectListState createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  setCurrent(int index) {
    setState(() {
      widget.current = widget.data.keys.elementAt(index);
      widget.callback(widget.current);
    });
  }

  getName(int index) {
    return widget.names == null
        ? widget.data.keys.elementAt(index)
        : widget.names[widget.data.keys.elementAt(index)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.data.keys.length,
      itemBuilder: (context, index) {
        bool _selected = widget.current == widget.data.keys.elementAt(index);
        return Container(
          color: Theme.of(context).backgroundColor,
          child: ListTile(
            title: Wrap(
              children: <Widget>[
                Opacity(
                  opacity: _selected ? 1.0 : 0,
                  child: Icon(
                    Icons.chevron_right,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(getName(index)),
              ],
            ),
            selected: _selected,
            onTap: () => setCurrent(index),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(height: 0, indent: 16.0),
    );
  }
}
