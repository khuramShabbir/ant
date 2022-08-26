import 'package:demo/commons/app_colors.dart';
import 'package:flutter/material.dart';

class AppWidgets {
  /// White Spacer
  static bool visi = false;
  static Widget spacer({
    double verticalSpace = 0.0,
    double horizontalSpace = 0.0,
  }) {
    return SizedBox(
      height: verticalSpace,
      width: horizontalSpace,
    );
  }

  /// Blue Bar

  static Widget blueBar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 5,
          height: 25,
          decoration:
              BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(100)),
        ),
        AppWidgets.spacer(horizontalSpace: 5),
      ],
    );
  }
}
