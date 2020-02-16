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