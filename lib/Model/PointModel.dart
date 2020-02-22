import 'package:flutter/material.dart';

class PointModel extends ChangeNotifier {
  int totalPoint = 22; //ToDo ここを永続化先から取得するようにする
  int totalPointEver = 22; //ToDo ここを永続化先から取得するようにする
  int totalCountEver = 7; //ToDo ここを永続化先から取得するようにする

  void addTotalPoint({@required int point}) {
    totalPoint += point;
    totalPointEver += point;
    totalCountEver ++;
    notifyListeners();
  }

  void decreaseTotalPoint({@required int point}) {
    totalPoint -= point;
    notifyListeners();
  }

  void decreaseTotalPointWithEver({@required int point}) {
    totalPoint -= point;
    totalPointEver -= point;
    totalCountEver --;
    notifyListeners();
  }

  void increaseTotalPoint({@required int point}) {
    totalPoint += point;    
    notifyListeners();
  }
}