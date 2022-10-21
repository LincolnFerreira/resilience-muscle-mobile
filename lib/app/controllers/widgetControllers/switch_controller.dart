import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//change notifier é parecido com o set state mas quando só temos código e não interface
class SwitchController extends ChangeNotifier {
  static SwitchController instance = SwitchController();

  bool isDarkTheme = true;

  changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
