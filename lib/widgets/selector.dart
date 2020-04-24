import 'package:flutter/material.dart';

class Selector extends StatefulWidget {
  Selector(this.items, {this.title, this.value, this.onChange});

  final String title;
  int value;
  final Map<dynamic, String> items;
  final Function onChange;

  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  void change(int value) {
    if (widget.value == value) {
      return;
    }
    setState(() {
      widget.value = value;
      if (widget.onChange != null) {
        widget.onChange(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool hasTitle = widget.title != null && widget.title != '';
    double _titleHeight = hasTitle ? 55.0 : 0;
    return Container(
      height: 56.0 * widget.items.length + _titleHeight,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
          Visibility(
            visible: hasTitle,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                widget.title ?? '',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 1.0, color: Colors.black12),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                int _value = widget.items.keys.elementAt(index);
                bool _selected = _value == widget.value ? true : false;
                return ListTile(
                  title: Text(widget.items.values.elementAt(index)),
                  trailing: Visibility(
                    visible: _selected,
                    child: Icon(
                      Icons.check,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  onTap: () => change(_value),
                );
              },
              separatorBuilder: (context, index) => Divider(height: 1.0),
              itemCount: widget.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
