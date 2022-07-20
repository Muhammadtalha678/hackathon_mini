import 'dart:async';

import 'package:firebase_login/page1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    Timer(
        // ignore: prefer_const_constructors
        Duration(
          seconds: 3,
        ),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (BuildContext context) => OnBroadScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFE2550),
      body: Center(
          child: Image(
        image: AssetImage("assets/images/Vector.png"),
      )),
    );
  }
}
