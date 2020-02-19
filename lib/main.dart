import 'package:flutter/material.dart';
import 'package:dama_app/view/HomePage.dart';
import 'package:dama_app/view/SettingPage.dart';
import 'package:dama_app/view/LaborPage.dart';
import 'package:dama_app/view/RewardPage.dart';
import 'package:dama_app/view/HistoryPage.dart';
import 'package:dama_app/model/LaborModel.dart';
import 'package:dama_app/model/RewardModel.dart';
import 'package:dama_app/model/PointModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

// void main() => runApp(MultiProvider(providers: [
//       ChangeNotifierProvider<RewordModel>(create: (_) => RewordModel()),
//       ChangeNotifierProvider<LaborModel>(create: (_) => LaborModel()),
//       ChangeNotifierProvider<PointModel>(create: (_) => PointModel()),
//     ], child: MyApp()));

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LaborModel>(create: (_) => LaborModel()),
          ChangeNotifierProvider<RewordModel>(create: (_) => RewordModel()),
          ChangeNotifierProvider<PointModel>(create: (_) => PointModel()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          HomePage(),
          LaborPage(),
          RewardPage(),
          HistoryPage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.indigo,
          selectedItemBackgroundColor: Colors.blue,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
        selectedIndex: _page,
        onSelectTab: (index) {
          onTapBottomNavigation(index);
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'ホーム',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: 'お手伝い',
          ),
          FFNavigationBarItem(
            iconData: Icons.local_library,
            label: 'ご褒美',
          ),
          FFNavigationBarItem(
            iconData: Icons.note,
            label: '履歴',
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: '設定',
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Application Name'),
  //       elevation: 4.0,
  //     ),
  //     body: PageView(
  //       controller: _pageController,
  //       onPageChanged: onPageChanged,
  //       children: [
  //         HomePage(),
  //         LaborPage(),
  //         RewardPage(),
  //         SettingsPage(),
  //       ],
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       type: BottomNavigationBarType.fixed,
  //       currentIndex: _page,
  //       onTap: onTapBottomNavigation,
  //       items: [
  //         BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("ホーム")),
  //         BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("お手伝い")),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.local_library), title: Text("ご褒美")),
  //         BottomNavigationBarItem(
  //             icon: Icon(Icons.settings), title: Text("設定")),
  //       ],
  //     ),
  //     drawer: myDrawer(),
  //   );
  // }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}

Widget myDrawer() {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            launchURL;
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

launchURL() async {
  const url = 'https://flutter.dev';
  print("test");
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
