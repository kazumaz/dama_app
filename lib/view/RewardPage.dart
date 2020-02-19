import 'package:dama_app/model/RewardModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<RewordModel>(builder: (context, rewardModel, child) {      
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                child: Text(
                  rewardModel.rewardList[index].point.toString() + " Point:　　" + rewardModel.rewardList[index].name,                  
                ),
                padding: EdgeInsets.all(20.0),
              ),
            );
          },
          itemCount: rewardModel.rewardList.length,
        ),
      );
    });
  }
}