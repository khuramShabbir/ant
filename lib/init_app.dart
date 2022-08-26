import 'package:demo/commons/app_colors.dart';
import 'package:demo/controllers/AppIntroProvider/app_intro_provider.dart';
import 'package:demo/controllers/auth_provider/edit_profile_provider.dart';
import 'package:demo/controllers/auth_provider/user_credential.dart';
import 'package:demo/controllers/business_info/business_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/splash_view.dart';

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return UserCredentialProvider();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return BusinessInfoProvider();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return AppIntroProvider();
        }),
        ChangeNotifierProvider(create: (BuildContext context) {
          return EditProfileProvider();
        }),
      ],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
        ),
      ),
    );
  }
}
