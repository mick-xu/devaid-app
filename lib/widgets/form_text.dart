import 'package:flutter/material.dart';
import 'package:ali_icons/ali_icons.dart';

class FormText extends StatefulWidget {
  FormText({
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.maxLength,
    this.maxLengthEnforced = false,
    this.errorText = "",
    this.controller,
    this.onSaved,
  });

  final String hintText;
  final Widget prefixIcon;
  Widget suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLength;
  final bool maxLengthEnforced;
  final String errorText;
  final TextEditingController controller;
  final FormFieldSetter<String> onSaved;

  @override
  _FormTextState createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  IconData _eyeIcon = AliIcons.eye_close;
  bool _obscureText = false;
  final _key = GlobalKey<FormFieldState>();

  changeEye() {
    setState(() {
      _obscureText = !_obscureText;
      print(_obscureText);
      _eyeIcon = _obscureText ? AliIcons.eye_close : AliIcons.eye_open;
    });
  }

  @override
  void initState() {
    // implement initState
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // implement build
    return TextFormField(
      key: _key,
      cursorColor: Colors.grey[400],
      maxLength: widget.maxLength,
      maxLengthEnforced: widget.maxLengthEnforced,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.all(0.0),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon == null && widget.obscureText
            ? GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Icon(
                  _eyeIcon,
                  color: Theme.of(context).hintColor,
                  size: 20,
                ),
                onTap: () => changeEye(),
              )
            : widget.suffixIcon,
        counter: Text(""),
        errorText: widget.errorText,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).highlightColor),
        ),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return '';
        }
      },
      onSaved: widget.onSaved,
    );
  }
}
