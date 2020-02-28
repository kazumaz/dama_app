import 'package:dama_app/model/PasswordModel.dart';
import 'package:dama_app/model/LockModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/animated_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RockSettingPage extends StatelessWidget {
  final passwordInputController = TextEditingController();
  final passwordInputConfirmController = TextEditingController();
  final beforePasswordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<PasswordModel, LockModel>(
        builder: (context, passwordModel, lockModel, child) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.home),
                onPressed: () => Navigator.of(context).pop()),
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0.0,
            title: Text("ロック設定"),
          ),
          body: Column(
            children: <Widget>[
              Text(""),
              Text("パスワードを必要とする機能を選択"),
              Text(""),
              Text(""),
              Text(""),
              Text("ポイント強制変更"),
              Center(
                child:

//           LiteRollingSwitch(
//     //initial value
//     value: true,
//     textOn: '解除',
//     textOff: 'ロック',
//     colorOn: Colors.greenAccent[700],
//     colorOff: Colors.redAccent[700],
//     iconOn: Icons.lock_open,
//     iconOff: Icons.lock,
//     textSize: 16.0,
//     onChanged: (bool state) {
//       //Use it to manage the different states
//       print('Current State of SWITCH IS: $state');
//     },
// )
// ,

                    ToggleSwitch(
                        minWidth: 90.0,
                        cornerRadius: 20,
                        activeBgColor: Colors.green,
                        activeTextColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveTextColor: Colors.white,
                        labels: ['ロック', '解除'],
                        icons: [FontAwesome.lock, FontAwesome.unlock],
                        activeColors: [Colors.blue, Colors.pink],
                        initialLabelIndex:
                            lockModel.pointChangePageState ? 0 : 1,
                        onToggle: (index) {
                          print('switched to: $index');
                          lockModel.changeLockStateOfPointChangePageState();
                        }),
              )
            ],
          ));
    });
  }
}
