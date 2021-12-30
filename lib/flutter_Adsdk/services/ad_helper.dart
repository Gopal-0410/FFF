import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

late BannerAd _bottomBannerAd;
bool _isBannerAdLoaded = false;

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    else if (Platform.isIOS){
      return '';
    }
    else {
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static String get InterstitialAdUnitId {
    if (Platform.isAndroid){
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    else if (Platform.isIOS){
      return '';
    }
    else {
      throw UnsupportedError('Unsupported Platform');
    }
  }
}