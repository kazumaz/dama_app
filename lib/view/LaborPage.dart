import 'package:dama_app/Model/LaborModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaborPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LaborModel>(builder: (context, laborModel, child) {
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                child: Text(
                  laborModel.rewardList[index].point.toString() + " Point:　　" + laborModel.rewardList[index].name,
                  style: TextStyle(fontSize: 22.0),
                ),
                padding: EdgeInsets.all(20.0),
              ),
            );
          },
          itemCount: laborModel.rewardList.length,
        ),
      );
    });
  }
}
