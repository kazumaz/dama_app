import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: ListView(children: [
              Text(""),
              Text("　設定"),
              _PasswordSetting("パスワード設定", Icon(Ionicons.ios_lock), context),
              _ColorSetting("テーマカラーの変更", Icon(Icons.map), context),
              _menuItem("メニュー3", Icon(Icons.room)),
              _menuItem("メニュー4", Icon(Icons.local_shipping)),
              Text(""),
              Text("　アプリについて"),
              _opinionPage("ご意見・ご要望など", Icon(Entypo.pencil)),
              _twitterPage("開発者のツート", Icon(FontAwesome.twitter)),
              _testShare("テストshare", Icon(Icons.local_shipping)),
              _menuItem("メニュー5", Icon(Icons.airplanemode_active)),
            ])),
          ],
        ));
  }

  Widget _menuItem(String title, Icon icon) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: icon,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          )),
      onTap: () {
        print("onTap called.");
      },
    );
  }

  Widget _ColorSetting(String title, Icon icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: icon,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.of(context).pushReplacementNamed("/colorSettings");
        print("onTap called.");
      },
    );
  }

  Widget _PasswordSetting(String title, Icon icon, BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: icon,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          )),
      onTap: () {
        Navigator.of(context).pushReplacementNamed("/passwordSetting");
        print("onTap called.");
      },
    );
  }

  Widget _twitterPage(String title, Icon icon) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: icon,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          )),
      onTap: () {
        launchURL("https://twitter.com/kzmat2");
      },
    );
  }
}

Widget _opinionPage(String title, Icon icon) {
  return GestureDetector(
    child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            color: Colors.white,
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: icon,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )),
    onTap: () {
      var email = 'kazumazuma1124@gmail.com';
      var subject = Uri.encodeComponent('【Dama】アプリに関するご意見・ご要望');
      var body = Uri.encodeComponent('ご意見・ご要望をこちらにご記入ください。');
      var url = 'mailto:$email?subject=$subject&body=$body';
      print(url);
      launchURL(url);
    },
  );
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _testShare(String title, Icon icon) {
  return GestureDetector(
    child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
            color: Colors.white,
            border:
                new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: icon,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )),
    onTap: () {
      Share.share('check out my website https://github.com/kazumaz');
    },
  );
}
