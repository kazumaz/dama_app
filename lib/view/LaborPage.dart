import 'package:dama_app/model/LaborModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class LaborPage extends StatelessWidget {
  Labor tmpLabor = null;

  @override
  Widget build(BuildContext context) {
    return Consumer<LaborModel>(builder: (context, rewardModel, child) {
      return Scaffold(
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Padding(
                  child: Text(
                    rewardModel.laborList[index].point.toString() +
                        " Point:　　" +
                        rewardModel.laborList[index].name,
                  ),
                  padding: EdgeInsets.all(20.0),
                ),
              );
            },
            itemCount: rewardModel.laborList.length,
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
                                autofocus: true,
                                decoration: InputDecoration(
                                  labelText: "名前",
                                  // hintText: "test"
                                ),
                                onChanged: (value) {
                                  tmpLabor.name = value;
                                },
                              )),
                            ],
                          ),
                          Expanded(
                              child: TextField(
                                  decoration: InputDecoration(
                                      labelText: "ポイント"),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly
                              ]))
                        ]),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
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
