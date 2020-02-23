import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:dama_app/model/RewardModel.dart';
import 'package:dama_app/model/HistoryModel.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/animated_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer3<PointModel, RewordModel, HistoryModel>(
        builder: (context, pointModel, rewordModel, historyModel, child) {
      return Scaffold(
          body: Column(children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor.withAlpha(50),
                  child: Column(
                    children: <Widget>[
                      Text(""),
                      Text("交換可能ポイント"),
                      Center(
                        child: Text(
                          pointModel.totalPoint.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(""),
                    ],
                  ))
            ]),
        SizedBox(
            height: 190.0,
            child: rewardAchievedList(
                rewordModel.rewardList, historyModel, pointModel.totalPoint)),
        Text("これまでの歩み"),
        Text(""),
        ayumi(),
      ]));
    });
  }
}

Widget ayumi() {
  return Consumer<PointModel>(builder: (context, pointmodel, child) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Column(
          children: <Widget>[
            Icon(
              MaterialIcons.directions_run,
              size: 50.0,
            ),
            Text("総ポイント"),
            Text(pointmodel.totalPointEver.toString() + "ポイント")
          ],
        )),
        Expanded(
            child: Column(
          children: <Widget>[
            Icon(
              Ionicons.md_bicycle,
              size: 50.0,
            ),
            Text("記録回数"),
            Text(pointmodel.totalCountEver.toString() + "回")
          ],
        )),
        Expanded(
            child: Column(
          children: <Widget>[
            Icon(
              MaterialCommunityIcons.human_handsup,
              size: 50.0,
            ),
            Text("連続"),
            Text("2" + "日")
          ],
        ))
      ],
    );
  });
}

Widget rewardAchievedList(
    List<Reward> rewardList, HistoryModel historyModel, int totalpoint) {
  return Consumer<PointModel>(builder: (context, pointmodel, child) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  CircularPercentIndicator(
                    radius: 50.0,
                    lineWidth: 5.0,
                    percent: calculateRewardAchievesPercentage(
                        pointmodel.totalPoint, rewardList[index].point),
                    center: Text(calculateRewardAchievesPercentageString(
                            pointmodel.totalPoint, rewardList[index].point) +
                        "%"),
                    progressColor: Theme.of(context).primaryColor,
                  ),
                  Text(rewardList[index].name,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(rewardList[index].point.toString() + " point",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      )),
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
                              // showDialog(
                              //   context: context,
                              //   builder: (_) {

                              return AwesomeDialog(
                                  context: context,
                                  animType: AnimType.SCALE,
                                  dialogType: DialogType.INFO,
                                  body: Center(
                                    child: Text(
                                      pointmodel.totalPoint.toString() +
                                          " - " +
                                          rewardList[index].point.toString() +
                                          " = " +
                                          (pointmodel.totalPoint -
                                                  rewardList[index].point)
                                              .toString() +
                                          " point になります！ \n交換しますか?",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  tittle: 'This is Ignored',
                                  desc: 'This is also Ignored',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    pointmodel.decreaseTotalPoint(
                                        point: rewardList[index].point);
                                    historyModel.addHistoryModel(
                                        history: History(
                                            dateTime: DateTime.now(),
                                            name: rewardList[index].name,
                                            point: rewardList[index].point,
                                            sign: false));

                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.SUCCES,
                                      body: Center(
                                        child: Text(
                                          'ポイントの交換が完了しました！間違って交換した場合は、履歴画面から削除してください。',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      tittle: 'This is Ignored',
                                      desc: 'This is also Ignored',
                                      btnOkOnPress: () {
                                        // Navigator.pop(context);
                                      },
                                    ).show();
                                  }).show();
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
