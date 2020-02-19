import 'package:dama_app/model/PasswordModel.dart';
import 'package:dama_app/model/RewardModel.dart';
import 'package:dama_app/parts/ColorPicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassWordSettingPage extends StatelessWidget {
  final passwordInputController = TextEditingController();

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
            title: Text("パスワード変更画面"), //TODO タイトルを正しくする
          ),
          body: Column(
            children: <Widget>[_passwordForm(), _passwordConfirmForm()],
          ));
    });
  }

  Widget _passwordForm() {
    return TextFormField(
      controller: passwordInputController,
      autocorrect: false,
      decoration: new InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'パスワード',
      ),
      obscureText: true,
    );
  }

  Widget _passwordConfirmForm() {
    return TextFormField(
      controller: passwordInputController,
      autocorrect: false,
      decoration: new InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: '確認用',
      ),
      obscureText: true,
    );
  }
}
