import 'package:fff/flutter_Adsdk/services/logic_for_ad_click_count/ad_click_count.dart';

import '../share_preferences_data_getter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

const int maxFailedLoadAttempts = 10;
InterstitialAd? admobForwardInterstitialAd;
int interstitialAd1LoadAttempts = 0;
bool? isShowAd = false;

class InterstitialAdDisplayHelper {
  SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
  AdClickCount adClickCount = AdClickCount();

  void createForwardAdmobInterstitialAdUnit() async {
    var adShowStatus = await pref.getAppAdShowStatus();
    InterstitialAd.load(
      adUnitId: await AdHelper.admobInterstitialAdUnitId1,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          if (adShowStatus == '1') {
            admobForwardInterstitialAd = ad;
            interstitialAd1LoadAttempts = 0;
          }
        },
        onAdFailedToLoad: (LoadAdError error) {
          if (adShowStatus == '1') {
            interstitialAd1LoadAttempts += 1;
            admobForwardInterstitialAd = null;
          }

          if (interstitialAd1LoadAttempts <= maxFailedLoadAttempts) {
            createForwardAdmobInterstitialAdUnit();
          }
        },
      ),
    );
  }

  Future<void> showForwardInterstitialAd() async {
    isShowAd = await adClickCount.adClickDecrease();
    if (admobForwardInterstitialAd != null) {
      admobForwardInterstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          ad.dispose();
          createForwardAdmobInterstitialAdUnit();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          ad.dispose();
          createForwardAdmobInterstitialAdUnit();
        },
      );
      var adShowStatus = await pref.getAppAdShowStatus();

      if (adShowStatus == '1' && isShowAd!) {
        admobForwardInterstitialAd!.show();
      }
    }
  }

  void createForwardAdmobInterstitialAdUnitDispose() async {
    var adShowStatus = await pref.getAppAdShowStatus();

    if (adShowStatus == '1' && isShowAd!) {
      admobForwardInterstitialAd?.dispose();
    } else {
      return;
    }
  }
}
