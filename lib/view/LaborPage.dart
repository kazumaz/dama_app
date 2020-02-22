import 'package:dama_app/model/LaborModel.dart';
import 'package:dama_app/model/PointModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class LaborPage extends StatelessWidget {
  final myLaborNameController = TextEditingController();
  final myLaborPointController = TextEditingController();
  bool datePicked = false;
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Consumer2<LaborModel, PointModel>(
        builder: (context, laborModel, pointModel, child) {
      return Scaffold(
          body: Column(
            children: <Widget>[
              Text(""),
              Text("ボタンを押して、日付を入力してポイントゲット！"),
              Text(""),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            child: Text(
                              laborModel.laborList[index].point.toString() +
                                  " Point:　　" +
                                  laborModel.laborList[index].name,
                            ),
                            padding: EdgeInsets.all(20.0),
                          ),
                        ),
                        RaisedButton(
                          child: Text("+P"),
                          color: Colors.white,
                          shape: CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          onPressed: () {
                            _selectDate(context, laborModel, pointModel, index);
                          },
                        ),
                      ],
                    ));
                  },
                  itemCount: laborModel.laborList.length,
                ),
              ),
            ],
          ),
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
                                controller: myLaborNameController,
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: "名前",
                                  // hintText: "test"
                                ),
                                onChanged: (value) {
                                  // nothing to do
                                },
                              )),
                            ],
                          ),
                          Expanded(
                              child: TextField(
                                  controller: myLaborPointController,
                                  decoration:
                                      InputDecoration(labelText: "ポイント"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ]))
                        ]),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              myLaborNameController.clear();
                              myLaborPointController.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Labor tmpLabor = Labor(
                                  name: myLaborNameController.text,
                                  point:
                                      int.parse(myLaborPointController.text));

                              if (myLaborNameController.text == null ||
                                  myLaborPointController.text == null ||
                                  myLaborNameController.text == "" ||
                                  myLaborPointController.text == "null") {
                                myLaborNameController.clear();
                                myLaborPointController.clear();
                                Navigator.of(context).pop();
                              }
                              print(myLaborNameController.text);
                              print(myLaborPointController.text);

                              laborModel.addLaborModel(labor: tmpLabor);
                              myLaborNameController.clear();
                              myLaborPointController.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              }));
    });
  }

  Future<void> _selectDate(BuildContext context, LaborModel laborModel,
      PointModel pointModel, int index) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("ありがとう！!"),
            content: Text(pointModel.totalPoint.toString() +
                "+" +
                laborModel.laborList[index].point.toString() +
                "=" +
                (pointModel.totalPoint + laborModel.laborList[index].point)
                    .toString() +
                "point になります!"),
            // +"\n"+selectedDate.toString()),
            actions: <Widget>[
              // ボタン領域
              FlatButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  pointModel.addTotalPoint(
                      point: laborModel.laborList[index].point);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

bool isInputValid(String name, String point) {
  if (name != null && point != null && name != "" && point != "") {
    return false;
  } else {
    return true;
  }
}
