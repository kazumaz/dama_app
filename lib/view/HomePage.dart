import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dama_app/model/RewardModel.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatelessWidget {
  int totalPoints = 22;

  List<Reward> list = [
    Reward(key: 1, name: "お菓子", point: 3),
    Reward(key: 2, name: "遊園地", point: 40),
    Reward(key: 3, name: "ディズニー", point: 50),
    Reward(key: 4, name: "おもちゃ", point: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(30.0),
                child: Icon(
                  FontAwesome.money,
                  color: Colors.blue,
                  size: 80.0,
                )),
            Text(
              totalPoints.toString(),
              style: TextStyle(fontSize: 50.0),
            ),
          ]),
      SizedBox(height: 200.0, child: rewardAchievedList(list, totalPoints))
    ]));
  }
}

Widget rewardAchievedList(List<Reward> rewardList, int totalpoint) {
  return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 5.0,
                  percent: calculateRewardAchievesPercentage(
                      totalpoint, rewardList[index].point),
                  center: Text(calculateRewardAchievesPercentageString(
                          totalpoint, rewardList[index].point) +
                      "%"),
                  progressColor: Colors.blue,
                ),
                Text(rewardList[index].name),
                Text(rewardList[index].point.toString() + " point"),
                IconButton(
                    icon: Icon(
                      Entypo.heart,
                      color: Colors.pink,
                    ),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {}),
              ],
            ));
      },
      itemCount: rewardList.length,
      scrollDirection: Axis.horizontal);
}

double calculateRewardAchievesPercentage(int rewardPoint, int totalPoint) {
  double result = rewardPoint.toDouble() / totalPoint.toDouble();
  if (result >= 1.0) {
    return 1.0;
  } else {
    return result;
  }
}

String calculateRewardAchievesPercentageString(
    int rewardPoint, int totalPoint) {
  double result = ((rewardPoint.toDouble() / totalPoint.toDouble()) * 100);
  if (result >= 100) {
    return 100.toString();
  } else {
    return result.floorToDouble().toString();
  }
}
