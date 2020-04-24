import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart' show platforms, platformNames, L;
import 'package:flutter_app/models/main_state.dart';
import 'package:flutter_app/widgets/index.dart' show SelectList;

class PlatformPage extends StatefulWidget {
  @override
  _PlatformPageState createState() => _PlatformPageState();
}

class _PlatformPageState extends State<PlatformPage> {
  String _currentPlatform;

  setPlatform(selectedPlatform) {
    setState(() {
      MainStateModel().of(context).changePlatform(selectedPlatform);
    });
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    _currentPlatform = MainStateModel().of(context).platformName;
    return Scaffold(
      appBar: AppBar(
        title: Text(i18n.Platform),
        centerTitle: true,
      ),
      body: SelectList(
        platforms,
        current: _currentPlatform,
        names: platformNames,
        callback: setPlatform,
      ),
    );
  }
}
