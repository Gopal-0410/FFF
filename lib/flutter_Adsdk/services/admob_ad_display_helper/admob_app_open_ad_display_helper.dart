import 'dart:developer';
import 'package:fff/flutter_Adsdk/services/logic_for_ad_click_count/ad_click_count.dart';
import '../share_preferences_data_getter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

AppOpenAd? _appOpenAd;
bool _isShowingAd = false;

class AdmobAppOpenAdDisplayHelper {
  String? _adShowStatus;
  String? _appOpenAdShowStatus;
  SharedPreferencesDataGetter prefDataGetter = SharedPreferencesDataGetter();
  AdClickCount adClickCount = AdClickCount();

  Future<bool> loadAdmobAppOpenAd() async {
    _adShowStatus = await prefDataGetter.getAppAdShowStatus();

    _appOpenAdShowStatus = await prefDataGetter.getAppOpenAdStatus();
    if (_adShowStatus == '1' && _appOpenAdShowStatus == '1') {
      AppOpenAd.load(
        adUnitId: await AdHelper.admobAppOpenAdUnitId,
        orientation: AppOpenAd.orientationPortrait,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
          onAdLoaded: (AppOpenAd ad) {
            //  if (_adShowStatus == '1' && _appOpenAdShowStatus == '1') {
            _appOpenAd = ad;
            //  }
          },
          onAdFailedToLoad: (error) {
            // if (_adShowStatus == '1' && _appOpenAdShowStatus == '1') {
            log('AppOpenAd failed to load: $error');
            // }
            // Handle the error.
          },
        ),
      );
    }

    return false;
  }

  void showAdmobAppOpenAd() async {
    _adShowStatus = await prefDataGetter.getAppAdShowStatus();
    _appOpenAdShowStatus = await prefDataGetter.getAppOpenAdStatus();
    if (_adShowStatus == '1' && _appOpenAdShowStatus == '1') {
      if (!isAdAvailable) {
        log('Tried to show ad before available.');
        loadAdmobAppOpenAd();
        return;
      }
      if (_isShowingAd) {
        log('Tried to show ad while already showing an ad.');
        return;
      }
      // Set the fullScreenContentCallback and show the ad.
      _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {
          _isShowingAd = true;

          log('$ad onAdShowedFullScreenContent');
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          log('$ad onAdFailedToShowFullScreenContent: $error');
          _isShowingAd = false;
          ad.dispose();
          _appOpenAd = null;
        },
        onAdDismissedFullScreenContent: (ad) {
          log('$ad onAdDismissedFullScreenContent');
          _isShowingAd = false;
          ad.dispose();
          _appOpenAd = null;
          loadAdmobAppOpenAd();
        },
      );

      // if (_adShowStatus == '1' && _appOpenAdShowStatus == '1') {
      _appOpenAd!.show();
      //}
    }
  }

  bool get isAdAvailable {
    if (_appOpenAd != null) {
      return true;
    }
    return false;
  }
}
