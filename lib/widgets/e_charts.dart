import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_app/utils/index.dart' show util;

class EChartWebView extends StatefulWidget {
  const EChartWebView(
      {this.title,
      this.subtext,
      this.legend,
      this.xAxis,
      this.yAxis,
      this.series,
      this.option,
      Key key})
      : super(key: key);

  final String title;
  final String subtext;
  final Map<String, dynamic> legend;
  final Map<String, dynamic> xAxis;
  final Map<String, dynamic> yAxis;
  final Map<String, dynamic> series;
  final Map<String, dynamic> option;

  @override
  State<StatefulWidget> createState() => _EChartWebViewState();
}

class _EChartWebViewState extends State<EChartWebView> {
  final _key = GlobalKey();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  _loadHtml(BuildContext context, WebViewController controller) async {
    final String _html =
        await util.loadFile(context, "assets/htmls/echarts.html");
    final String _content = base64Encode(Utf8Encoder().convert(_html));
    await controller.loadUrl('data:text/html;base64,$_content');
  }

  setOption(WebViewController controller) {
    String option = json.encode(widget.option);
    controller.evaluateJavascript("setOption($option)");
  }

  refresh() {}

  @override
  void initState() {
    // implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // implement build
    return Container(
      height: 300.0,
      child: Builder(
        builder: (BuildContext context) {
          return WebView(
            key: _key,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              _controller.future
                  .then((controller) => _loadHtml(context, controller));
            },
            navigationDelegate: (request) {},
            javascriptChannels: <JavascriptChannel>[].toSet(),
            onPageFinished: (String url) {
              _controller.future.then((controller) => setOption(controller));
            },
          );
        },
      ),
    );
  }
}
