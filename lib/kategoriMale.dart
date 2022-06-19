import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:project_jewerly/drawer.dart';
import 'package:project_jewerly/users/profile.dart';

import 'ProdukMale.dart';
import 'kategoriFemale.dart';
import 'login_screen.dart';
import 'mainPage.dart';

class KategoriMale extends StatefulWidget {
  const KategoriMale({Key? key}) : super(key: key);

  @override
  State<KategoriMale> createState() => _KategoriMaleState();
}

class _KategoriMaleState extends State<KategoriMale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MALE CATEGORIES",
          style: TextStyle(letterSpacing: 1, fontSize: 16),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 218, 209, 201),
      drawer: MyDrawer(),
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
                      builder: (_) => Gelang(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "GELANG",
                  gambar: "assets/assetsMale/gelangM.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Cincin(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "CINCIN",
                  gambar: "assets/assetsMale/cincinMale.jpg",
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
                      builder: (_) => Kalung(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "KALUNG",
                  gambar: "assets/assetsMale/kalungM.jpg",
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Anting(),
                    ),
                  );
                },
                child: KategoriProduk(
                  categori: "ANTING",
                  gambar: "assets/assetsMale/antingMale.jpg",
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
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
