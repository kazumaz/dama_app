import 'package:flutter/material.dart';

class PasswordModel extends ChangeNotifier {
  String password = "aaa"; //ToDo ここを永続化先から取得するようにする

  void setPassword({@required String newPassword}) {
    password = newPassword;    
    notifyListeners();
  }

  bool isValidPassword({@required String checkPassword}) {
    return (password == checkPassword);
  }
}

