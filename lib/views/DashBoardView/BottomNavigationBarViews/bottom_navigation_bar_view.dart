import 'package:demo/Models/AuthModel/auth_model.dart' as auth;
import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/controllers/AuthProvider/user_credential_provider.dart';
import 'package:demo/views/DashBoardView/home_view.dart';
import 'package:demo/views/DashBoardView/notification_view.dart';
import 'package:demo/views/DashBoardView/transfer_history.dart';
import 'package:demo/views/Payments/payments_view.dart';
import 'package:demo/views/profileSettingsView/profile_settings_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  // final User user = LocalStorage.getUserCredential();

  int index = 0;
  UserCredentialProvider? authProv;
  @override
  void initState() {
    super.initState();
    authProv = Provider.of<UserCredentialProvider>(context, listen: false);

    Future.delayed(Duration.zero, () {
      authProv!.signIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserCredentialProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return value.isLoaded
            ? Scaffold(
                extendBody: true,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(value.userAuthModel!.user.profileUrl ?? ""),
                      )),
                  actions: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                            return NotificationView();
                          }));
                        },
                        child: Image.asset("assets/png/notifications.png"))
                  ],
                  title: Text(
                    value.userAuthModel!.user.userName,
                    style: AppTextStyles.appBarStyle,
                  ),
                ),
                bottomNavigationBar: Container(
                  margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  height: 60,
                  decoration: BoxDecoration(
                      color: AppColors.primary, borderRadius: BorderRadius.circular(20)),
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
              )
            : Scaffold(
                body: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              );
      },
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
