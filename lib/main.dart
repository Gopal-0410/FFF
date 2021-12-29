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
import 'screens/dialogbox.dart';
import 'flutter_Adsdk/services/share_preferences_data_getter.dart';
import 'screens/end_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  var internetStatus;
  var status;

  Future getinternetstate() async {
    InternetConnection internetConnection = InternetConnection();
    internetStatus = await internetConnection.internetConnection();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    SharePreferencesDataGetter sp = SharePreferencesDataGetter();
    status = await sp.getStatus();
    var name = await sp.getAppName();
    print("main screen : $status");
    print("main screen : $name");
    // var adShowStatus = await sp.getAppAdShowStatusk();
    // print("adShowStatus : $adShowStatus");
    // adShowStatus == "1" ? print("show ads") : print("do not show ads");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getinternetstate(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          } else if (snapshot.hasError) {
            return Container();
          } else {
            return MaterialApp(
              title: 'FFF SKINS',
              theme: ThemeData(
                fontFamily: 'Muli',
                primaryColor: Colors.blueGrey,
                primarySwatch: Colors.blueGrey,
              ),
              routes: <String, WidgetBuilder>{
                '/homeScreen': (BuildContext context) => const HomeScreen(),
                '/Trending': (BuildContext context) => const TrendingScreen(),
                '/Pro Dress': (BuildContext context) => const ProDressScreen(),
                '/Gun Skins': (BuildContext context) => const GunScreen(),
                '/Rare Emotes': (BuildContext context) =>
                    const RareEmotesScreen(),
                '/Refer': (BuildContext context) => const ReferScreen(),
                '/Elite Pass': (BuildContext context) =>
                    const ElitePassScreen(),
                '/How To Use?': (BuildContext context) =>
                    const HowToUseScreen(),
                '/Incubator': (BuildContext context) => const IncubatorScreen(),
                '/Faded Wheel': (BuildContext context) =>
                    const FadedWheelScreen(),
                '/Events': (BuildContext context) => const EventsScreen(),
                '/END': (BuildContext context) => const EndScreen(),
                '/Start': (BuildContext context) => const StartScreen(),
                DialogBox.routName: (BuildContext context) => const DialogBox(),
              },
              home: internetStatus == true
                  ? const SplashScreen()
                  : Center(
                      child: ElevatedButton(
                        child: const Text('No Internet Press!'),
                        onPressed: () {
                          setState(
                            () {},
                          );
                        },
                      ),
                    ),
            );
          }
        });
  }
}
