import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class DeviceInfoPage extends StatefulWidget {
  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo _androidInfo;

  String _id = "";
  String _androidId = "";
  String _brand = "";
  String _device = "";
  String _model = "";
  String _host = "";
  String _hardware = "";
  String _release = "";
  String _securityPatch = '';
  String _display = "";
  String _type = "";

  getInfo() async {
    _androidInfo = await deviceInfo.androidInfo;
    if (_androidInfo != null) {
      _id = _androidInfo.id;
      _androidId = _androidInfo.androidId;
      _brand = _androidInfo.brand;
      _model = _androidInfo.model;
      _device = _androidInfo.device;
      _release = _androidInfo.version.release;
      _securityPatch = _androidInfo.version.securityPatch;
      _host = _androidInfo.host;
      _hardware = _androidInfo.hardware;
      _display = _androidInfo.display;
      _type = _androidInfo.type;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // implement build
    getInfo();
    return Scaffold(
      appBar: AppBar(
        title: Text("device_info"),
        actions: <Widget>[
          FlatButton(
            onPressed: () => {},
            child: Text(
              "查看代码",
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.textTheme.title.color),
            ),
          ),
        ],
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Id"),
              trailing: Text(_id),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("Android Id"),
              trailing: Text(_androidId),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("品牌"),
              trailing: Text(_brand),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("型号"),
              trailing: Text(_model),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("设备"),
              trailing: Text(_device),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("类型"),
              trailing: Text(_type),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("Host"),
              trailing: Text(_host),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("硬件"),
              trailing: Text(_hardware),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("Android 版本"),
              trailing: Text(_release),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("安全补丁级别"),
              trailing: Text(_securityPatch),
            ),
            Divider(height: 1.0, indent: 16.0),
            ListTile(
              title: Text("显示"),
              trailing: Text(_display),
            ),
          ],
        ),
      ),
    );
  }
}
