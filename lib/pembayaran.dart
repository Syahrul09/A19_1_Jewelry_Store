import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:project_jewerly/controller/controller.dart';
import 'package:project_jewerly/detailPage.dart';
import 'package:project_jewerly/mainPage.dart';
import 'package:project_jewerly/userController.dart';

class Bayar extends StatefulWidget {
  // const Bayar({Key? key}) : super(key: key);

  @override
  State<Bayar> createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  final Transaksi_Ctrl t = Get.find();

  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Color.fromARGB(255, 233, 232, 232),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 90,
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Produk : ${t.namaCtrl.text}",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  "Total : ${t.totalCtrl.text}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Text(
                "Metode Pembayaran",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff263238), width: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cash on Delivery",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int?;
                            });
                          },
                        )
                      ],
                    ),
                  )),
              SizedBox(height: 10),
              Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff263238), width: 0.1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dana",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value as int?;
                            });
                          },
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.brown),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Mau Order?"),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      String metode = _value.toString() == "1"
                                          ? "Cash on Delevery"
                                          : "Dana";

                                      await FirebaseFirestore.instance
                                          .collection("pemesanan")
                                          .add({
                                        "nama": t.namaCtrl.text,
                                        "harga": t.totalCtrl.text,
                                        "metode": metode,
                                        "jumlah": t.jumlahCtrl.text,
                                        "gambar": t.imgCtrl.text
                                      });

                                      CustomAlert(
                                          context, "Barang sedang diproses");
                                    },
                                    child: Text("YES")),
                                ElevatedButton(
                                    onPressed: () => Get.back(),
                                    child: Text("NO"))
                              ],
                            );
                          });
                    },
                    child: Text("OK")),
              )
            ],
          )
        ],
      ),
    );
  }
}

Future<dynamic> CustomAlert(BuildContext context, String pesan) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(pesan),
          actions: [
            TextButton(onPressed: () => Get.to(Animation()), child: Text("OK"))
          ],
        );
      });
}

class Animation extends StatefulWidget {
  const Animation({Key? key}) : super(key: key);

  @override
  State<Animation> createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return MainPage();
        }),
      );
    });
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets7.lottiefiles.com/packages/lf20_fnx6v2dq.json"),
      ),
    );
  }
}
