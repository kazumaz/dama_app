import 'package:flutter/material.dart';

class PointModel extends ChangeNotifier {
  List<Reward> rewardList = []; //Todo 永続化先から読み込めるようにする。
  int nextRewardKey = 0; //Todo 永続化先から読み込めるようにする。

  void addReward({@required String name, @required int point}) {
    rewardList.add(Reward(key: nextRewardKey, name: name, point: point));
    nextRewardKey++;
    print(nextRewardKey); //ToDo　デバッグコードなので削除
    notifyListeners();
  }

  void removeReward(@required String name) {
    //ToDo 実装が必要
  }
}

class Reward {
  final int key;
  String name;
  int point;

  Reward({@required this.key, @required this.name, @required this.point});

  Reward.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        name = json['name'],
        point = json['point'];

  Map<String, dynamic> toJson() => {
        'key': key,
        'name': name,
        'point': point,
      };
}