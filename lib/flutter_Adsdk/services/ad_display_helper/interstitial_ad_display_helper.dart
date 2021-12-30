import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

const int maxFailedLoadAttempts = 10;

class InterstitialAdDisplayHelper {
  InterstitialAd? interstitialAd;
  int interstitialLoadAttempts = 0;
  bool isInterstitialAdReady = false;
  // dynamic nextScreen;
  // InterstitialAdDisplayHelper(this.nextScreen);

  void createInterstitialAd() async {
    InterstitialAd.load(
      adUnitId: await AdHelper.admobInterstitialAdUnitId1,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          interstitialLoadAttempts = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          interstitialLoadAttempts += 1;
          interstitialAd = null;
          if (interstitialLoadAttempts <= maxFailedLoadAttempts) {
            createInterstitialAd();
          }
        },
      ),
    );
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createInterstitialAd();
        },
      );
      interstitialAd!.show();
    }
  }

  void dispose() {
    interstitialAd?.dispose();
  }
}
