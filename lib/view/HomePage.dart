import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dama_app/model/RewardModel.dart';

class HomePage extends StatelessWidget {
  List<Reward> list = [
    Reward(key: 1, name: "お菓子", point: 3),
    Reward(key: 2, name: "遊園地", point: 40),
    Reward(key: 3, name: "ディズニー", point: 50),
    Reward(key: 4, name: "おもちゃ", point: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: rewardAchievedList(list, 6));
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
                Text(rewardList[index].name)
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
    return result.toString();
  }
}
