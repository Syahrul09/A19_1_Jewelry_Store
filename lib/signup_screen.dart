import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:project_jewerly/login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final namaCtrl = TextEditingController();
  final jenisCtrl = TextEditingController();
  final alamatCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final kontakCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final kopassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference akun = firestore.collection('akun');
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 217, 232),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: height * 0.07),

                  /// full name field
                  // SizedBox(height: height * 0.30),
                  TextField(
                    controller: namaCtrl,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: height * 0.01),

                  TextField(
                    controller: jenisCtrl,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: height * 0.01),

                  TextField(
                    controller: alamatCtrl,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: height * 0.01),

                  TextField(
                    controller: kontakCtrl,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Contact',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),

                  /// email field
                  SizedBox(height: height * 0.01),
                  TextField(
                    controller: emailCtrl,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  /// password field
                  SizedBox(height: height * 0.01),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: height * 0.01),

                  TextField(
                    controller: kopassCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),

                  /// signup button
                  SizedBox(height: height * 0.05),
                  ElevatedButton(
                    onPressed: () async {
                      if (passwordCtrl.text == kopassCtrl.text) {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailCtrl.text,
                                password: passwordCtrl.text);

                        akun.add({
                          'nama': namaCtrl.text,
                          'jenis': jenisCtrl.text,
                          'alamat': alamatCtrl.text,
                          'kontak': kontakCtrl.text,
                          'email': emailCtrl.text,
                          'noHp': kontakCtrl.text,
                          'password': passwordCtrl.text,
                        });
                        namaCtrl.text = "";
                        emailCtrl.text = "";
                        kontakCtrl.text = "";
                        passwordCtrl.text = "";
                        kopassCtrl.text = "";

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Password Salah"),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(30),
                      // ),
                    ),
                    child: Container(
                      height: 40,
                      width: 60,
                      child: const Center(
                        child: Text("Submit"),
                      ),
                    ),
                  ),

                  /// Don't Have an Account text
                  SizedBox(height: height * 0.05),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have account?',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(width: 10.0)),
                        TextSpan(
                          text: 'SIGN IN',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(
                                  const SignInPage(),
                                ),
                        ),
                      ],
                    ),
                  ),

                  /// Terms of services
                  SizedBox(height: height * 0.03),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By Signing Up, You agree our  ',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'TERMS OF SERVICES',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),

                          ///recognizer: TapGestureRecognizer(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
