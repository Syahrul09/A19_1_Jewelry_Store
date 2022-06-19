import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/CRUD/editCincin.dart';
import 'package:project_jewerly/CRUD/editGelang.dart';
import 'package:project_jewerly/adminPage.dart';

class ItemGelang extends StatelessWidget {
  final String id;
  final String nama;
  final String jenis;
  final String kategori;
  final String stok;
  final String harga;
  final String desc;
  final String img;

  final Function? onDelete;

  final Function? onUpdate;

  ItemGelang(this.id, this.nama, this.jenis, this.kategori, this.stok,
      this.harga, this.desc, this.img,
      {this.onDelete, this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 209, 206, 206),
            blurRadius: 7,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                // width: 100,
                height: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage("$img"), fit: BoxFit.cover)),
              ),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Nama Produk  : $nama",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  " Jenis Produk   : $jenis",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  " Kategori           : $kategori",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  " Stok                  : $stok",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  " Harga               : $harga",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  " Deskripsi         : $desc",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
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
                                        CustomAlert2(
                                            context, "Data Berhasil di Hapus");
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
                SizedBox(
                  height: 40,
                  width: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.red[900],
                      ),
                      child: Center(
                          child: Icon(
                        Icons.update,
                        color: Colors.white,
                      )),
                      onPressed: () {
                        // if (onUpdate != null) onUpdate!();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Edit_Gelang(id, nama,
                                    jenis, kategori, stok, harga, desc)));
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
