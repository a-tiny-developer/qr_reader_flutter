import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  var selectMenuOpt = 0;

  void changeMenuOpt(int index) {
    selectMenuOpt = index;
    notifyListeners();
  }
}
