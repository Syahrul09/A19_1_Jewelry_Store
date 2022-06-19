import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/controller/controller.dart';
import 'package:project_jewerly/login_screen.dart';

import 'kategoriFemale.dart';
import 'kategoriMale.dart';
import 'mainPage.dart';
import 'riwayatTransaksi.dart';
import 'userController.dart';
import 'users/profile.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? userAuth = FirebaseAuth.instance.currentUser;
    final userController control = Get.put(userController());
    CollectionReference akun = FirebaseFirestore.instance.collection('akun');
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/gambar/cover.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  "JEWELERY STORE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
          ListTile(
            title: Text("HOME"),
            focusColor: Colors.black,
            selectedTileColor: Colors.black,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MainPage(),
                ),
              );
            },
          ),
          ListTile(
            focusColor: Colors.black,
            selectedTileColor: Colors.black,
            title: Text("MALE COLLECTION"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KategoriMale(),
                ),
              );
            },
          ),
          ListTile(
            focusColor: Colors.black,
            selectedTileColor: Colors.black,
            title: Text("FEMALE COLLECTION"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KategoriFemale(),
                ),
              );
            },
          ),
          ListTile(
            title: Text("RIWAYAT PEMESANAN"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RiwayatTransaksi(),
                ),
              );
            },
          ),
          ListTile(
            focusColor: Colors.black,
            selectedTileColor: Colors.black,
            title: Text("PROFIL"),
            onTap: () async {
              final data = await akun
                  .where("email", isEqualTo: "${userAuth?.email}")
                  .get();

              data.docs.forEach((element) {
                control.id.value = element.id;
                control.nama.value = element.get("nama");
                control.jenis.value = element.get("jenis");
                control.alamat.value = element.get("alamat");
                control.kontak.value = element.get("kontak");
                control.email.value = element.get("email");
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfilePage(),
                ),
              );
            },
          ),
          ListTile(
            focusColor: Colors.black,
            selectedTileColor: Colors.black,
            title: Text("Sign Out"),
            onTap: () {
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
          ),
        ],
      ),
    );
  }
}
