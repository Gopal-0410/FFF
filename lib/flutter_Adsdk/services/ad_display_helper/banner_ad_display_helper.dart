import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

late BannerAd _bottomBannerAd;
bool _isBannerAdLoaded = false;
late BannerAd _mediumRectangleBannerAd;
bool _isMediumRectangelBannerAdLoaded = false;
late BannerAd _fullBannerAd;
bool _fullBannerAdLoaded = false;
late BannerAd _largeBannerAd;
bool _largeBannerAdLoaded = false;

class BannerAdDisplayHelper {
  //************** Bottom Banner*******************//

  void createBottomBannerAd() async {
    _bottomBannerAd = BannerAd(
      adUnitId: await AdHelper.admobBannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        _isBannerAdLoaded = true;
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
    );
    await _bottomBannerAd.load();
  }

  bool isBottomadAdloaded() {
    if (_isBannerAdLoaded == true) {
      return true;
    } else {
      return false;
    }
  }

  void bottomAdDisposMethod() {
    _bottomBannerAd.dispose();
  }

  double bottomBanneradHeight() {
    return _bottomBannerAd.size.height.toDouble();
  }

  double bottomBanneradWidth() {
    return _bottomBannerAd.size.width.toDouble();
  }

  BannerAd bottomBannerAd() {
    return _bottomBannerAd;
  }

  //**************Medium Rectangle Banner*******************//
  void createMediumRectangleBannerAd() async {
    _mediumRectangleBannerAd = BannerAd(
      adUnitId: await AdHelper.admobBannerAdUnitId,
      size: AdSize.mediumRectangle,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        _isMediumRectangelBannerAdLoaded = true;
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
    );
    await _mediumRectangleBannerAd.load();
  }

  bool isMediumRectangleBannerAdloaded() {
    if (_isMediumRectangelBannerAdLoaded == true) {
      return true;
    } else {
      return false;
    }
  }

  double mediumRectangleBannerHeight() {
    return _mediumRectangleBannerAd.size.height.toDouble();
  }

  double mediumRectangleBannerWidth() {
    return _mediumRectangleBannerAd.size.width.toDouble();
  }

  void mediumRectangleBannerAdDispose() {
    _mediumRectangleBannerAd.dispose();
  }

  BannerAd mediumRectangleBannerAd() {
    return _mediumRectangleBannerAd;
  }

//************** Large Banner*******************//
  void createLargeBannerAd() async {
    _largeBannerAd = BannerAd(
      adUnitId: await AdHelper.admobBannerAdUnitId,
      size: AdSize.largeBanner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        _largeBannerAdLoaded = true;
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
    );
    await _largeBannerAd.load();
  }

  bool isLargeBannerAdloaded() {
    if (_largeBannerAdLoaded == true) {
      return true;
    } else {
      return false;
    }
  }

  double largeBannerHeight() {
    return _largeBannerAd.size.height.toDouble();
  }

  double largeBannerWidth() {
    return _largeBannerAd.size.width.toDouble();
  }

  void largeBannerAdDispose() {
    _largeBannerAd.dispose();
  }

  BannerAd largeBannerAd() {
    return _largeBannerAd;
  }

//************** Full Banner*******************//
  void createFullBannerAd() async {
    _fullBannerAd = BannerAd(
      adUnitId: await AdHelper.admobBannerAdUnitId,
      size: AdSize.fullBanner,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        _fullBannerAdLoaded = true;
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
      }),
    );
    await _fullBannerAd.load();
  }

  bool isFullBannerAdloaded() {
    if (_fullBannerAdLoaded == true) {
      return true;
    } else {
      return false;
    }
  }

  double fullBannerHeight() {
    return _fullBannerAd.size.height.toDouble();
  }

  double fullBannerWidth() {
    return _fullBannerAd.size.width.toDouble();
  }

  void fullBannerAdDispose() {
    _fullBannerAd.dispose();
  }

  BannerAd fullBannerAd() {
    return _fullBannerAd;
  }
}
