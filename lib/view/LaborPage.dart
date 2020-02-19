// import 'package:flutter/material.dart';

// class  LaborPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(child: Icon(Icons.cloud)));
//   }
// }




import 'package:dama_app/model/LaborModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LaborPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LaborModel>(builder: (context, rewardModel, child) {      
      return Scaffold(
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                child: Text(
                  rewardModel.laborList[index].point.toString() + " Point:　　" + rewardModel.laborList[index].name,                  
                ),
                padding: EdgeInsets.all(20.0),
              ),
            );
          },
          itemCount: rewardModel.laborList.length,
        ),
      );
    });
  }
}