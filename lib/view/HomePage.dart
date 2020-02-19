import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dama_app/model/RewardModel.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PointModel, RewordModel>(
        builder: (context, pointModel, rewordModel, child) {
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
                pointModel.totalPoint.toString(),
                style: TextStyle(fontSize: 50.0),
              ),
            ]),
        SizedBox(
            height: 200.0,
            child: rewardAchievedList(
                rewordModel.rewardList, pointModel.totalPoint))
      ]));
    });
  }
}

Widget rewardAchievedList(List<Reward> rewardList, int totalpoint) {
  return Consumer<PointModel>(builder: (context, pointmodel, child) {
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
                        pointmodel.totalPoint, rewardList[index].point),
                    center: Text(calculateRewardAchievesPercentageString(
                            pointmodel.totalPoint, rewardList[index].point) +
                        "%"),
                    progressColor: Colors.blue,
                  ),
                  Text(rewardList[index].name),
                  Text(rewardList[index].point.toString() + " point"),
                  IconButton(
                      icon: Icon(
                        Entypo.heart,
                        color: isButtonDisabled(
                                pointmodel.totalPoint, rewardList[index].point)
                            ? Colors.pink
                            : Colors.grey,
                      ),
                      onPressed: isButtonDisabled(
                              pointmodel.totalPoint, rewardList[index].point)
                          ? () {
                              pointmodel.decreaseTotalPoint(
                                  point: rewardList[index].point);
                            }
                          : null),
                ],
              ));
        },
        itemCount: rewardList.length,
        scrollDirection: Axis.horizontal);
  });
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

bool isButtonDisabled(int rewardPoint, int totalPoint) {
  if (rewardPoint >= totalPoint) {
    return true;
  } else {
    return false;
  }
}
