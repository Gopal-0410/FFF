import 'dart:async';
import 'package:fff/screens/starts_screen.dart';
import 'package:flutter/material.dart';
import '../flutter_Adsdk/services/network_helper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getApiData() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://adzzapps.com/AppsManager/api/v1/get_app.php');
    var apiData = await networkHelper.getApiData(
      packageName: 'com.example.fff',
      hashKey: '4nZYf4oVH16zBTF7ZWElrsrcpvU=',
      appOpenID: '26894',
      appModel: 'TRSOFTAG12789I',
    );
    return apiData;
  }

  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const StartScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getApiData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Text(
                  'Something went wrong please try again later!',
                ),
              ),
            );
          } else {
            var response = snapshot.data;
            print(response);
          }
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
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
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
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.25),
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
      },
    );
  }
}
