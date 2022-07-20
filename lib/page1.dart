// ignore_for_file: prefer_const_constructors

import 'package:firebase_login/pageselector/page2.dart';
import 'package:firebase_login/pageselector/page3.dart';
import 'package:firebase_login/pageselector/page4.dart';
import 'package:firebase_login/pageselector/page5.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBroadScreen extends StatefulWidget {
  const OnBroadScreen({Key? key}) : super(key: key);

  @override
  State<OnBroadScreen> createState() => _OnBroadScreenState();
}

class _OnBroadScreenState extends State<OnBroadScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              // ignore: prefer_const_constructors
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
              IntroPage5(),
            ],
          ),
          SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }
}
