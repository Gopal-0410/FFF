import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fff/flutter_Adsdk/services/fb_ad_display_helper/fb_ad_helper.dart';
import 'package:fff/flutter_Adsdk/services/share_preferences_data_getter.dart';
import 'package:flutter/cupertino.dart';

FacebookBannerAd? fbBottomBannerAd;

class FbBannerAdDisplayHelper extends StatelessWidget {
  SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();

  FbBannerAdDisplayHelper({Key? key}) : super(key: key);

  Future<Widget> createFbBottomBannerAd() async {
    print(
        ' ================== here facebook ad created ====================================');
    print(FbAdHelper.fbAdUnitId);
    var adShowStatus = pref.getAppAdShowStatus();
    fbBottomBannerAd = FacebookBannerAd(
      placementId: await FbAdHelper.fbAdUnitId,
      bannerSize: BannerSize.STANDARD,
      listener: (result, value) {},
    );
    return fbBottomBannerAd!;
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
