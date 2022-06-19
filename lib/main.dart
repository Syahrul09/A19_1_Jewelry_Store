import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_jewerly/CRUD/Tampilan/tampilan_cincin.dart';
import 'package:project_jewerly/CRUD/cincin_page.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/adminPage.dart';
import 'package:project_jewerly/login_screen.dart';
import 'package:project_jewerly/mainPage.dart';
import 'package:project_jewerly/pembayaran.dart';

import 'package:project_jewerly/signup_screen.dart';
import 'package:project_jewerly/splash_screen.dart';
import 'package:project_jewerly/users/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
