import 'package:dama_app/model/LaborModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaborPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LaborModel>(builder: (context, rewardModel, child) {
      return Scaffold(
          body: 
        //   Column(
        // children: <Widget>[
        //   TextField(
        //     enabled: true,
        //     // 入力数
        //     maxLength: 10,
        //     maxLengthEnforced: false,
        //     style: TextStyle(color: Colors.red),
        //     obscureText: false,
        //     maxLines: 1,
        //     //パスワード
        //     // onChanged: _handleText,
        //   ),
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  child: Text(
                    rewardModel.laborList[index].point.toString() +
                        " Point:　　" +
                        rewardModel.laborList[index].name,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
              );
            },
            itemCount: rewardModel.laborList.length,
          ),
        // ],
      // )
      );
    });
  }
}
