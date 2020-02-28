import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("設定"), actions: <Widget>[
          // IconButton(icon: Icon(Icons.help_outline), onPressed: () {})
        ]),
        backgroundColor: Colors.grey[100],
        body: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: ListView(children: [
              Text(""),
              Text("　設定"),
              _PasswordSetting("　パスワード設定", Icon(Ionicons.ios_lock), context),
              _ColorSetting("　テーマカラーの変更", Icon(Icons.map), context),
              _pointChange("　ポイント強制修正", Icon(Icons.room), context),
              _rockSetting("　メニュー4", Icon(Icons.local_shipping), context),
              Text(""),
              Text("　アプリについて"),
              _opinionPage("　ご意見・ご要望など", Icon(Entypo.pencil), context),
              _twitterPage("　開発者のツート", Icon(FontAwesome.twitter), context),
              _appShare("　このアプリを紹介", Icon(Ionicons.ios_rocket), context),
              _appReview("　このアプリを評価", Icon(Icons.star), context),
              _donate("　寄付", Icon(MaterialCommunityIcons.gift), context),
            ])),
          ],
        ));
  }

  Widget _rockSetting(String title, Icon icon, BuildContext context) {
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
        // Navigator.of(context).pushReplacementNamed("/rockSetting");
        Navigator.of(context).pushNamed("/rockSetting");
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
        Navigator.of(context).pushNamed("/colorSettings");
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
        Navigator.of(context).pushNamed("/passwordSetting");
        print("onTap called.");
      },
    );
  }

  Widget _pointChange(String title, Icon icon, BuildContext context) {
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
        Navigator.of(context).pushNamed("/pointChange");
        print("onTap called.");
      },
    );
  }

  Widget _twitterPage(String title, Icon icon, BuildContext context) {
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
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.INFO,
          body: Center(
            child: Text(
              '平和なツイートをしています。\nよろしければ、フォローしてください。',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          tittle: 'This is Ignored',
          desc: 'This is also Ignored',
          btnCancelText: "やめておく",
          btnOkText: "見てみる",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            launchURL("https://twitter.com/kzmat2");
          },
        ).show();
      },
    );
  }

  Widget _opinionPage(String title, Icon icon, BuildContext context) {
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
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.INFO,
          body: Center(
            child: Text(
              'いただいたご意見・ご要望を参考にアプリを改良していきます。',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          tittle: 'This is Ignored',
          desc: 'This is also Ignored',
          btnCancelText: "やめておく",
          btnOkText: "する",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            var email = 'kazumazuma1124@gmail.com';
            var subject = Uri.encodeComponent('【Dama】アプリに関するご意見・ご要望');
            var body = Uri.encodeComponent('ご意見・ご要望をこちらにご記入ください。');
            var url = 'mailto:$email?subject=$subject&body=$body';
            print(url);
            launchURL(url);
          },
        ).show();
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

  Widget _appShare(String title, Icon icon, BuildContext context) {
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
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.INFO,
          body: Center(
            child: Text(
              'このアプリが役立ちそうな人を知っていましたら、ご紹介いただけると嬉しいです。',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          tittle: 'This is Ignored',
          desc: 'This is also Ignored',
          btnCancelText: "やめておく",
          btnOkText: "してあげる",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            Share.share(
                'check out my app https://kazumaz.github.io/dama_app_pages/');
          },
        ).show();
      },
    );
  }

  Widget _appReview(String title, Icon icon, BuildContext context) {
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
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.INFO,
          body: Center(
            child: Text(
              'レビューをいただけますと、\nとても嬉しいです。',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          tittle: 'This is Ignored',
          desc: 'This is also Ignored',
          btnCancelText: "やめておく",
          btnOkText: "してあげる",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            launchURL("https://github.com/kazumaz");
          },
        ).show();
      },
    );
  }

  Widget _donate(String title, Icon icon, BuildContext context) {
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
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          dialogType: DialogType.INFO,
          body: Center(
            child: Text(
              'まずは考え方を説明するべきだと思ったので、説明用のページを作成しました。',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          tittle: 'This is Ignored',
          desc: 'This is also Ignored',
          btnCancelText: "やめておく",
          btnOkText: "見てみる",
          btnCancelOnPress: () {},
          btnOkOnPress: () {
            launchURL("https://kazumaz.github.io/dama_app_pages/");
          },
        ).show();
      },
    );
  }
}
