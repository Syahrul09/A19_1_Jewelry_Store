import 'package:flutter/material.dart';

import 'kategoriFemale.dart';
import 'kategoriMale.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60, left: 30, right: 30),
            child: Text(
              " HI, \n WELCOME TO OUR STORE",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, left: 30),
            child: Text(
              " COLLECTION",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KategoriMale(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(35),
              width: 60,
              height: h / 4,
              // color: Colors.black,
              decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage("assets/assetsMale/male.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "MALE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 18,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 9,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KategoriFemale(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 35, left: 35, bottom: 35),
              width: 60,
              height: h / 4,
              // color: Colors.black,
              decoration: BoxDecoration(
                // border: Border.all(),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage("assets/assetsFemale/female.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "FEMALE",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    fontSize: 18,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 9,
                        color: Colors.black,
                        offset: Offset(3.0, 3.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
