import 'dart:convert';
import './ad_display_helper/banner_ad_display_helper.dart';
import './ad_display_helper/interstitial_ad_display_helper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future<bool> getApiData({
    required String packageName,
    required String hashKey,
    required String appOpenID,
    required String appModel,
  }) async {
    http.Response response = await http.post(Uri.parse(url), body: {
      'PHSUGSG6783019KG': packageName,
      'AFHJNTGDGD563200K': hashKey,
      'DTNHGNH7843DFGHBSA': appOpenID,
      'DBMNBXRY4500991G': appModel,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      var status = data['STATUS'];
      var appName = data['APP_SETTINGS']['app_name'];
      var appAccountName = data['APP_SETTINGS']['app_accountName'];
      var appAccountLink = data['APP_SETTINGS']['app_accountLink'];
      var appPackageName = data['APP_SETTINGS']['app_packageName'];
      var appLogo = data['APP_SETTINGS']['app_logo'];
      var appStatus = data['APP_SETTINGS']['app_status'];
      var appPrivacyPolicyLink = data['APP_SETTINGS']['app_privacyPolicyLink'];
      var appNeedInternet = data['APP_SETTINGS']['app_needInternet'];
      var appUpdateAppDialogStatus =
          data['APP_SETTINGS']['app_updateAppDialogStatus'];
      var appVersionCode = data['APP_SETTINGS']['app_versionCode'];
      var appRedirectOtherAppStatus =
          data['APP_SETTINGS']['app_redirectOtherAppStatus'];
      var appNewPackageName = data['APP_SETTINGS']['app_newPackageName'];
      var appDialogBeforeAdShow =
          data['APP_SETTINGS']['app_dialogBeforeAdShow'];
      var appAdShowStatus = data['APP_SETTINGS']['app_adShowStatus'];
      var appAppOpenAdStatus = data['APP_SETTINGS']['app_AppOpenAdStatus'];
      var appHowShowAd = data['APP_SETTINGS']['app_howShowAd'];
      var appAdPlatformSequence =
          data['APP_SETTINGS']['app_adPlatformSequence'];
      var appAlernateAdShow = data['APP_SETTINGS']['app_alernateAdShow'];
      var appHowShowAdInterstitial =
          data['APP_SETTINGS']['app_howShowAdInterstitial'];
      var appAdPlatformSequenceInterstitial =
          data['APP_SETTINGS']['app_adPlatformSequenceInterstitial'];
      var appAlernateAdShowInterstitial =
          data['APP_SETTINGS']['app_alernateAdShowInterstitial'];
      var appHowShowAdNative = data['APP_SETTINGS']['app_howShowAdNative'];
      var appAdPlatformSequenceNative =
          data['APP_SETTINGS']['app_adPlatformSequenceNative'];
      var appAlernateAdShowNative =
          data['APP_SETTINGS']['app_alernateAdShowNative'];
      var appHowShowAdBanner = data['APP_SETTINGS']['app_howShowAdBanner'];
      var appAdPlatformSequenceBanner =
          data['APP_SETTINGS']['app_adPlatformSequenceBanner'];
      var appAlernateAdShowBanner =
          data['APP_SETTINGS']['app_alernateAdShowBanner'];
      var appMainClickCntSwAd = data['APP_SETTINGS']['app_mainClickCntSwAd'];
      var appInnerClickCntSwAd = data['APP_SETTINGS']['app_innerClickCntSwAd'];

      //Getting Placements Data From Api

      // --------- >>>>>> Admob Placement Data
      var admobAdsShowStatus = data['PLACEMENT']['Admob']['ad_showAdStatus'];
      var admobAdLoadAdIdsType = data['PLACEMENT']['Admob']['ad_loadAdIdsType'];
      var admobAppID = data['PLACEMENT']['Admob']['AppID'];
      var admobBanner1 = data['PLACEMENT']['Admob']['Banner1'];
      var admobInterstitial1 = data['PLACEMENT']['Admob']['Interstitial1'];
      var admobNative1 = data['PLACEMENT']['Admob']['Native1'];
      var admobRewardedVideo1 = data['PLACEMENT']['Admob']['RewardedVideo1'];
      var admobRewardedInterstitial1 =
          data['PLACEMENT']['Admob']['RewardedInterstitial1'];
      var admobAppOpen1 = data['PLACEMENT']['Admob']['AppOpen1'];

      // --------- >>>>>>> fb Placement Data
      var fbAdsShowStatus =
          data['PLACEMENT']['Facebookaudiencenetwork']['ad_showAdStatus'];
      var fbAdLoadAdIdsType =
          data['PLACEMENT']['Facebookaudiencenetwork']['ad_loadAdIdsType'];
      var fbBanner1 = data['PLACEMENT']['Facebookaudiencenetwork']['Banner1'];
      var fbInterstitial1 =
          data['PLACEMENT']['Facebookaudiencenetwork']['Interstitial1'];
      var fbNative1 = data['PLACEMENT']['Facebookaudiencenetwork']['Native1'];
      var fbRewardedVideo1 =
          data['PLACEMENT']['Facebookaudiencenetwork']['RewardedVideo1'];
      var fbNativeBanner1 =
          data['PLACEMENT']['Facebookaudiencenetwork']['NativeBanner1'];

      // App setting data set in the Shared Preference
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('STATUS', status);
      sharedPreferences.setString('app_name', appName);
      sharedPreferences.setString('app_accountName', appAccountName);
      sharedPreferences.setString('app_accountLink', appAccountLink);
      sharedPreferences.setString('app_packageName', appPackageName);
      sharedPreferences.setString('app_logo', appLogo);
      sharedPreferences.setString('app_status', appStatus);
      sharedPreferences.setString(
          'app_privacyPolicyLink', appPrivacyPolicyLink);
      sharedPreferences.setString('app_needInternet', appNeedInternet);
      sharedPreferences.setString(
          'app_updateAppDialogStatus', appUpdateAppDialogStatus);
      sharedPreferences.setString('app_versionCode', appVersionCode);
      sharedPreferences.setString(
          'app_redirectOtherAppStatus', appRedirectOtherAppStatus);
      sharedPreferences.setString('app_newPackageName', appNewPackageName);
      sharedPreferences.setString(
          'app_dialogBeforeAdShow', appDialogBeforeAdShow);
      sharedPreferences.setString('app_adShowStatus', appAdShowStatus);
      sharedPreferences.setString('app_AppOpenAdStatus', appAppOpenAdStatus);
      sharedPreferences.setString('app_howShowAd', appHowShowAd);
      sharedPreferences.setString(
          'app_adPlatformSequence', appAdPlatformSequence);
      sharedPreferences.setString('app_alernateAdShow', appAlernateAdShow);
      sharedPreferences.setString(
          'app_howShowAdInterstitial', appHowShowAdInterstitial);
      sharedPreferences.setString('app_adPlatformSequenceInterstitial',
          appAdPlatformSequenceInterstitial);
      sharedPreferences.setString(
          'app_alernateAdShowInterstitial', appAlernateAdShowInterstitial);
      sharedPreferences.setString('app_howShowAdNative', appHowShowAdNative);
      sharedPreferences.setString(
          'app_adPlatformSequenceNative', appAdPlatformSequenceNative);
      sharedPreferences.setString(
          'app_alernateAdShowNative', appAlernateAdShowNative);
      sharedPreferences.setString('app_howShowAdBanner', appHowShowAdBanner);
      sharedPreferences.setString(
          'app_adPlatformSequenceBanner', appAdPlatformSequenceBanner);
      sharedPreferences.setString(
          'app_alernateAdShowBanner', appAlernateAdShowBanner);
      sharedPreferences.setString('app_mainClickCntSwAd', appMainClickCntSwAd);
      sharedPreferences.setString(
          'app_innerClickCntSwAd', appInnerClickCntSwAd);

      //Admob ads placement data set in the Shared Preference
      sharedPreferences.setString('admob_ad_showAdStatus', admobAdsShowStatus);
      sharedPreferences.setString(
          'admob_ad_loadAdIdsType', admobAdLoadAdIdsType);
      sharedPreferences.setString('admob_AppID', admobAppID);
      sharedPreferences.setString('admob_Banner1', admobBanner1);
      sharedPreferences.setString('admob_Interstitial1', admobInterstitial1);
      sharedPreferences.setString('admob_Native1', admobNative1);
      sharedPreferences.setString('admob_RewardedVideo1', admobRewardedVideo1);
      sharedPreferences.setString(
          'admob_RewardedInterstitial1', admobRewardedInterstitial1);
      sharedPreferences.setString('admob_AppOpen1', admobAppOpen1);

      //Fb Ads Placement data set in the shared preference
      sharedPreferences.setString('Fb_ad_showAdStatus', fbAdsShowStatus);
      sharedPreferences.setString('Fb_ad_loadAdIdsType', fbAdLoadAdIdsType);
      sharedPreferences.setString('Fb_Banner1', fbBanner1);
      sharedPreferences.setString('Fb_Interstitial1', fbInterstitial1);
      sharedPreferences.setString('Fb_Native1', fbNative1);
      sharedPreferences.setString('Fb_RewardedVideo1', fbRewardedVideo1);
      sharedPreferences.setString('Fb_NativeBanner1', fbNativeBanner1);
      BannerAdDisplayHelper().createBottomBannerAd();
      BannerAdDisplayHelper().createMediumRectangleBannerAd();
      InterstitialAdDisplayHelper().createadmobInterstitialAdUnitId1();
      return Future.value(true);
    } else {
      print("========================================");
      print("Fail to load Api");

      throw Exception('Failed To load Api');
    }
  }
}
