import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/models/auth_model/auth.dart';
import 'package:demo/views/DashBoardView/home_view.dart';
import 'package:demo/views/DashBoardView/notification_view.dart';
import 'package:demo/views/DashBoardView/transfer_history.dart';
import 'package:demo/views/Payments/payments_view.dart';
import 'package:demo/views/profileSettingsView/profile_settings_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  final List<Widget> screensList = [
    HomeView(),
    TransferHistory(),
    ProfileSettingsView(),
    const PaymentsView(),
  ];

  final PageController pageController = PageController();
  final User user = LocalStorage.getUserCredential();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.profileUrl ?? ""),
            )),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                  return NotificationView();
                }));
              },
              child: Image.asset("assets/png/notifications.png"))
        ],
        title: Text(
          user.userName,
          style: AppTextStyles.appBarStyle,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        height: 60,
        decoration:
            BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(0);
                setState(() {});
              },
              child: Image.asset(
                AppAssets.home,
                color: index == 0 ? Colors.white : AppColors.bottomBarItemColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(1);
                setState(() {});
              },
              child: Image.asset(
                AppAssets.wallet,
                color: index == 1 ? Colors.white : AppColors.bottomBarItemColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(2);
                setState(() {});
              },
              child: Image.asset(
                AppAssets.setting,
                color: index == 2 ? Colors.white : AppColors.bottomBarItemColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(3);
                setState(() {});
              },
              child: Image.asset(
                AppAssets.dollar,
                color: index == 3 ? Colors.white : AppColors.bottomBarItemColor,
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: screensList,
        onPageChanged: (int index) {
          this.index = index;
          setState(() {});
        },
      ),
    );
  }
}

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
