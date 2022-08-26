import 'package:flutter/material.dart';

class AppIntroProvider extends ChangeNotifier {
  int index = 0;
  void carousalIndex(int index) {
    this.index = index;

    notifyListeners();
  }

  List<String> introTitle = [
    "Sell advertisement on your shop window",
    "Sell advertisement on your shop window",
    "Sell advertisement on your shop window",
  ];
  List<String> introSubTitle = [
    "Pay for your shops rent by monetizing your shop window or ",
    "Pay for your shops rent by monetizing your shop window or ",
    "Pay for your shops rent by monetizing your shop window or ",
  ];
}
