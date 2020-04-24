import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
       Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("webview_flutter"),
        actions: <Widget>[
          FlatButton(
            child: Icon(
              Icons.refresh,
              color: Theme.of(context).appBarTheme.textTheme.title.color,
            ),
            onPressed: () {
              _controller.future.then((value) => value.reload());
            },
          )
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'http://www.runtoinfo.com',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          javascriptChannels: <JavascriptChannel>[].toSet(),
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('http://www.runtoinfo.com')) {
              return NavigationDecision.prevent;
            }
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        );
      }),
    );
  }
}
