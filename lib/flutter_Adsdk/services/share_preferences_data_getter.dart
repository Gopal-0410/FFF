import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDataGetter {
  Future getStatus() async {
    var status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getBool('STATUS');

    return Future.value(status);
  }

  Future getAppName() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_name');

    return Future.value(status);
  }

  Future getAppAccountName() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_accountName');
    return Future.value(status);
  }

  Future getAppAccountLink() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_accountLink');
    return Future.value(status);
  }

  Future getAppPackageName() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_packageName');
    return Future.value(status);
  }

  Future getAppLogo() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_logo');
    return Future.value(status);
  }

  Future getAppStatus() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_status');
    return Future.value(status);
  }

  Future getAppPrivacyPolicyLink() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_privacyPolicyLink');
    return Future.value(status);
  }

  Future getAppNeedInternet() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_needInternet');
    return Future.value(status);
  }

  Future getAppUpdateAppDialogStatus() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_updateAppDialogStatus');
    return Future.value(status);
  }

  Future getAppVersionCode() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_versionCode');
    return Future.value(status);
  }

  Future getAppNewPackageName() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_newPackageName');
    return Future.value(status);
  }

  Future getAppDialogBeforeAdShow() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_dialogBeforeAdShow');
    return Future.value(status);
  }

  Future getAppAdShowStatus() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_adShowStatus');
    return Future.value(status);
  }

  Future getAppOpenAdStatus() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_AppOpenAdStatus');
    return Future.value(status);
  }

  Future getAppHowShowAd() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_howShowAd');
    return Future.value(status);
  }

  Future getAppAdPlatformSequence() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_adPlatformSequence');
    return Future.value(status);
  }

  Future getAppAlernateAdShow() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_alernateAdShow');
    return Future.value(status);
  }

  Future getAppHowShowAdInterstitial() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_howShowAdInterstitial');
    return Future.value(status);
  }

  Future getAppAdPlatformSequenceInterstitial() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_adPlatformSequenceInterstitial');
    return Future.value(status);
  }

  Future getAppAlernateAdShowInterstitial() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_alernateAdShowInterstitial');
    return Future.value(status);
  }

  Future getAppHowShowAdNative() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_howShowAdNative');
    return Future.value(status);
  }

  Future getAppAdPlatformSequenceNative() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_adPlatformSequenceNative');
    return Future.value(status);
  }

  Future getAppAlernateAdShowNative() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_alernateAdShowNative');
    return Future.value(status);
  }

  Future getAppHowShowAdBanner() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_howShowAdBanner');
    return Future.value(status);
  }

  Future getAppAdPlatformSequenceBanner() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_adPlatformSequenceBanner');
    return Future.value(status);
  }

  Future getAppAlernateAdShowBanner() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_alernateAdShowBanner');
    return Future.value(status);
  }

  Future getApp() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_howShowAdBanner');
    return Future.value(status);
  }

  Future getAppMainClickCntSwAd() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_mainClickCntSwAd');
    return Future.value(status);
  }

  Future<int> appDynamicForwardClick() async {
    String? forwardClickCount;
    int? appFrwdClick;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    forwardClickCount = sharedPreferences.getString('dynamicForwardClickCount');
    appFrwdClick = int.tryParse(forwardClickCount!);
    return Future.value(appFrwdClick);
  }

  Future getAppInnerClickCntSwAd() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('app_innerClickCntSwAd');
    return Future.value(status);
  }

  Future getAdmobAdShowAdStatus() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_ad_showAdStatus');
    return Future.value(status);
  }

  Future getAdmobAdloadAdIdsType() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('ad_loadAdIdsType');
    return Future.value(status);
  }

  Future getAdmobAppID() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('AppID');
    return Future.value(status);
  }

  Future<String> getAdmobBanner1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_Banner1');
    return Future.value(status);
  }

  Future getAdmobInterstitial1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_Interstitial1');
    return Future.value(status);
  }

  Future getAdmobNative1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_Native1');
    return Future.value(status);
  }

  Future getAdmobRewardedVideo1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_RewardedVideo1');
    return Future.value(status);
  }

  Future getAdmobRewardedInterstitial1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_RewardedInterstitial1');
    return Future.value(status);
  }

  Future getAdmobAppOpen1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('admob_AppOpen1');
    return Future.value(status);
  }

  Future getFbAdShowAdStatus() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_ad_showAdStatus');
    return Future.value(status);
  }

  Future getFbAdLoadAdIdsType() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_ad_loadAdIdsType');
    return Future.value(status);
  }

  Future getFbBanner1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_Banner1');
    return Future.value(status);
  }

  Future getFbInterstitial1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_Interstitial1');
    return Future.value(status);
  }

  Future getFbNative1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_ad_showAdStatus');
    return Future.value(status);
  }

  Future getFbRewardedVideo1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_RewardedVideo1');
    return Future.value(status);
  }

  Future getFbNativeBanner1() async {
    String? status;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    status = sharedPreferences.getString('Fb_NativeBanner1');
    return Future.value(status);
  }
}
