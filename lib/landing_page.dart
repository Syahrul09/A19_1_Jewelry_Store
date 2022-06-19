import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
import 'package:project_jewerly/login_screen.dart';

class LandingPage extends GetView<LandingPage> {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(SignInPage());
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gambar/intro1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 10,
            top: 240,
            left: 165,
          ),
          child: Text(
            "MESTA",
            style: TextStyle(
              fontFamily: "DMSerifDisplay",
              fontSize: 40,
              letterSpacing: 5,
              color: Colors.white,
              inherit: false,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 10,
            top: 290,
            left: 165,
          ),
          child: Text(
            "JEWELRY",
            style: TextStyle(
              fontFamily: "DMSerifDisplay",
              fontSize: 40,
              letterSpacing: 5,
              color: Colors.white,
              inherit: false,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            bottom: 10,
            top: 340,
            left: 300,
          ),
          child: Text(
            "store",
            style: TextStyle(
              fontFamily: "italianno.regular",
              fontSize: 37,
              letterSpacing: 3,
              color: Colors.white,
              inherit: false,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          right: 0,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(150)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 60, right: 60, top: 10, bottom: 10),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
