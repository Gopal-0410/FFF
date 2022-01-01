import 'package:fff/flutter_Adsdk/services/logic_for_ad_click_count/ad_click_count.dart';

import '../share_preferences_data_getter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

const int maxFailedLoadAttempts = 10;
InterstitialAd? admobinterstitialAd1;
int interstitialAd1LoadAttempts = 0;
bool? _isShowAd;

class InterstitialAdDisplayHelper {
  SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
  AdClickCount adClickCount = AdClickCount();

  void createadmobInterstitialAdUnitId1() async {
    var adShowStatus = await pref.getAppAdShowStatus();
    InterstitialAd.load(
      adUnitId: await AdHelper.admobInterstitialAdUnitId1,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          if (adShowStatus == '1') {
            admobinterstitialAd1 = ad;
            interstitialAd1LoadAttempts = 0;
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (adShowStatus == '1') {
            interstitialAd1LoadAttempts += 1;
            admobinterstitialAd1 = null;
          }

          if (interstitialAd1LoadAttempts <= maxFailedLoadAttempts) {
            createadmobInterstitialAdUnitId1();
          }
        },
      ),
    );
  }

  void showInterstitialAd() async {
    _isShowAd = await adClickCount.adClickDecrease();
    if (admobinterstitialAd1 != null) {
      admobinterstitialAd1!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createadmobInterstitialAdUnitId1();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createadmobInterstitialAdUnitId1();
        },
      );
      var adShowStatus = await pref.getAppAdShowStatus();
      // if (adShowStatus == '1') {
      if (_isShowAd!) {
        admobinterstitialAd1!.show();
      }
    }
  }

  void admobInterstitialAdUnitId1Dispose() {
    if (_isShowAd!) {
      admobinterstitialAd1?.dispose();
    }
  }
}
