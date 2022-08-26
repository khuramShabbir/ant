import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class AppConst {
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static BoxDecoration boxDecoration20Radius =
      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(.3),
        spreadRadius: 1,
        blurRadius: 1,
        offset: const Offset(0, 2)),
  ]);
  static BoxDecoration boxDecoration10Radius =
      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(.3),
        spreadRadius: 1,
        blurRadius: 1,
        offset: const Offset(0, 2)),
  ]);
}
