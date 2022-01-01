import 'dart:async';
import 'package:fff/flutter_Adsdk/services/logic_for_ad_click_count/ad_click_count.dart';
import 'package:fff/flutter_Adsdk/services/share_preferences_data_getter.dart';
import 'package:fff/screens/starts_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() async {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const StartScreen())));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/bgimage.jpg'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35),
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
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
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
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
