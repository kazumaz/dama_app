import 'package:flutter/material.dart';

class MemberPointModel extends ChangeNotifier {
  List<Member> listMember = []; //ここに永続化領域からのロード処理を書く
  int memberKey = 0; //ここに永続化領域からのロード処理を書く

  void addMember({@required String name}) {
    listMember.add(Member(memberKey, name, 0));
  }
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