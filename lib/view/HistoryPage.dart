import 'package:dama_app/model/HistoryModel.dart';
import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class HistoryPage extends StatelessWidget {
  final myLaborNameController = TextEditingController();
  final myLaborPointController = TextEditingController();
  bool datePicked = false;
  DateTime selectedDate;
  DateFormat dateFormat_YYYY_MM_DD = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Consumer2<HistoryModel, PointModel>(
        builder: (context, historyModel, pointModel, child) {
      return Scaffold(
        body: Column(
          children: <Widget>[
            Text(""),
            Text("間違えて登録したものはここから削除！"),
            Text("スワイプして削除実施！"),
            Text(""),
            Expanded(
              child: ListView.builder(
                // reverse: true,
                itemBuilder: (BuildContext context, int index) {
                  //historyModel.historyList　をそのまま使うと、リストビューで最後に追加されたものが、画面上下に来てしまう。
                  //履歴画面では、最後に追加されたものが、画面上上に来る方が見やすいため、反転リストを作成する。
                  List<History> reversedHistoryList =
                      historyModel.historyList.reversed.toList();
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
                                      '本当に削除してよろしいでしょうか？',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  tittle: 'This is Ignored',
                                  desc: 'This is also Ignored',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {
                                    if (reversedHistoryList[index].sign) {
                                      pointModel.decreaseTotalPointWithEver(
                                          point:
                                              reversedHistoryList[index].point);
                                    } else {
                                      pointModel.increaseTotalPoint(
                                          point:
                                              reversedHistoryList[index].point);
                                    }
                                    //reversedHistoryListのインデックスをそのままモデルから削除すると、間違ったindexのものを削除してしまうから
                                    //計算して正しいものを削除するようにする
                                    historyModel.removeHistory(
                                        historyModel.historyList.length -
                                            1 -
                                            index);

                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.SUCCES,
                                      body: Center(
                                        child: Text(
                                          '削除が成功しました！',
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
                          ],
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    dateFormat_YYYY_MM_DD
                                        .format(
                                            reversedHistoryList[index].dateTime)
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  Text(""),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text("　"),
                                  reversedHistoryList[index].sign
                                      ? Icon(MaterialCommunityIcons.run)
                                      : Icon(MaterialCommunityIcons.gift),
                                  Text("  "),
                                  Expanded(
                                    // child: Padding(
                                    child: Text(
                                      reversedHistoryList[index]
                                              .point
                                              .toString() +
                                          " Point:　" +
                                          reversedHistoryList[index].name +
                                          (reversedHistoryList[index].sign
                                              ? "　ありがとう！"
                                              : "　もらったよ！"),
                                    ),
                                    // padding: EdgeInsets.all(20.0),
                                    // ),
                                  ),
                                ],
                              ),
                              Text("",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                  )),
                            ],
                          )));
                },
                itemCount: historyModel.historyList.length,
              ),
            ),
          ],
        ),
      );
    });
  }
}
