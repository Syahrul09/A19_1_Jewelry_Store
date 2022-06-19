import 'package:flutter/material.dart';
import 'package:project_jewerly/CRUD/EditGelang.dart';

import 'package:project_jewerly/adminPage.dart';
import 'package:project_jewerly/detailPage.dart';

class cardKalung extends StatelessWidget {
  final String id;
  final String nama;
  final String jenis;
  final String kategori;
  final String stok;
  final String harga;
  final String desc;
  final String img;

  // final Function? onDelete;

  // final Function? onUpdate;

  cardKalung(
    this.id,
    this.nama,
    this.jenis,
    this.kategori,
    this.stok,
    this.harga,
    this.desc,
    this.img,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => DetailPage(id, nama, jenis,
                            kategori, stok, harga, desc, img)));
              },
              child: Container(
                // margin: EdgeInsets.all(10),
                // width: 170,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("$img"),
                    fit: BoxFit.cover,
                  ),
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
