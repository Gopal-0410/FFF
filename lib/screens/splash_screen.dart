import 'dart:async';
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

  Future getApiData() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://adzzapps.com/AppsManager/api/v1/get_app.php');
    var apiData = await networkHelper.getApiData(
      packageName: 'com.healthyfood.bestdietplan',
      hashKey: '4nZYf4oVH16zBTF7ZWElrsrcpvU=',
      appOpenID: '26894',
      appModel: 'TRSOFTAG12789I',
    );
    SharePreferencesDataGetter sp = SharePreferencesDataGetter();
    status = sp.getAppName();
    return apiData;
  }

  @override
  void initState() {
    getApiData();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const StartScreen())));
    super.initState();
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
