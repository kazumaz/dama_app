import 'package:dama_app/model/RewardModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:awesome_dialog/animated_button.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class RewardPage extends StatelessWidget {
  final myRewardNameController = TextEditingController();
  final myRewardPointController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RewordModel>(builder: (context, rewardModel, child) {
      return Scaffold(
          appBar: AppBar(title: Text("ご褒美管理"), actions: <Widget>[
            // IconButton(icon: Icon(Icons.help_outline), onPressed: () {})
          ]),
          body: Column(children: <Widget>[
            Text(""),
            Text("ここからご褒美追加！"),
            Text("スワイプして削除・編集も可能！"),
            Text(""),
            Expanded(
                child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: '削除',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.SCALE,
                              dialogType: DialogType.WARNING,
                              body: Center(
                                child: Text(
                                  '本当に削除してよろしいでしょうか',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                              tittle: 'This is Ignored',
                              desc: 'This is also Ignored',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                rewardModel.removeReward(index);

                                AwesomeDialog(
                                  context: context,
                                  animType: AnimType.SCALE,
                                  dialogType: DialogType.SUCCES,
                                  body: Center(
                                    child: Text(
                                      '削除が完了しました！',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  tittle: 'This is Ignored',
                                  desc: 'This is also Ignored',
                                  btnOkOnPress: () {},
                                ).show();
                              },
                            ).show();
                          },
                        ),
                        IconSlideAction(
                          caption: "編集",
                          color: Colors.indigo,
                          icon: Icons.edit,
                          onTap: () {
                            //編集画面
                            showDialog<String>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  // String result = '';
                                  return AlertDialog(
                                    title: Text('編集する、名前とポイントを入力'),
                                    content: Column(
                                      children: <Widget>[
                                        Flexible(
                                            child: TextField(
                                          controller: myRewardNameController,
                                          autofocus: true,
                                          decoration: InputDecoration(
                                            // labelText: "編集する場合は入力してください",
                                            hintText: rewardModel
                                                .rewardList[index].name
                                                .toString(),
                                          ),
                                          maxLength: 10,
                                        )),
                                        Flexible(
                                            child: TextField(
                                                controller:
                                                    myRewardPointController,
                                                autofocus: true,
                                                decoration: InputDecoration(
                                                  // labelText: "編集する場合は入力してください",
                                                  hintText: rewardModel
                                                      .rewardList[index].point
                                                      .toString(),
                                                ),
                                                maxLength: 5,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: <
                                                    TextInputFormatter>[
                                              WhitelistingTextInputFormatter
                                                  .digitsOnly
                                            ])),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          myRewardNameController.clear();
                                          myRewardPointController.clear();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text('Ok'),
                                        onPressed: () {
                                          Reward tmpReward = Reward(
                                              name: myRewardNameController.text
                                                  .toString(),
                                              point: int.parse(
                                                  myRewardPointController
                                                      .text));
                                          rewardModel.replaceReward(
                                              index, tmpReward);
                                          myRewardNameController.clear();
                                          myRewardPointController.clear();
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                      ],
                      child: Row(
                        children: <Widget>[
                          Text("　"),
                          Icon(
                            MaterialCommunityIcons.gift,
                            color: Colors.pink,
                          ),
                          Padding(
                            child: Text(
                              rewardModel.rewardList[index].point.toString() +
                                  " Point:　　" +
                                  rewardModel.rewardList[index].name,
                            ),
                            padding: EdgeInsets.all(20.0),
                          )
                        ],
                      )),
                );
              },
              itemCount: rewardModel.rewardList.length,
            ))
          ]),
          floatingActionButton: FloatingActionButton(
              child: Icon(Ionicons.ios_add),
              onPressed: () {
                showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      // String result = '';
                      return AlertDialog(
                        title: Text('新規追加しますか？'),
                        content: Column(children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: TextField(
                                controller: myRewardNameController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: "名前",
                                  // hintText: "test"
                                ),
                                maxLength: 10,
                                onChanged: (value) {
                                  // nothing to do
                                },
                              )),
                            ],
                          ),
                          Expanded(
                              child: TextField(
                                  controller: myRewardPointController,
                                  decoration:
                                      InputDecoration(labelText: "ポイント"),
                                  maxLength: 5,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ]))
                        ]),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              myRewardNameController.clear();
                              myRewardPointController.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Reward tmpLabor = Reward(
                                  name: myRewardNameController.text,
                                  point:
                                      int.parse(myRewardPointController.text));

                              if (myRewardNameController.text == null ||
                                  myRewardPointController.text == null ||
                                  myRewardNameController.text == "" ||
                                  myRewardPointController.text == "null") {
                                myRewardNameController.clear();
                                myRewardPointController.clear();
                                Navigator.of(context).pop();
                              }
                              print(myRewardNameController.text);
                              print(myRewardPointController.text);

                              rewardModel.addRewardModel(reward: tmpLabor);
                              myRewardNameController.clear();
                              myRewardPointController.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }));
    });
  }
}
