import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/CRUD/editAnting.dart';
import 'package:project_jewerly/CRUD/editCincin.dart';
import 'package:project_jewerly/adminPage.dart';

import 'CRUD/EditGelang.dart';

class ItemAnting extends StatelessWidget {
  final String id;
  final String nama;

  final String harga;
  final String metode;
  final String jumlah;
  final String img;

  ItemAnting(
    this.id,
    this.nama,
    this.harga,
    this.metode,
    this.jumlah,
    this.img,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("$img"))),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nama Produk : $nama"),
                Text("Harga : $harga"),
                Text("Metode : $metode"),
                Text("Jumlah : $jumlah"),
              ],
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       height: 40,
            //       width: 60,
            //       child: ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             shape: CircleBorder(),
            //             primary: Colors.red[900],
            //           ),
            //           child: Center(
            //               child: Icon(
            //             Icons.delete,
            //             color: Colors.white,
            //           )),
            //           onPressed: () {
            //             showDialog(
            //                 context: context,
            //                 builder: (context) {
            //                   return AlertDialog(
            //                     content: Text("Yakin Hapus data?"),
            //                     actions: [
            //                       ElevatedButton(
            //                           onPressed: () {
            //                             if (onDelete != null) onDelete!();
            //                             CustomAlert2(
            //                                 context, "Data Berhasil di Hapus");
            //                           },
            //                           child: Text("YES")),
            //                       ElevatedButton(
            //                           onPressed: () => Get.back(),
            //                           child: Text("NO"))
            //                     ],
            //                   );
            //                 });
            //           }),
            //     ),

            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
