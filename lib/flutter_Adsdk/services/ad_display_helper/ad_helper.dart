import 'dart:io';
import '../share_preferences_data_getter.dart';

class AdHelper {
  static Future<String> get admobBannerAdUnitId async {
    SharePreferencesDataGetter pref = SharePreferencesDataGetter();
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
    SharePreferencesDataGetter pref = SharePreferencesDataGetter();
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
