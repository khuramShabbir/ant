import 'package:demo/commons/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle headlineBoldStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black);
  static TextStyle buttonTextStyles = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);
  static TextStyle subTitleStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);
  static TextStyle font22WithBold = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black);
  static TextStyle font15 = const TextStyle(fontSize: 15, color: Colors.black);
  static TextStyle font15WithGrey =
      TextStyle(fontSize: 15, color: Colors.grey.withOpacity(.7));
  static TextStyle font15Bold = const TextStyle(
      fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);
  static TextStyle font15BoldPrimary = TextStyle(
      fontSize: 15, color: AppColors.primary, fontWeight: FontWeight.bold);

  static TextStyle regularStyle = const TextStyle(
    color: Colors.black,
  );
  static TextStyle appBarStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
