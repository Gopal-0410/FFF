import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';

late BannerAd _bottomBannerAd;
bool _isBannerAdLoaded = false;

class AdDisplayHelper {

  void createBottomBannerAd() {
    _bottomBannerAd = BannerAd(adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_){
        print('ad loads from here');
        _isBannerAdLoaded = true;
      }, onAdFailedToLoad: (ad,error){
        print('ad failed from here');
        ad.dispose();
      }),
    );
    _bottomBannerAd.load();
  }

  bool isadloaded(){
    if (_isBannerAdLoaded == true){
      print('ad loaded true');
      return true;
    }
    else{
      print('ad loaded false');
      return false;
    }
  }

  void adDisposMethod(){
    _bottomBannerAd.dispose();
  }

  double banneradheight(){
    return _bottomBannerAd.size.height.toDouble();
  }

  double banneradwidth(){
    return _bottomBannerAd.size.width.toDouble();
  }

  BannerAd bannerad(){
    return _bottomBannerAd;
  }
}
