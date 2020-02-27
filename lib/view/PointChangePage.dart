import 'package:dama_app/model/PasswordModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PointChangePage extends StatelessWidget {
  final passwordInputController = TextEditingController();
  final passwordInputConfirmController = TextEditingController();
  final beforePasswordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordModel>(builder: (context, passwordModel, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed("/home"),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            title: Text("パスワード変更画面"),
          ),
          body: Column(
            children: <Widget>[
              Center(
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
                      )))])
    );});
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
