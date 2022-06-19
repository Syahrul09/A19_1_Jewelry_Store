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
import 'package:project_jewerly/adminPage.dart';

import '../controller/textCtrl.dart';
import 'Tampilan/tampilan_kalung.dart';

class Crud_Kalung extends StatefulWidget {
  @override
  State<Crud_Kalung> createState() => _Crud_KalungState();
}

class _Crud_KalungState extends State<Crud_Kalung> {
  // const Crud_Cincin({Key? key}) : super(key: key);
  final textCtrl c = Get.put(textCtrl());
  PlatformFile? ambilFile;

  Future pilihFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      ambilFile = result.files.first;
    });
  }

  Future unggahFile(ambilFile) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference produk_kalung = firestore.collection('kalung');
    String url;
    final File imageFile = File(ambilFile!.path);
    String fileName = basename(imageFile.path);
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("gambar_kalung").child(fileName);
    UploadTask uploadTask = ref.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
    url = await snapshot.ref.getDownloadURL();

    produk_kalung.add({
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
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "Kalung",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Create Produk Kalung",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    controller: c.namaCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nama Produk",
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
                      border: OutlineInputBorder(),
                      hintText: "Jenis Produk",
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
                      border: OutlineInputBorder(),
                      hintText: "Kategori",
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
                      border: OutlineInputBorder(),
                      hintText: "Stok",
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
                      border: OutlineInputBorder(),
                      hintText: "Harga",
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
                      border: OutlineInputBorder(),
                      hintText: "Deskripsi",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 34, 73, 201),
                    ),
                    onPressed: () {
                      pilihFile();
                    },
                    child: Text("Pilih Foto")),
                Text(ambilFile != null ? "${ambilFile!.name}" : ""),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 68, 64, 56),
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      unggahFile(ambilFile);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AdminPage()));
                    },
                    child: Text("Buat Data"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
