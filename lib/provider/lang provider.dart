import 'package:flutter/material.dart';


class MyProvider extends ChangeNotifier {
  String dropdownvalue = "en";

  void changeLanguage(String value) {
    dropdownvalue = value;
    notifyListeners();
  }
}