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
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:tutorial_coach_mark/animated_focus_light.dart';

class HomePage extends StatelessWidget {
  List<TargetFocus> targets = List();
  GlobalKey keyButton1 = GlobalKey();
  GlobalKey keyButton2 = GlobalKey();
  GlobalKey keyButton3 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer3<PointModel, RewordModel, HistoryModel>(
        builder: (context, pointModel, rewordModel, historyModel, child) {
      return Scaffold(
          appBar: AppBar(title: Text("HOME"), actions: <Widget>[
            IconButton(
                icon: Icon(Icons.help_outline),
                onPressed: () {
                  initTargets();
                  showTutorial(context);
                })
          ]),
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      key: keyButton1,
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
                key: keyButton2,
                height: 190.0,
                child: rewardAchievedList(rewordModel.rewardList, historyModel,
                    pointModel.totalPoint)),
            Text("これまでの歩み"),
            Text(""),
            Container(
              key: keyButton3,
              child: ayumi(),
            ),
          ])));
    });
  }

  void showTutorial(context) {
    TutorialCoachMark(context,
        targets: targets,
        colorShadow: Theme.of(context).primaryColor.withAlpha(200),
        textSkip: "スキップ",
        paddingFocus: 10,
        textStyleSkip: TextStyle(fontSize: 25, color: Colors.white),
        opacityShadow: 0.8, finish: () {
      print("finish");
    }, clickTarget: (target) {
      print(target);
    }, clickSkip: () {
      print("skip");
    })
      ..show();
  }

  void initTargets() {
    targets.add(TargetFocus(
      identify: "Target 1",
      keyTarget: keyButton1,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "交換可能ポイント",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "ここが交換可能ポインの残量を指し示しています。\nお手伝いをたくさんしてポイントを貯めよう！",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.RRect,
    ));
    targets.add(TargetFocus(
      identify: "Target 2",
      keyTarget: keyButton2,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "ご褒美の一覧",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "ご褒美の一覧を示しています！ポイントがたまったら、ハートをクリックしてご褒美と交換しよう！画面に映っていないご褒美は、横にスワイプしたら現れます！",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.RRect,
    ));
    targets.add(TargetFocus(
      identify: "Target 3",
      keyTarget: keyButton3,
      contents: [
        ContentTarget(
            align: AlignContent.bottom,
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "これまでの歩み",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      "今までの合計ポイント、お手伝いの回数、ご褒美の回数を示しています！たくさんお手伝いして、たくさんご褒美をもらおう！！",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ))
      ],
      shape: ShapeLightFocus.RRect,
    ));
  }
}

Widget ayumi() {
  return Consumer<PointModel>(builder: (context, pointmodel, child) {
    return Row(
      children: <Widget>[
        Expanded(
            child: InkWell(
                child: Column(
                  children: <Widget>[
                    Icon(
                      MaterialIcons.directions_run,
                      size: 50.0,
                    ),
                    Text("総ポイント"),
                    Text(pointmodel.totalPointEver.toString() + "ポイント")
                  ],
                ),
                onTap: () {})),
        Expanded(
            child: InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                Ionicons.md_bicycle,
                size: 50.0,
              ),
              Text("お手伝い回数"),
              Text(pointmodel.totalLaborEver.toString() + "回")
            ],
          ),
          onTap: () {},
        )),
        Expanded(
            child: InkWell(
          child: Column(
            children: <Widget>[
              Icon(
                MaterialCommunityIcons.human_handsup,
                size: 50.0,
              ),
              Text("ご褒美回数"),
              Text(pointmodel.totalRewardEver.toString() + "回")
            ],
          ),
          onTap: () {},
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
            child: InkWell(
              child: Column(
                children: <Widget>[
                  CircularPercentIndicator(
                    // LinearPercentIndicator(
                    radius: 50.0,
                    lineWidth: 5.0,
                    //     width: 140.0,
                    // lineHeight: 14.0,
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
                  Icon(
                    Entypo.heart,
                    color: isButtonDisabled(
                            pointmodel.totalPoint, rewardList[index].point)
                        ? Colors.pink
                        : Colors.grey,
                  )
                ],
              ),
              onTap: (isButtonDisabled(
                      pointmodel.totalPoint, rewardList[index].point)
                  ? () {
                      return AwesomeDialog(
                          context: context,
                          animType: AnimType.SCALE,
                          dialogType: DialogType.INFO,
                          body: Center(
                            child: Text(
                              "おめでとう！\n" +
                                  pointmodel.totalPoint.toString() +
                                  " - " +
                                  rewardList[index].point.toString() +
                                  " = " +
                                  (pointmodel.totalPoint -
                                          rewardList[index].point)
                                      .toString() +
                                  " point になります！ \n交換しますか?",
                              style: TextStyle(fontStyle: FontStyle.italic),
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
                                  'おめでとう!　ポイントの交換が完了しました！　間違って交換した場合は、履歴画面から削除してください。',
                                  style: TextStyle(fontStyle: FontStyle.italic),
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
            ),
          );
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
