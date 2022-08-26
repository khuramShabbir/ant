import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/google_button.dart';
import 'package:demo/controllers/auth_provider/user_credential.dart';
import 'package:demo/views/AdvertisementTypeAndLocation/avert_type_view.dart';
import 'package:demo/views/Business_Info_Views/business_info_view.dart';
import 'package:demo/views/DashBoardView/BottomNavigationBarViews/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInWithGoogleView extends StatefulWidget {
  const SignInWithGoogleView({Key? key}) : super(key: key);

  @override
  State<SignInWithGoogleView> createState() => _SignInWithGoogleViewState();
}

late UserCredentialProvider signInWithGoogle;

class _SignInWithGoogleViewState extends State<SignInWithGoogleView> {
  @override
  void initState() {
    signInWithGoogle = Provider.of<UserCredentialProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppConst.screenHeight(context),
        width: AppConst.screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppWidgets.spacer(verticalSpace: AppConst.screenHeight(context) * .2),
              appLogo,
              AppWidgets.spacer(verticalSpace: AppConst.screenHeight(context) * .15),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Let's get going.", style: AppTextStyles.headlineBoldStyle)),
              AppWidgets.spacer(verticalSpace: AppConst.screenHeight(context) * .1),

              /// Sign in With Google
              GoogleButton(
                onTap: () async {
                  bool status = await signInWithGoogle.signInWithGoogle(context);
                  if (status) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BottomNavigationBarView()),
                    );
                  }
                },
              ),
              AppWidgets.spacer(verticalSpace: 30),
              Text("Register with us", style: AppTextStyles.subTitleStyle),
              AppWidgets.spacer(verticalSpace: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("By proceeding you accept with all term and conditions",
                    style: AppTextStyles.subTitleStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Widget appLogo = SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(AppAssets.appLogo),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.alphabetA),
            Image.asset(AppAssets.alphabetN),
            Image.asset(AppAssets.alphabetT)
          ],
        )
      ],
    ),
  );
}
