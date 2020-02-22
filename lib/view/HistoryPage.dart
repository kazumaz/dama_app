import 'package:dama_app/model/HistoryModel.dart';
import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HistoryPage extends StatelessWidget {
  final myLaborNameController = TextEditingController();
  final myLaborPointController = TextEditingController();
  bool datePicked = false;
  DateTime selectedDate;

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
                                  if(historyModel.historyList[index].sign){
                                    pointModel.decreaseTotalPointWithEver(point: historyModel.historyList[index].point);
                                  } else {
                                    pointModel.increaseTotalPoint(point: historyModel.historyList[index].point);
                                  }                                  
                                  historyModel.removeHistory(index);
                                },
                              ),                              
                            ],
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    child: Text(
                                      historyModel.historyList[index].point
                                              .toString() +
                                          " Point:　" +
                                          historyModel.historyList[index].name,
                                    ),
                                    padding: EdgeInsets.all(20.0),
                                  ),
                                ),                                
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