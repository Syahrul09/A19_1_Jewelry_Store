import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_jewerly/landing_page.dart';
import 'package:project_jewerly/mainPage.dart';
import 'package:project_jewerly/signup_screen.dart';

import 'adminPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// email field
                  SizedBox(height: height * 0.15),
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Mesta Jewelry Store",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 50),
                  TextField(
                    controller: emailCtrl,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  /// password field
                  SizedBox(height: height * 0.02),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  /// Login button
                  SizedBox(height: height * 0.05),
                  Container(
                    width: 200,
                    height: 50,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.brown,
                            primary: Colors.white),
                        onPressed: () async {
                          if (emailCtrl.text == "admin@gmail.com" &&
                              passwordCtrl.text == "123456") {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailCtrl.text,
                                    password: passwordCtrl.text)
                                .then((value) => Navigator.push(
                                    context,
                                    (MaterialPageRoute(
                                        builder: (context) =>
                                            const AdminPage()))));
                            emailCtrl.text = "";
                            passwordCtrl.text = "";
                          } else {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailCtrl.text,
                                      password: passwordCtrl.text)
                                  .then(
                                    (value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return const MainPage();
                                      }),
                                    ),
                                  );
                              emailCtrl.text = "";
                              passwordCtrl.text = "";
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'invalid-email') {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text('Email Not Found'),
                                              Text(
                                                  'Would you like to approve of this message?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.blue),
                                            child: const Text('Approve'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else if (e.code == 'wrong-password') {
                                print('email atau password salah');
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text(
                                                  'This is a demo alert dialog.'),
                                              Text(
                                                  'Would you like to approve of this message?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.blue),
                                            child: const Text('Approve'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              } else if (e.code == 'user-not-found') {
                                print('email atau password salah');
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: const <Widget>[
                                              Text('Email tidak tersedia'),
                                              Text(
                                                  'Would you like to approve of this message?'),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.blue),
                                            child: const Text('Approve'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              }
                            }
                          }
                        },
                        child: Text("Login")),
                  ),

                  /// forgot password Button
                  SizedBox(height: height * 0.02),
                  // TextButton(
                  //   onPressed: () {
                  //     // Get.to(ForgotPasswordScreen());
                  //   },
                  //   child: Text(
                  //     'Forgot Password?',
                  //     // style: GoogleFonts.poppins(
                  //     //   fontSize: 14.0,
                  //     //   fontWeight: FontWeight.w400,
                  //     //   color: AppColors.whiteColor,
                  //     // ),
                  //   ),
                  // ),

                  /// Don't Have an Account text
                  SizedBox(height: height * 0.02),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const WidgetSpan(child: SizedBox(width: 10.0)),
                        TextSpan(
                          text: 'SIGN UP', style: TextStyle(color: Colors.blue),

                          // style: GoogleFonts.poppins(
                          //   fontSize: 12.0,
                          //   fontWeight: FontWeight.w500,
                          //   // color: AppColors.whiteColor,
                          // ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(
                                  const SignUpPage(),
                                ),
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
