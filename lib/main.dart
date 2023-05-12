import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:helth_care_client/constants/ads/ads_controller.dart';
import 'package:helth_care_client/core/storage.dart';
import 'package:helth_care_client/services/fbNotifications.dart';
import 'package:helth_care_client/services/fb_auth_controller.dart';
import 'package:helth_care_client/services/firestore_helper.dart';
import '../constants/constants.dart';
import '../firebase_options.dart';
import '../routes/pages.dart';
import '../routes/routes.dart';
import 'core/global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await FbNotifications.init();
  Storage.getData();
  AdsController c = Get.put(AdsController());
  await c.initGoogleAds();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Expo',
        primaryColor: primaryColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: textColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            padding: const EdgeInsets.all(defaultPadding),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: textFieldBorder,
          enabledBorder: textFieldBorder,
          focusedBorder: textFieldBorder,
        ),
        primarySwatch: MaterialColor(
          primaryCode,
          <int, Color>{
            50: primaryColor.withOpacity(0.1),
            100: primaryColor.withOpacity(0.2),
            200: primaryColor.withOpacity(0.3),
            300: primaryColor.withOpacity(0.4),
            400: primaryColor.withOpacity(0.5),
            500: primaryColor.withOpacity(0.6),
            600: primaryColor.withOpacity(0.7),
            700: primaryColor.withOpacity(0.8),
            800: primaryColor.withOpacity(0.9),
            900: primaryColor.withOpacity(1),
          },
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      locale: const Locale('ar'),
      initialRoute: !Global.isLogged
          ? Routes.welcomeScreen
          : Routes.patentsNavigationScreen,
      getPages: Pages.getPages(),
    );
  }
}
