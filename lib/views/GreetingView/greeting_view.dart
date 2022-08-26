import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/views/DashBoardView/BottomNavigationBarViews/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';

class GreetingView extends StatelessWidget {
  const GreetingView({Key? key}) : super(key: key);
  final String introText = "Please ensure t"
      "hat you have an "
      "android tv on "
      "your shop window and that it’s"
      " always connected "
      "to the internet whenever you wish"
      "to earn money with advertisement.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppConst.screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(AppAssets.men),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      AppWidgets.blueBar(),
                      Text(
                        "Congratulations",
                        style: AppTextStyles.subTitleStyle,
                      )
                    ],
                  ),
                  AppWidgets.spacer(verticalSpace: 10),
                  Text(
                    introText,
                    style: AppTextStyles.regularStyle,
                  ),
                ],
              ),
              AppExtendedButtonFilled(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return BottomNavigationBarView();
                    }));
                  },
                  title: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
