import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controller/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/gambar/intro.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          bottom: 10,
          top: 580,
          left: 57,
        ),
        child: Text(
          "Mesta",
          style: TextStyle(
            fontFamily: "sagetarius",
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 80,
            color: Color(0xFF8A5F2F),
            inherit: false,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(
          bottom: 10,
          top: 750,
          left: 130,
        ),
        child: Text(
          "J E W E L R Y",
          style: TextStyle(
            fontFamily: "Beyond Mars",
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
            fontSize: 20,
            color: Color(0xFF8A5F2F),
            inherit: false,
          ),
        ),
      ),
    ]);
  }
}
