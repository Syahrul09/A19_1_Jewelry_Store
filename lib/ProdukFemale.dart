import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'cardAnting.dart';
import 'detailPage.dart';
import 'drawer.dart';
import 'cardGelang.dart';
import 'cardKalung.dart';

class Gelang2 extends StatelessWidget {
  const Gelang2({Key? key}) : super(key: key);

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
        backgroundColor: Color(0xFF9B6A4F),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_gelang.where('kategori', isEqualTo: 'wanita').get(),
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

class Cincin2 extends StatelessWidget {
  const Cincin2({Key? key}) : super(key: key);

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
        backgroundColor: Color(0xFF9B6A4F),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_cincin.where('kategori', isEqualTo: 'wanita').get(),
            // future: produk_cincin.get(),
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

class Kalung2 extends StatelessWidget {
  const Kalung2({Key? key}) : super(key: key);

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
        backgroundColor: Color(0xFF9B6A4F),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_kalung.where('kategori', isEqualTo: 'wanita').get(),
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

class Anting2 extends StatelessWidget {
  const Anting2({Key? key}) : super(key: key);

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
        backgroundColor: Color(0xFF9B6A4F),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: FutureBuilder<QuerySnapshot>(
            future: produk_anting.where('kategori', isEqualTo: 'wanita').get(),
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

class perProduk extends StatelessWidget {
  const perProduk({
    Key? key,
    required this.foto,
    required this.nama,
    required this.harga,
  }) : super(key: key);

  final String foto;
  final String nama;
  final String harga;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Container(
              // margin: EdgeInsets.all(10),
              // width: 170,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(foto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 3),
            Text(
              nama,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 10,
              ),
            ),
            SizedBox(height: 4),
            Text(
              harga,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
