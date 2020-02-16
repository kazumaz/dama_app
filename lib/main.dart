import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Application Name'),
        elevation: 4.0,
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          new HomePage(),
          new SettingsPage(),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text("Home")
          ),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: new Text("Setting")
          ),
        ],
      ),
    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}




class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'Home Page',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.cloud)));
  }
}



class SettingsPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        // Appbar
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            'Setting Page',
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Center(child: Icon(Icons.cloud)));
  }
}