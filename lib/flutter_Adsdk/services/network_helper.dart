import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getApiData({
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
      var Status = data['STATUS'];
      var app_name = data['APP_SETTINGS']['app_name'];
      var app_accountName = data['APP_SETTINGS']['app_accountName'];
      var app_accountLink = data['APP_SETTINGS']['app_accountLink'];
      var app_packageName = data['APP_SETTINGS']['app_packageName'];
      var app_logo = data['APP_SETTINGS']['app_logo'];
      var app_status = data['APP_SETTINGS']['app_status'];
      var app_privacyPolicyLink = data['APP_SETTINGS']['app_privacyPolicyLink'];
      var app_needInternet = data['APP_SETTINGS']['app_needInternet'];
      var app_updateAppDialogStatus =
          data['APP_SETTINGS']['app_updateAppDialogStatus'];
      var app_versionCode = data['APP_SETTINGS']['app_versionCode'];
      var app_redirectOtherAppStatus =
          data['APP_SETTINGS']['app_redirectOtherAppStatus'];
      var app_newPackageName = data['APP_SETTINGS']['app_newPackageName'];
      var app_dialogBeforeAdShow =
          data['APP_SETTINGS']['app_dialogBeforeAdShow'];
      var app_adShowStatus = data['APP_SETTINGS']['app_adShowStatus'];
      var app_AppOpenAdStatus = data['APP_SETTINGS']['app_AppOpenAdStatus'];
      var app_howShowAd = data['APP_SETTINGS']['app_howShowAd'];
      var app_adPlatformSequence =
          data['APP_SETTINGS']['app_adPlatformSequence'];
      var app_alernateAdShow = data['APP_SETTINGS']['app_alernateAdShow'];
      var app_howShowAdInterstitial =
          data['APP_SETTINGS']['app_howShowAdInterstitial'];
      var app_adPlatformSequenceInterstitial =
          data['APP_SETTINGS']['app_adPlatformSequenceInterstitial'];
      var app_alernateAdShowInterstitial =
          data['APP_SETTINGS']['app_alernateAdShowInterstitial'];
      var app_howShowAdNative = data['APP_SETTINGS']['app_howShowAdNative'];
      var app_adPlatformSequenceNative =
          data['APP_SETTINGS']['app_adPlatformSequenceNative'];
      var app_alernateAdShowNative =
          data['APP_SETTINGS']['app_alernateAdShowNative'];
      var app_howShowAdBanner = data['APP_SETTINGS']['app_howShowAdBanner'];
      var app_adPlatformSequenceBanner =
          data['APP_SETTINGS']['app_adPlatformSequenceBanner'];
      var app_alernateAdShowBanner =
          data['APP_SETTINGS']['app_alernateAdShowBanner'];
      var app_mainClickCntSwAd = data['APP_SETTINGS']['app_mainClickCntSwAd'];
      var app_innerClickCntSwAd = data['APP_SETTINGS']['app_innerClickCntSwAd'];

      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('STATUS', Status);
      sharedPreferences.setString('app_name', app_name);
      sharedPreferences.setString('app_accountName', app_accountName);
      sharedPreferences.setString('app_accountLink', app_accountLink);
      sharedPreferences.setString('app_packageName', app_packageName);
      sharedPreferences.setString('app_logo', app_logo);
      sharedPreferences.setString('app_status', app_status);
      sharedPreferences.setString(
          'app_privacyPolicyLink', app_privacyPolicyLink);
      sharedPreferences.setString('app_needInternet', app_needInternet);
      sharedPreferences.setString(
          'app_updateAppDialogStatus', app_updateAppDialogStatus);
      sharedPreferences.setString('app_versionCode', app_versionCode);
      sharedPreferences.setString(
          'app_redirectOtherAppStatus', app_redirectOtherAppStatus);
      sharedPreferences.setString('app_newPackageName', app_newPackageName);
      sharedPreferences.setString(
          'app_dialogBeforeAdShow', app_dialogBeforeAdShow);
      sharedPreferences.setString('app_adShowStatus', app_adShowStatus);
      sharedPreferences.setString('app_AppOpenAdStatus', app_AppOpenAdStatus);
      sharedPreferences.setString('app_howShowAd', app_howShowAd);
      sharedPreferences.setString(
          'app_adPlatformSequence', app_adPlatformSequence);
      sharedPreferences.setString('app_alernateAdShow', app_alernateAdShow);
      sharedPreferences.setString(
          'app_howShowAdInterstitial', app_howShowAdInterstitial);
      sharedPreferences.setString('app_adPlatformSequenceInterstitial',
          app_adPlatformSequenceInterstitial);
      sharedPreferences.setString(
          'app_alernateAdShowInterstitial', app_alernateAdShowInterstitial);
      sharedPreferences.setString('app_howShowAdNative', app_howShowAdNative);
      sharedPreferences.setString(
          'app_adPlatformSequenceNative', app_adPlatformSequenceNative);
      sharedPreferences.setString(
          'app_alernateAdShowNative', app_alernateAdShowNative);
      sharedPreferences.setString('app_howShowAdBanner', app_howShowAdBanner);
      sharedPreferences.setString(
          'app_adPlatformSequenceBanner', app_adPlatformSequenceBanner);
      sharedPreferences.setString(
          'app_alernateAdShowBanner', app_alernateAdShowBanner);
      sharedPreferences.setString('app_mainClickCntSwAd', app_mainClickCntSwAd);
      sharedPreferences.setString(
          'app_innerClickCntSwAd', app_innerClickCntSwAd);

      return data;
    } else {
      throw Exception('Failed To load Api');
    }
  }
}