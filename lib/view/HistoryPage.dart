import 'package:dama_app/model/HistoryModel.dart';
import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

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
                                if (historyModel.historyList[index].sign) {
                                  pointModel.decreaseTotalPointWithEver(
                                      point: historyModel
                                          .historyList[index].point);
                                } else {
                                  pointModel.increaseTotalPoint(
                                      point: historyModel
                                          .historyList[index].point);
                                }
                                historyModel.removeHistory(index);
                              },
                            ),
                          ],
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    dateFormat_YYYY_MM_DD
                                        .format(historyModel
                                            .historyList[index].dateTime)
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
                                  historyModel.historyList[index].sign
                                      ? Icon(MaterialCommunityIcons.run)
                                      : Icon(MaterialCommunityIcons.gift),
                                  Text("  "),
                                  Expanded(
                                    // child: Padding(
                                    child: Text(
                                      historyModel.historyList[index].point
                                              .toString() +
                                          " Point:　" +
                                          historyModel.historyList[index].name +
                                          (historyModel.historyList[index].sign
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
