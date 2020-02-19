import 'package:dama_app/model/RewardModel.dart';
import 'package:dama_app/parts/ColorPicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RewordModel>(builder: (context, rewardModel, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pushReplacementNamed("/home"),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          title: Text("TITLE"), //TODO タイトルを正しくする
        ),
        body: SelectionScreen(),
      );
    });
  }
}
