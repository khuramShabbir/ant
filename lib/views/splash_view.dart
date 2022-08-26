import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/views/App_Into_Views/app_inro_view.dart';
import 'package:demo/views/DashBoardView/BottomNavigationBarViews/bottom_navigation_bar_view.dart';
import 'package:demo/views/DashBoardView/home_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);

    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (LocalStorage.box.read(LocalStorage.userData) == null) {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return const AppIntroView();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return BottomNavigationBarView();
        }));
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              // height: AppConst.screenHeight(context) * .6,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(AppAssets.mainBG), fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            height: AppConst.screenHeight(context) * .4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppWidgets.spacer(verticalSpace: 50),
                Image.asset(AppAssets.appLogo),
                AppWidgets.spacer(verticalSpace: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.alphabetA),
                    AppWidgets.spacer(horizontalSpace: 5),
                    Image.asset(AppAssets.alphabetN),
                    AppWidgets.spacer(horizontalSpace: 5),
                    Image.asset(AppAssets.alphabetT),
                  ],
                ),
                Text(
                  "Decentralized",
                  style: AppTextStyles.subTitleStyle
                      .copyWith(color: AppColors.primary, fontWeight: FontWeight.w200),
                ),
                Text(
                  "Advertisement",
                  style: AppTextStyles.subTitleStyle
                      .copyWith(color: AppColors.primary, fontWeight: FontWeight.w200),
                ),
                AppWidgets.spacer(verticalSpace: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Linear progress indicator',
                    backgroundColor: AppColors.greyWithOpacity,
                    color: AppColors.primary,
                  ),
                ),
                AppWidgets.spacer(verticalSpace: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
