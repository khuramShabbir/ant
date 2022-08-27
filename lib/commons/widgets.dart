import 'package:demo/commons/app_colors.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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

  /// Show Progress
  static showProgress() {
    Get.defaultDialog(
        title: "",
        content: Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.primary.withOpacity(.1),
              color: AppColors.orange,
            ),
          ),
        ),
        barrierDismissible: true);
  }

  static stopProgress() {
    if (Get.isDialogOpen!) Get.back();
  }

  /// Flutter Toast
  static showToast({required String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static successfullySnackBar({String title = "Successful", required String msg}) {
    Get.snackbar(title, msg, backgroundColor: AppColors.green, colorText: Colors.white);
  }

  static unsuccessfullySnackBar({String title = "Error", required String msg}) {
    Get.snackbar(title, msg, backgroundColor: AppColors.orange, colorText: Colors.white);
  }

  static infoSnackBar({String title = "information", required String msg}) {
    Get.snackbar(
      title,
      msg,
      backgroundColor: AppColors.yellow.withOpacity(.5),
      colorText: Colors.black,
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

  static Future<String> chooseImageSource() async {
    String value = "";
    await Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Get.width * .9,
                  child: AppExtendedButtonFilled(
                    onTap: () {
                      value = "Camera";

                      if (Get.isBottomSheetOpen!) Get.back();
                      return value;
                    },
                    title: 'Camera',
                  ),
                ),
                SizedBox(
                  width: Get.width * .9,
                  child: AppExtendedButtonFilled(
                    onTap: () {
                      value = "Gallery";
                      if (Get.isBottomSheetOpen!) Get.back();
                      return value;
                    },
                    title: "Gallery",
                  ),
                ),
              ],
            ),
          ),
          AppWidgets.spacer(verticalSpace: 10),
          SizedBox(
            width: Get.width * .9,
            child: AppExtendedButtonFilled(
              onTap: () {
                value = "";
                if (Get.isBottomSheetOpen!) Get.back();
                return value;
              },
              title: "Cancel",
            ),
          ),
          AppWidgets.spacer(verticalSpace: 10),
        ],
      ),
      enableDrag: true,
      isDismissible: false,
    );
    return value;
  }
}
