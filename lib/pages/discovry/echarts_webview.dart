import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/index.dart' show EChartWebView;
import 'package:flutter_app/models/charts.dart';

class EchartsWebViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EchartsWebViewPageState();
}

class _EchartsWebViewPageState extends State<EchartsWebViewPage> {
  @override
  Widget build(BuildContext context) {
    // implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("echarts"),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EChartWebView(
              option: barOption,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            EChartWebView(
              option: lineOption,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            EChartWebView(
              option: pieOption,
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
            EChartWebView(
              option: ringOption,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.refresh),
      ),
    );
  }
}
