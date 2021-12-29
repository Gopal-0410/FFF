import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:fff/screens/elitepass_screen.dart';
import 'package:fff/screens/events_screen.dart';
import 'package:fff/screens/faded_wheel.dart';
import 'package:fff/screens/gun_screen.dart';
import 'package:fff/screens/home_screen.dart';
import 'package:fff/screens/howtouse_screen.dart';
import 'package:fff/screens/incubator_screen.dart';
import 'package:fff/screens/prodress_screen.dart';
import 'package:fff/screens/rareemotes_screen.dart';
import 'package:fff/screens/refer_screen.dart';
import 'package:fff/screens/splash_screen.dart';
import 'package:fff/screens/starts_screen.dart';
import 'package:fff/screens/trending_screen.dart';
import 'package:flutter/material.dart';

import 'screens/end_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Future<bool> internetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FFF SKINS',
      theme: ThemeData(
        fontFamily: 'Muli', primaryColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
        //    canvasColor: Colors.purple.shade100,
        // accentColor: Colors.purple.shade300
      ),
      routes: <String, WidgetBuilder>{
        // ignore: unnecessary_new
        '/homeScreen': (BuildContext context) => HomeScreen(),
        '/Trending': (BuildContext context) => const TrendingScreen(),
        '/Pro Dress': (BuildContext context) => ProDressScreen(),
        '/Gun Skins': (BuildContext context) => GunScreen(),
        '/Rare Emotes': (BuildContext context) => RareEmotesScreen(),
        '/Refer': (BuildContext context) => ReferScreen(),
        '/Elite Pass': (BuildContext context) => ElitePassScreen(),
        '/How To Use?': (BuildContext context) => HowToUseScreen(),
        '/Incubator': (BuildContext context) => IncubatorScreen(),
        '/Faded Wheel': (BuildContext context) => FadedWheelScreen(),
        '/Events': (BuildContext context) => EventsScreen(),
        '/END': (BuildContext context) => EndScreen(),
        '/Start': (BuildContext context) => StartScreen(),
      },
      home: SplashScreen(),
    );
  }
}
