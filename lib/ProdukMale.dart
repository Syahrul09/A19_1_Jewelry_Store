import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_jewerly/cardAnting.dart';
import 'package:project_jewerly/cardCincin.dart';
import 'package:project_jewerly/cardGelang.dart';
import 'package:project_jewerly/cardKalung.dart';

import 'detailPage.dart';
import 'drawer.dart';

class Gelang extends StatelessWidget {
  const Gelang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_gelang = firestore.collection('gelang');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GELANG",
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_gelang.where('kategori', isEqualTo: 'pria').get(),
            // future: produk_gelang.get(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data!.docs
                          .map((e) => cardGelang(
                                e.id,
                                e.get('nama'),
                                e.get('jenis'),
                                e.get('kategori'),
                                e.get('stok'),
                                e.get('harga'),
                                e.get('desc'),
                                e.get('gambar'),
                              ))
                          .toList(),
                    )
                  : Text("Tidak ada data");
            }),
      ),
    );
  }
}

class Cincin extends StatelessWidget {
  const Cincin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_cincin = firestore.collection('cincin');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CINCIN",
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_cincin.where('kategori', isEqualTo: 'pria').get(),
            // future: produk_cincin.get(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data!.docs
                          .map((e) => cardCincin(
                                e.id,
                                e.get('nama'),
                                e.get('jenis'),
                                e.get('kategori'),
                                e.get('stok'),
                                e.get('harga'),
                                e.get('desc'),
                                e.get('gambar'),
                              ))
                          .toList(),
                    )
                  : Text("Tidak ada data");
            }),
      ),
    );
  }
}

class Kalung extends StatelessWidget {
  const Kalung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_kalung = firestore.collection('kalung');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "KALUNG",
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_kalung.where('kategori', isEqualTo: 'pria').get(),
            // future: produk_kalung.get(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data!.docs
                          .map((e) => cardKalung(
                                e.id,
                                e.get('nama'),
                                e.get('jenis'),
                                e.get('kategori'),
                                e.get('stok'),
                                e.get('harga'),
                                e.get('desc'),
                                e.get('gambar'),
                              ))
                          .toList(),
                    )
                  : Text("Tidak ada data");
            }),
      ),
    );
  }
}

class Anting extends StatelessWidget {
  const Anting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_anting = firestore.collection('anting');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ANTING",
          style: TextStyle(
            letterSpacing: 1,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_anting.where('kategori', isEqualTo: 'pria').get(),
            // future: produk_anting.get(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: snapshot.data!.docs
                          .map((e) => cardAnting(
                                e.id,
                                e.get('nama'),
                                e.get('jenis'),
                                e.get('kategori'),
                                e.get('stok'),
                                e.get('harga'),
                                e.get('desc'),
                                e.get('gambar'),
                              ))
                          .toList(),
                    )
                  : Text("Tidak ada data");
            }),
      ),
    );
  }
}
