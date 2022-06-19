import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/pembayaran.dart';

import 'mainPage.dart';
import 'userController.dart';

class Transaksi_Ctrl extends GetxController {
  final namaCtrl = TextEditingController();
  final hargaCtrl = TextEditingController();
  final totalCtrl = TextEditingController();
  final jumlahCtrl = TextEditingController();
  final imgCtrl = TextEditingController();
}

class DetailPage extends StatelessWidget {
  final String id;
  final String nama;
  final String jenis;
  final String kategori;
  final String stok;
  final String harga;
  final String desc;
  final String img;
  const DetailPage(this.id, this.nama, this.jenis, this.kategori, this.stok,
      this.harga, this.desc, this.img,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Transaksi_Ctrl t = Get.put(Transaksi_Ctrl());
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),

        backgroundColor: Color.fromARGB(255, 209, 205, 185),
        // elevation: 0,
        // toolbarOpacity: 0,
        // iconTheme: IconThemeData(
        //   color: Colors.black,
        // ),
      ),
      body: ListView(
        children: [
          Container(
            width: w,
            height: h / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("$img"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: w,
            height: h / 1.5,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 230, 216),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "$nama",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "IDR $harga",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 17),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "$desc",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 17),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Stok : ${stok}",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  width: 350,
                  margin: EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: t.jumlahCtrl,
                    decoration: InputDecoration(
                      hintText: "Masukkan Jumlah",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      t.namaCtrl.text = nama;
                      int sisa = 0;
                      sisa = int.parse(stok) - int.parse(t.jumlahCtrl.text);
                      int total = 0;
                      total = int.parse(harga) * int.parse(t.jumlahCtrl.text);
                      t.totalCtrl.text = total.toString();
                      t.imgCtrl.text = img;
                      Get.to(Bayar());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 163, 129, 98),
                      onPrimary: Color.fromARGB(255, 238, 239, 240),
                    ),
                    child: Text(
                      "Add to Card",
                      style: TextStyle(
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
