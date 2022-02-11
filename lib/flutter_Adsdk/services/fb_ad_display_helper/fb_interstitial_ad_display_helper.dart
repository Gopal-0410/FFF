import 'package:facebook_audience_network/ad/ad_interstitial.dart';

class ShowFbInterstitalAds {
  bool isInterstitailAdLoaded = false;

  void loadInterstitalAd() {
    FacebookInterstitialAd.loadInterstitialAd(
        placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
        listener: (result, value) {
          print('InterstitalAd: $result--->$value');
          if (result == InterstitialAdResult.LOADED) {
            print(
                '============ Intserstitail Ads Is Loaded =======================');
            isInterstitailAdLoaded = true;
          }
          if (result == InterstitialAdResult.DISMISSED &&
              value['invalidated'] == true) {
            isInterstitailAdLoaded = false;
            loadInterstitalAd();
          }
        });
  }

  void showInterstitalAd() {
    if (isInterstitailAdLoaded == true) {
      FacebookInterstitialAd.showInterstitialAd();
    } else {
      print('flutter ads yet not loaded');
    }
  }
}
