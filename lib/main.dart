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
import '../flutter_Adsdk/services/internet_connection.dart';

import 'screens/end_screen.dart';

var internet_status;

void main() {
  runApp(MyApp());
}

Future getinternetstate() async{
  InternetConnection internetConnection = InternetConnection();
  internet_status = await internetConnection.internetConnection();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    getinternetstate();
    super.initState();
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
      home: internet_status == true ? SplashScreen() : Container(child: Text('No Internet'),)
    );
  }
}

