// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/home.dart';
import 'package:firebase_login/login.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

_login(context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

class _RegisterState extends State<Register> {
  bool _validate = false;
  bool _validate1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 70),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Center(
                      child:
                          Image(image: AssetImage('assets/images/Logo.png'))),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: sized_box_for_whitespace
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        width: 290,
                        decoration: BoxDecoration(
                          color: Color(0xfff2f2f2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter your email",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          _validate ? 'Value Can\'t Be Empty' : "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 60,
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 24,
                        ),
                        width: 290,
                        decoration: BoxDecoration(
                          color: Color(0xfff2f2f2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: "Enter your password",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 24,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          _validate1 ? 'Value Can\'t Be Empty' : "",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24,
                    ),
                    width: 290,
                    decoration: BoxDecoration(
                      color: Color(0xffFE2550),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _login(context);
                        print(email.text);
                        print(password.text);

                        setState(() {
                          email.text.isEmpty
                              ? _validate = true
                              : _validate = false;
                          password.text.isEmpty
                              ? _validate1 = true
                              : _validate1 = false;
                          email.text = "";
                          password.text = "";
                        });
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24,
                    ),
                    width: 290,
                    decoration: BoxDecoration(
                      color: Color(0xffFE2550),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        signInWithGoogle();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Home()),
                        );
                      },
                      child: Text(
                        'Sign with Google',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Container(
                          height: 5,
                          width: 123,
                          color: Color(0xFFB0B0B0),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                              color: Color(0xffA4A4A4), fontFamily: 'Raleway'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 5,
                          width: 123,
                          color: Color(0xFFB0B0B0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24,
                    ),
                    width: 290,
                    decoration: BoxDecoration(
                      color: Color(0xffFE2550),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: Text(
                        'Back To Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
