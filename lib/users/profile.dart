import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../login_screen.dart';
import '../userController.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    userController data = Get.find();
    final nama = TextEditingController(text: "${data.nama.value}");
    final jenis = TextEditingController(text: "${data.jenis.value}");
    final alamat = TextEditingController(text: "${data.alamat.value}");
    final kontak = TextEditingController(text: "${data.kontak.value}");
    final email = TextEditingController(text: "${data.email.value}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 31, 35),
        // backgroundColor: palette.bg1,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
              // color: palette.orange,
              ),
        ),
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 252, 252, 252),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage("assets/gambar/user.png"),
                    radius: 70.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '${nama.text}',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.edit,
                          color: Color.fromARGB(255, 255, 177, 177)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '${email.text}',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.edit,
                          color: Color.fromARGB(255, 255, 177, 177)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '${kontak.text}',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.edit,
                          color: Color.fromARGB(255, 255, 177, 177)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: '${alamat.text}',
                      hintStyle: TextStyle(color: Colors.black),
                      suffixIcon: Icon(Icons.edit,
                          color: Color.fromARGB(255, 255, 177, 177)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
