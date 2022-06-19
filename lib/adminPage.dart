import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_jewerly/CRUD/Tampilan/tampilan_anting.dart';
import 'package:project_jewerly/CRUD/Tampilan/tampilan_cincin.dart';
import 'package:project_jewerly/CRUD/Tampilan/tampilan_gelang.dart';
import 'package:project_jewerly/CRUD/Tampilan/tampilan_kalung.dart';

import 'login_screen.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "  ADMIN PAGE",
            style: TextStyle(
              letterSpacing: 1,
              // fontSize: 18,
              color: Colors.black,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                final mySnackbar = SnackBar(
                  content: Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  duration: Duration(seconds: 3),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Color.fromARGB(255, 252, 107, 96),
                );
                ScaffoldMessenger.of(context).showSnackBar(mySnackbar);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SignInPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.output_sharp,
                // color: Color(0xff821752),
              ),
            )
          ],
          // backgroundColor: Color.fromARGB(255, 178, 163, 155),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        // drawer: drawerAdmin(),
        // backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // backgroundColor: Color.fromARGB(255, 246, 240, 217),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Tampilan_Gelang(),
                      ),
                    );
                  },
                  child: KategoriProduk(
                    categori: "GELANG",
                    gambar: "assets/gambar/bracelets.png",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Tampilan_Cincin(),
                      ),
                    );
                  },
                  child: KategoriProduk(
                    categori: "CINCIN",
                    gambar: "assets/gambar/rings.png",
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Tampilan_Kalung(),
                      ),
                    );
                  },
                  child: KategoriProduk(
                    categori: "KALUNG",
                    gambar: "assets/gambar/necklace.png",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Tampilan_Anting(),
                      ),
                    );
                  },
                  child: KategoriProduk(
                    categori: "ANTING",
                    gambar: "assets/gambar/earring.png",
                  ),
                ),
              ],
            ),
          ],
        ));
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
      margin: EdgeInsets.all(7),
      width: 135,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 209, 206, 206),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
              margin: EdgeInsets.all(16),
              width: 70,
              child: Image.asset(gambar)),
          Container(
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
        ],
      ),
      // ),
    );
  }
}
