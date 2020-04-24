import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/index.dart'
    show BaseOptions, Request, Response, host, httpClient, util;

class QRViewPage extends StatefulWidget {
  const QRViewPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController _qrViewController;
  BuildContext _context;
  bool recognizedQR = false;

  @override
  Widget build(BuildContext context) {
    recognizedQR = false;
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("扫描二维码"),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Positioned(
            top: 0,
            bottom: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Color.fromRGBO(255, 255, 255, 0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    child: Text(
                      "二维码置入框内",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            height: 71,
            child: Container(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      if (_qrViewController != null) {
                        _qrViewController.flipCamera();
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.autorenew,
                          color: Colors.white70,
                        ),
                        Text(
                          "切换相机",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_qrViewController != null) {
                        _qrViewController.toggleFlash();
                      }
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.flash_on,
                          color: Colors.white70,
                        ),
                        Text(
                          "开启灯光",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this._qrViewController = controller;
    controller.scannedDataStream.listen((scanData) async {
      _qrViewController.pauseCamera();
      String url = "api/accounts/auth/$scanData";
      Response response = await new Request().dio.get(url);
      if (response.statusCode == 200) {
        util.go(_context, "resultPage",
            replacement: true,
            arguments: {"title": "登录成功", "message": "扫码登录成功"});
      }
    });
  }
}
