import 'dart:io';
import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/CRUD/Tampilan/tampilan_cincin.dart';

import '../adminPage.dart';
import '../controller/textCtrl.dart';
import 'editGelang.dart';

class Edit_Cincin extends StatefulWidget {
  final String id;
  final String nama;
  final String jenis;
  final String kategori;
  final String stok;
  final String harga;
  final String desc;
  const Edit_Cincin(this.id, this.nama, this.jenis, this.kategori, this.stok,
      this.harga, this.desc,
      {Key? key})
      : super(key: key);
  @override
  State<Edit_Cincin> createState() => _Edit_CincinState();
}

class _Edit_CincinState extends State<Edit_Cincin> {
  final textCtrl c = Get.put(textCtrl());
  PlatformFile? ambilFile;

  Future pilihFile() async {
    //  DocumentSnapshot data = await FirebaseFirestore.instance.collection('cincin').doc(widget.id).get();
    //  String harga = data.get('harga');

    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      ambilFile = result.files.first;
    });
  }

  Future unggahFile(ambilFile, id) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_cincin = firestore.collection('cincin');
    String url;
    final File imageFile = File(ambilFile!.path);
    String fileName = basename(imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("gambar_cincin").child(fileName);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    url = await snapshot.ref.getDownloadURL();

    produk_cincin.doc(id).update({
      'nama': c.namaCtrl.text,
      'jenis': c.jenisCtrl.text,
      'kategori': c.katagoriCtrl.text,
      'stok': c.stokCtrl.text,
      'harga': c.hargaCtrl.text,
      'desc': c.desCtrl.text,
      'gambar': url
    });

    c.namaCtrl.text = "";
    c.jenisCtrl.text = "";
    c.katagoriCtrl.text = "";
    c.stokCtrl.text = "";
    c.hargaCtrl.text = "";
    c.desCtrl.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Update Produk Cincin",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 48, 45, 39),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 84, 78, 69),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.namaCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 84, 78, 69),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: widget.nama,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.jenisCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 84, 78, 69),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: widget.jenis,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.katagoriCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 84, 78, 69),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: widget.kategori,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.stokCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 84, 78, 69),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: widget.stok,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.hargaCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 84, 78, 69),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: widget.harga,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.desCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 84, 78, 69),
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: widget.desc,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      pilihFile();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 34, 73, 201),
                      onPrimary: Colors.white,
                    ),
                    child: Text("PILIH FOTO")),
                Text(ambilFile != null ? "${ambilFile!.name}" : ""),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Edit Data?"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        unggahFile(ambilFile, widget.id);
                                        CustomAlert2(
                                            context, "Data Berhasil di Update");
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 162, 150, 131),
                                        onPrimary: Colors.white,
                                      ),
                                      child: Text("YES")),
                                  ElevatedButton(
                                      onPressed: () => Get.to(AdminPage()),
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 162, 150, 131),
                                        onPrimary: Colors.white,
                                      ),
                                      child: Text("NO"))
                                ],
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 68, 64, 56),
                        onPrimary: Colors.white,
                      ),
                      child: Text("UPDATE DATA")),
                ),
                SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
