// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/home.dart';
import 'package:firebase_login/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

_login(context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

class _LoginState extends State<Login> {
  bool _validate = false;
  bool _validate1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 70),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Center(
                  child: Center(
                      child:
                          Image(image: AssetImage('assets/images/Logo.png'))),
                ),
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
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Register()),
                      );
                    },
                    child: Text(
                      'Create A New Account',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
