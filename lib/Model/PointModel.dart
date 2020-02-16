import 'package:flutter/material.dart';

class PointModel extends ChangeNotifier {
  int point = 0; //Todo 永続化先から読み込めるようにする。
 
  void addPoint({@required String name, @required int addPotint}) {
    point += addPotint;
    notifyListeners();
  }
  void removePoint({@required String name, @required removePoint}) {
    point -= removePoint;
    notifyListeners();
  }
}

class Member {
  final int key;
  String name;
  int point;

  Member({@required this.key, @required this.name, @required this.point});

  Member.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        name = json['name'],
        point = json['point'];

  Map<String, dynamic> toJson() => {
        'key': key,
        'name': name,
        'point': point,
      };
}