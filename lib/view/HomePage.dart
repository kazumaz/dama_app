import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/cupertino.dart';
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
                    color: Theme.of(context).primaryColor,
                    size: 80.0,
                  )),
              Text(
                pointModel.totalPoint.toString(),
                style: TextStyle(
                  fontSize: 50.0,
                  // Todoここのフォントを最後にカッコよくする
                  // fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
        SizedBox(
            height: 230.0,
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
                    radius: 80.0,
                    lineWidth: 5.0,
                    percent: calculateRewardAchievesPercentage(
                        pointmodel.totalPoint, rewardList[index].point),
                    center: Text(calculateRewardAchievesPercentageString(
                            pointmodel.totalPoint, rewardList[index].point) +
                        "%"),
                    progressColor: Theme.of(context).primaryColor,
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
                              showDialog(
                                context: context,
                                builder: (_) {
                                  return CupertinoAlertDialog(
                                    title: Text("おめでとう！！"),
                                    content: Text(
                                        pointmodel.totalPoint.toString() +
                                            " - " +
                                            rewardList[index].point.toString() +
                                            " = " +
                                            (pointmodel.totalPoint -
                                                    rewardList[index].point)
                                                .toString() +
                                            " point になります！ "),
                                    actions: <Widget>[
                                      // ボタン領域
                                      FlatButton(
                                        child: Text("Cancel"),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                      FlatButton(
                                          child: Text("OK"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            pointmodel.decreaseTotalPoint(
                                                point: rewardList[index].point);
                                          }),
                                    ],
                                  );
                                },
                              );
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
