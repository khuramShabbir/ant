import 'package:demo/commons/app_colors.dart';
import 'package:demo/controllers/AddDisplayProvider/add_display_prov.dart';
import 'package:demo/controllers/AppIntroProvider/app_intro_provider.dart';
import 'package:demo/controllers/AuthProvider/edit_profile_provider.dart';
import 'package:demo/controllers/AuthProvider/user_credential_provider.dart';
import 'package:demo/controllers/BusinessInfoProvider/business_info.dart';
import 'package:demo/controllers/google_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'views/splash_view.dart';

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserCredentialProvider()),
        ChangeNotifierProvider.value(value: BusinessInfoProvider()),
        ChangeNotifierProvider.value(value: AppIntroProvider()),
        ChangeNotifierProvider.value(value: EditProfileProvider()),
        ChangeNotifierProvider.value(value: AddDisplayProvider()),
        ChangeNotifierProvider.value(value: GoogleMapProvider()),
      ],
      child: GetMaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            titleTextStyle:
                TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
