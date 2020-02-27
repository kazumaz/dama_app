import 'package:dama_app/model/PasswordModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/animated_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class PassWordSettingPage extends StatelessWidget {
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
                      ))),
              Center(
                  child: Container(
                      width: 300.0,
                      child: TextFormField(
                        controller: passwordInputConfirmController,
                        autocorrect: false,
                        decoration: new InputDecoration(
                          border: const UnderlineInputBorder(),
                          labelText: 'パスワード',
                        ),
                        obscureText: true,
                      ))),
              Text(""),
              Container(
                  width: 300,
                  child: Text(
                    "セキュリティ強化のため、パスワードの再発行はできないようにしてあります。",
                    style: TextStyle(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  )),
              Text(""),
              RaisedButton(
                child: Text("登録"),
                shape: UnderlineInputBorder(),
                onPressed: () {
                  if (checkPasswordConfirmed(
                      passwordInputController.text.toString(),
                      passwordInputConfirmController.text.toString())) {
                    if (passwordModel.checkPassworIsAlreadyExist()) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.INFO,
                        aligment: Alignment.topCenter,
                        body: Center(
                          child: Column(children: <Widget>[
                            Container(
                                child: Text(
                              '既存のパスワードを入力してください。',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            )),
                            Container(
                                width: 200.0,
                                child: TextField(
                                    controller: beforePasswordInputController,
                                    autofocus: true
                                    // decoration: InputDecoration(
                                    //   // labelText: "編集する場合は入力してください",

                                    ))
                          ]),
                        ),
                        tittle: 'This is Ignored',
                        desc: 'This is also Ignored',
                        btnOkOnPress: () {
                          if (passwordModel.isValidPassword(
                              checkPassword: beforePasswordInputController.text
                                  .toString())) {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.SUCCES,
                              body: Center(
                                child: Text(
                                  'パスワードの登録が完了しました！',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              tittle: 'This is Ignored',
                              desc: 'This is also Ignored',
                              btnOkOnPress: () {
                                passwordModel.setPassword(newPassword: passwordInputController.text.toString());
                                passwordInputController.clear();
                                passwordInputConfirmController.clear();
                                beforePasswordInputController.clear();
                              },
                            ).show();

                            passwordModel.setPassword(
                                newPassword:
                                    passwordInputController.text.toString());
                          } else {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.ERROR,
                              body: Center(
                                child: Text(
                                  'パスワードエラーです。入力し直してください。',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              tittle: 'This is Ignored',
                              desc: 'This is also Ignored',
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                      ).show();
                    } else {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.SUCCES,
                        body: Center(
                          child: Text(
                            'パスワードの登録が完了しました！',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        tittle: 'This is Ignored',
                        desc: 'This is also Ignored',
                        btnOkOnPress: () {
                          passwordModel.setPassword(newPassword: passwordInputController.text.toString());
                          passwordInputController.clear();
                          passwordInputConfirmController.clear();
                          beforePasswordInputController.clear();
                        },
                      ).show();
                    }
                  } else {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.SCALE,
                      dialogType: DialogType.ERROR,
                      body: Center(
                        child: Text(
                          '入力した2つのパスワードが一致しません。',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      tittle: 'This is Ignored',
                      desc: 'This is also Ignored',
                      btnOkOnPress: () {},
                    ).show();
                  }
                },
              ),
            ],
          ));
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
