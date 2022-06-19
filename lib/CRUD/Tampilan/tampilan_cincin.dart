import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_jewerly/CRUD/cincin_page.dart';
import 'package:project_jewerly/login_screen.dart';

import 'itemCincin.dart';

class Tampilan_Cincin extends StatelessWidget {
  const Tampilan_Cincin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_cincin = firestore.collection('cincin');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DATA CINCIN",
          style: TextStyle(
            letterSpacing: 1,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
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
        backgroundColor: Color.fromARGB(255, 205, 191, 170),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              FutureBuilder<QuerySnapshot>(
                  // future: produk_cincin.where('kategori',isEqualTo: 'pria').get(),
                  future: produk_cincin.get(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map((e) => ItemCincin(
                                      e.id,
                                      e.get('nama'),
                                      e.get('jenis'),
                                      e.get('kategori'),
                                      e.get('stok'),
                                      e.get('harga'),
                                      e.get('desc'),
                                      e.get('gambar'),
                                      onDelete: () {
                                        produk_cincin.doc(e.id).delete();
                                      },
                                      onUpdate: () {},
                                    ))
                                .toList(),
                          )
                        : Text("Tidak ada data");
                  }),
              SizedBox(height: 12),
              Container(
                margin: EdgeInsets.all(7),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Crud_Cincin()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 162, 150, 131),
                      onPrimary: Colors.white,
                    ),
                    child: Text("TAMBAH DATA")),
              )
            ],
          )
        ],
      ),
    );
  }
}
