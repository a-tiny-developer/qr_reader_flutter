import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  var selectMenuOpt = 1;

  void changeMenuOpt(int index) {
    selectMenuOpt = index;
    notifyListeners();
  }
}
