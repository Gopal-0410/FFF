
import 'dart:developer';

import 'package:facebook_audience_network/ad/ad_interstitial.dart';

class ShowFbInterstitalAds {

  bool isInterstitailAdLoaded = false;

  void loadInterstitalAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          isInterstitailAdLoaded = true;
        }
        if (result == InterstitialAdResult.DISMISSED &&
            value['invalidated'] == true) {
          isInterstitailAdLoaded = false;
          loadInterstitalAd();
        }
      },);
  }

  void showInterstitalAd() {
    if (isInterstitailAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else {
      log('flutter ads yet not loaded');
    }
  }

}