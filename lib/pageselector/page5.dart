// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../login.dart';

class IntroPage5 extends StatefulWidget {
  const IntroPage5({Key? key}) : super(key: key);

  @override
  State<IntroPage5> createState() => _IntroPage5State();
}

class _IntroPage5State extends State<IntroPage5> {
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
                  image: AssetImage(
                      'assets/images/vishal-banik-535458-unsplash.png')),
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
                      height: 450,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 60,
                          width: 320,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    );
                                  },
                                  child: Text(
                                    'Continue with Email',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Raleway',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <TextSpan>[
                            TextSpan(
                              text: 'By clicking this button you agree to our ',
                              style: const TextStyle(
                                fontFamily: 'RalewayLight',
                              ),
                            ),
                            TextSpan(
                                text: '\nterms of service and privacy policy',
                                style: TextStyle(
                                  fontFamily: 'RalewayLight',
                                )),
                          ],
                        ),
                      ),
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
