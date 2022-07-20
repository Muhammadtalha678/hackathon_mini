// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Positioned(
              child: Image(
                  image:
                      AssetImage('assets/images/ap-x-90-395045-unsplash.png')),
            ),
            Positioned(
              // ignore: avoid_unnecessary_containers
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 55, left: 20),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Center(
                      child: Image(
                          image: AssetImage('assets/images/Vector (1).png')),
                    ),
                    SizedBox(
                      height: 290,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'NO',
                          style: TextStyle(
                              fontSize: 19,
                              fontFamily: "Raleway",
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: "AbrilFatface",
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Featured',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: "Raleway",
                              color: Color(0xffFE2550),
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Tailored',
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: "AbrilFatface",
                              color: Colors.white,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: const TextStyle(
                              fontSize: 20.0,
                            ),
                            // ignore: prefer_const_literals_to_create_immutables
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Jimmy Chuka ',
                                style: const TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      'exploring the \nnew range of winter fashion wear',
                                  style: TextStyle(
                                    fontFamily: 'RalewayLight',
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 300,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              'Shop Now',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
