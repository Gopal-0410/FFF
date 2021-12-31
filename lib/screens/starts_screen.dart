import 'package:fff/flutter_Adsdk/services/ad_display_helper/interstitial_ad_display_helper.dart';
import 'package:flutter/material.dart';
import '../flutter_Adsdk/services/share_preferences_data_getter.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  var status;
  @override
  void didChangeDependencies() async {
    SharePreferencesDataGetter sp = SharePreferencesDataGetter();
    status = await sp.getStatus();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/bgimage.jpg'),
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () async {
            if (await SharePreferencesDataGetter().getAppAdShowStatus() ==
                '1') {
              InterstitialAdDisplayHelper().showInterstitialAd();
              status == true
                  ? Navigator.of(context).pushNamed('/homeScreen')
                  : Container();
            } else {
              status == true
                  ? Navigator.of(context).pushNamed('/homeScreen')
                  : Container();
            }
          },
          child: Container(
            // margin:
            //EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
            height: 90,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/launch.png'))),
          ),
        ),
      ),
    );
  }
}
