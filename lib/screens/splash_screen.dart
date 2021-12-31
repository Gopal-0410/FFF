import 'dart:async';
import 'package:fff/flutter_Adsdk/services/ad_display_helper/banner_ad_display_helper.dart';
import 'package:fff/flutter_Adsdk/services/ad_display_helper/interstitial_ad_display_helper.dart';
import 'package:fff/screens/starts_screen.dart';
import 'package:flutter/material.dart';
import '../flutter_Adsdk/services/network_helper.dart';
import '../flutter_Adsdk/services/share_preferences_data_getter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var status;

  var ad_show_status;

  @override
  void didChangeDependencies() async {
    SharePreferencesDataGetter sp = SharePreferencesDataGetter();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const StartScreen())));
    status = await sp.getStatus();
    ad_show_status = await sp.getAppAdShowStatus();
    if (ad_show_status == '1') {
      BannerAdDisplayHelper().createBottomBannerAd();
      BannerAdDisplayHelper().createMediumRectangleBannerAd();
      InterstitialAdDisplayHelper().createInterstitialAd();
    }

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
