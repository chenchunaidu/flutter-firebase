import 'package:flutter/material.dart';
import 'package:flutter_firebase/layout/get-page-wrapper.dart';
import 'package:flutter_firebase/screens/account.dart';
import 'package:flutter_firebase/screens/calendar.dart';
import 'package:flutter_firebase/screens/content.dart';
import 'package:flutter_firebase/screens/home.dart';
import 'package:flutter_firebase/screens/login.dart';
import 'package:flutter_firebase/screens/otp.dart';
import 'package:flutter_firebase/theme/index.dart';
import 'package:get/get.dart';
import 'package:flutter_firebase/helpers/auth.dart';
import 'package:get_storage/get_storage.dart';

import 'helpers/translations.dart';

void initialize() {
  // inject authentication controller
  Get.put(AuthController());
}

void main() async {
  initialize();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GetStorage storage = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(storage.read("locale-language") ?? 'hi',
          storage.read("locale-country") ?? 'IN'),
      translations: Messages(),
      initialRoute: '/login',
      getPages: getPageWrapper([
        PageWrapper(path: '/login', child: Login(), navbar: false),
        PageWrapper(path: '/home', child: const Home()),
        PageWrapper(path: '/content', child: const Content()),
        PageWrapper(path: '/calendar', child: const Calendar()),
        PageWrapper(path: '/profile', child: const Account()),
        PageWrapper(path: "/otp", child: const OTP(), navbar: false)
      ]),
      routingCallback: routingCallback,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      home: Home(),
    );
  }
}
