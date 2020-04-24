import 'package:flutter/material.dart';
import 'package:flutter_app/pages/demo/index.dart';
import 'package:flutter_app/utils/index.dart' show L;

class DemoPage extends StatefulWidget {
  const DemoPage({Key key}) : super(key: key);

  @override
  DemoPageState createState() => DemoPageState();
}

class DemoPageState extends State<DemoPage> with TickerProviderStateMixin {
  TabController _tabController;
  List<Widget> _tabs;

  @override
  void initState() {
    _tabController =
        new TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    _tabs = <Widget>[
      Tab(
        text: i18n.Widgets,
      ),
      Tab(
        text: i18n.Layout,
      ),
      Tab(
        text: i18n.Plugins,
      )
    ];

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          primary: true,
          pinned: true,
          leading: GestureDetector(
            child: Icon(Icons.menu,
                color: Theme.of(context).textTheme.subhead.color),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
            child: TextField(
              style: TextStyle(color: Colors.black26, fontSize: 16.0),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black26,
                  size: 18.0,
                ),
                hintText: i18n.PleaseInputKeywords,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: Color.fromRGBO(200, 200, 200, 0.3),
                contentPadding: EdgeInsets.all(0.0),
              ),
              cursorColor: Colors.grey[400],
              maxLines: 1,
              onTap: () => {},
            ),
          ),
          actions: <Widget>[
            MaterialButton(
                child: Text(
                  i18n.Search,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Theme.of(context).textTheme.subhead.color),
                ),
                minWidth: 50.0,
                padding: EdgeInsets.all(0),
                onPressed: () => {})
          ],
          elevation: 1.0,
          floating: false,
          snap: false,
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.all(0),
            unselectedLabelColor: Theme.of(context).textTheme.subtitle.color,
            unselectedLabelStyle:
                TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            indicatorWeight: 1.0,
            indicatorColor: Color.fromRGBO(0, 0, 0, 0),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(0),
            isScrollable: false,
            tabs: _tabs,
            onTap: (int) => {},
            controller: _tabController,
          ),
        ),
        SliverFillRemaining(
            child: TabBarView(
          children: <Widget>[WidgetsPage(), PagesPage(), PackagesPage()],
          controller: _tabController,
        )),
      ],
    );
  }
}
