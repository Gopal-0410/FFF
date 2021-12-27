// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:fff/screens/starts_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/bgimage.jpg'),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
            //  duration: Duration(seconds: 2),
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/playstore.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              'FFF:SKIN TOOL',
              style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
