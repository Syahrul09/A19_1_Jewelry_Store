import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_jewerly/ProdukFemale.dart';
import 'package:project_jewerly/drawer.dart';

import 'kategoriMale.dart';
import 'login_screen.dart';
import 'mainPage.dart';

class KategoriFemale extends StatefulWidget {
  const KategoriFemale({Key? key}) : super(key: key);

  @override
  State<KategoriFemale> createState() => _KategoriFemaleState();
}

class _KategoriFemaleState extends State<KategoriFemale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FEMALE CATEGORIES",
          style: TextStyle(letterSpacing: 1, fontSize: 16),
        ),
        backgroundColor: Color(0xFF9B6A4F),
      ),
      drawer: MyDrawer(),
      backgroundColor: Color(0xFFF5F0EE),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(height: 20),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Gelang2(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "GELANG",
                  gambar: "assets/assetsFemale/gelang.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Cincin2(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "CINCIN",
                  gambar: "assets/assetsFemale/cincin.jpg",
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Kalung2(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "KALUNG",
                  gambar: "assets/assetsFemale/kalung.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Anting2(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "ANTING",
                  gambar: "assets/assetsFemale/anting.jpg",
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class KategoriProduk extends StatelessWidget {
  const KategoriProduk({
    Key? key,
    required this.categori,
    required this.gambar,
  }) : super(key: key);

  final String categori;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 140,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(gambar),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: 11),
        alignment: Alignment.bottomCenter,
        child: Text(
          categori,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 18,
            color: Color(0xFF87380B),
          ),
        ),
      ),
    );
  }
}
