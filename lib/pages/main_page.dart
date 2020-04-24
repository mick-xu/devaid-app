import 'package:flutter/material.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/widgets/index.dart' show DrawerMenu;
import 'package:flutter_app/pages/home/index.dart';
import 'package:flutter_app/utils/index.dart' show L;
import 'package:ali_icons/ali_icons.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    DemoPage(),
    DiscoverPage(),
    PersonalPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(MainWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    L i18n = L.of(context);
    List<BottomNavigationBarItem> _menus = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(AliIcons.home_ios), title: Text(i18n.Home)),
      BottomNavigationBarItem(
        icon: Icon(
          AliIcons.layout_ios,
          size: 22,
        ),
        title: Text(i18n.Demo),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          AliIcons.plane,
          size: 24,
        ),
        title: Text(i18n.Discover),
      ),
      BottomNavigationBarItem(
        icon: Icon(
          AliIcons.settings_outline,
          size: 22,
        ),
        title: Text(i18n.Settings),
      ),
    ];

    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: _menus,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
