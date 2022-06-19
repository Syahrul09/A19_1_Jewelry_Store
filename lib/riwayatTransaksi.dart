import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/CRUD/editAnting.dart';
import 'package:project_jewerly/CRUD/editCincin.dart';
import 'package:project_jewerly/adminPage.dart';
import 'package:project_jewerly/drawer.dart';
import 'package:project_jewerly/mainPage.dart';

import 'CRUD/EditGelang.dart';

class ItemTransaksi extends StatelessWidget {
  final String id;
  final String nama;
  final String harga;
  final String metode;
  final String jumlah;
  final String img;

  final Function? onDelete;

  ItemTransaksi(
      this.id, this.nama, this.harga, this.metode, this.jumlah, this.img,
      {this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 300,
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
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("$img"))),
            ),
            SizedBox(
              width: 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Produk : $nama"),
                Text("Harga : $harga"),
                Text("Metode Pembayaran :\n$metode"),
                Text("Jumlah : $jumlah"),
                Container(
                  margin: EdgeInsets.only(left: 136),
                  child: SizedBox(
                    height: 40,
                    width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          primary: Colors.red[900],
                        ),
                        child: Center(
                            child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        )),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("Yakin Hapus data?"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          if (onDelete != null) onDelete!();
                                          CustomAlert4(context,
                                              "Data Berhasil di Hapus");
                                        },
                                        child: Text("YES")),
                                    ElevatedButton(
                                        onPressed: () => Get.back(),
                                        child: Text("NO"))
                                  ],
                                );
                              });
                        }),
                  ),
                ),
              ],
            ),
            // Row(
            //   children: [

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}

class RiwayatTransaksi extends StatelessWidget {
  const RiwayatTransaksi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pemesanan = firestore.collection('pemesanan');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 31, 35),
        title: Text("Riwayat Pemesanan"),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Column(
            children: [
              FutureBuilder<QuerySnapshot>(
                  // future: produk_cincin.where('kategori',isEqualTo: 'pria').get(),
                  future: pemesanan.get(),
                  builder: (_, snapshot) {
                    return (snapshot.hasData)
                        ? Column(
                            children: snapshot.data!.docs
                                .map((e) => ItemTransaksi(
                                      e.id,
                                      e.get('nama'),
                                      e.get('harga'),
                                      e.get('metode'),
                                      e.get('jumlah'),
                                      e.get('gambar'),
                                      onDelete: () {
                                        pemesanan.doc(e.id).delete();
                                      },
                                    ))
                                .toList(),
                          )
                        : Text("Tidak ada data");
                  }),
            ],
          )
        ],
      ),
    );
  }
}

Future<dynamic> CustomAlert4(BuildContext context, String pesan) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(pesan),
          actions: [
            TextButton(onPressed: () => Get.to(MainPage()), child: Text("OK"))
          ],
        );
      });
}
