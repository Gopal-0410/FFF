import 'dart:io';
import '../share_preferences_data_getter.dart';

class AdHelper {
  static Future<String> get admobAppOpenAdUnitId async {
    SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
    String _admobAppOpenAdUnitId = await pref.getAdmobAppOpenId();

    if (Platform.isAndroid) {
      return Future.value(_admobAppOpenAdUnitId);
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static Future<String> get admobBannerAdUnitId async {
    SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
    var _admobBannerAdUnitId = await pref.getAdmobBanner1();
    if (Platform.isAndroid) {
      return Future.value(_admobBannerAdUnitId);
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw UnsupportedError('Unsupported Platform');
    }
  }

  static Future<String> get admobInterstitialAdUnitId1 async {
    SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();
    var _admobInterstitialAdUnitId1 = await pref.getAdmobInterstitial1();
    if (Platform.isAndroid) {
      return Future.value(_admobInterstitialAdUnitId1);
    } else if (Platform.isIOS) {
      return '';
    } else {
      throw UnsupportedError('Unsupported Platform');
    }
  }
}
