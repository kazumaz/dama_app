import 'package:dama_app/model/PasswordModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PointChangePage extends StatelessWidget {
  final pointPlusController = TextEditingController();
  final pointMinusController = TextEditingController();
  final passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordModel>(builder: (context, passwordModel, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () =>
                  Navigator.of(context).pop()
            ),
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            title: Text("ポイントを強制的に足す"),
          ),
          body: Column(children: <Widget>[
            Center(
                child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: pointPlusController,
                      autocorrect: false,
                      decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: '追加ポイント',
                      ),
                      obscureText: true,
                    ))),
            RaisedButton(
              child: Text("追加"),
              shape: UnderlineInputBorder(),
              onPressed: () {},
            ),
            Center(
                child: Container(
                    width: 300.0,
                    child: TextFormField(
                      controller: pointMinusController,
                      autocorrect: false,
                      decoration: new InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: '削減ポイント',
                      ),
                      obscureText: true,
                    ))),
            RaisedButton(
              child: Text("削減"),
              shape: UnderlineInputBorder(),
              onPressed: () {},
            ),
            Text(""),
                         Container(
                  width: 300,
                  child: Text(
                    "ここで追加・削減されたポイントは履歴画面には表示されません。",
                    style: TextStyle(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  )),
          ]));
    });
  }

  // Widget _passwordForm() {
  //   return Center(
  //       child: Container(
  //           width: 300.0,
  //           child: TextFormField(
  //             controller: passwordInputConfirmController,
  //             autocorrect: false,
  //             decoration: new InputDecoration(
  //               border: const UnderlineInputBorder(),
  //               labelText: 'パスワード',
  //             ),
  //             obscureText: true,
  //           )));
  // }

  Widget _passwordConfirmForm() {
    return Center(
        child: Container(
            width: 300.0,
            child: TextFormField(
              controller: passwordInputController,
              autocorrect: false,
              decoration: new InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: '確認用',
              ),
              obscureText: true,
            )));
  }
}

bool checkPasswordConfirmed(String password, String confirmPassword) {
  if (password == confirmPassword) {
    return true;
  } else {
    return false;
  }
}
