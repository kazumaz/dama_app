import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
          _menuItem("パスワード設定", Icon(Ionicons.ios_lock)),
          _menuItem("テーマカラーの変更", Icon(Icons.map)),
          _menuItem("メニュー3", Icon(Icons.room)),
          _menuItem("メニュー4", Icon(Icons.local_shipping)),
          Text(""),
          Text("　アプリについて"),
          _menuItem("ご意見・ご要望など", Icon(Entypo.pencil)),
          _menuItem("開発者のツート", Icon(FontAwesome.twitter)),
          _menuItem("メニュー4", Icon(Icons.local_shipping)),
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
}
