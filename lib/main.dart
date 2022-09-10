import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:demo/commons/app_colors.dart';
import 'package:demo/controllers/AddDisplayProvider/add_display_prov.dart';
import 'package:demo/controllers/AddDisplayProvider/strategy_prov.dart';
import 'package:demo/controllers/AppIntroProvider/app_intro_provider.dart';
import 'package:demo/controllers/AuthProvider/edit_profile_provider.dart';
import 'package:demo/controllers/AuthProvider/user_credential_provider.dart';
import 'package:demo/controllers/BusinessInfoProvider/business_info.dart';
import 'package:demo/controllers/google_map_provider.dart';
import 'package:get/get.dart';
import 'views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: UserCredentialProvider()),
      ChangeNotifierProvider.value(value: BusinessInfoProvider()),
      ChangeNotifierProvider.value(value: AppIntroProvider()),
      ChangeNotifierProvider.value(value: EditProfileProvider()),
      ChangeNotifierProvider.value(value: AddDisplayProvider()),
      ChangeNotifierProvider.value(value: GoogleMapProvider()),
      ChangeNotifierProvider.value(value: StrategyProvider()),
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
  ));
}
