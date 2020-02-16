import 'package:flutter/material.dart';

class LaborModel extends ChangeNotifier {
  List<Labor> rewardList = []; //Todo 永続化先から読み込めるようにする。
  int nextLaborKey = 0; //Todo 永続化先から読み込めるようにする。

  void addLabor({@required String name, @required int point}) {
    rewardList.add(Labor(key: nextLaborKey, name: name, point: point));
    nextLaborKey++;
    print(nextLaborKey); //ToDo　デバッグコードなので削除
    notifyListeners();
  }

  void removeReward(@required String name) {
    //ToDo 実装が必要
  }
}

class Labor {
  final int key;
  String name;
  int point;

  Labor({@required this.key, @required this.name, @required this.point});

  Labor.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        name = json['name'],
        point = json['point'];

  Map<String, dynamic> toJson() => {
        'key': key,
        'name': name,
        'point': point,
      };
}
