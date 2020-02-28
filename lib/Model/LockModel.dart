import 'package:flutter/material.dart';

class LockModel extends ChangeNotifier {
  bool pointChangePageState = false; //永続化先からロードするように変更

  void changeLockStateOfPointChangePageState() {
    pointChangePageState = !pointChangePageState;
    notifyListeners();
  }
}
