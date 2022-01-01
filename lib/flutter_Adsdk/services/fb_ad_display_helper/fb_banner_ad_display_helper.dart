import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:fff/flutter_Adsdk/services/fb_ad_display_helper/fb_ad_helper.dart';
import 'package:fff/flutter_Adsdk/services/share_preferences_data_getter.dart';
import 'package:flutter/cupertino.dart';

FacebookBannerAd? fb_bottom_banner_ad;

class FbBannerAdDisplayHelper extends StatelessWidget{

  SharedPreferencesDataGetter pref = SharedPreferencesDataGetter();

  Future<Widget> CreateFbBottomBannerAd () async{
    print(' ============= > here facebook ad created');
    print(FbAdHelper.fbAdUnitId);
    var adShowStatus = pref.getAppAdShowStatus();
    fb_bottom_banner_ad = FacebookBannerAd(
      placementId: await FbAdHelper.fbAdUnitId,
      bannerSize: BannerSize.STANDARD,
      listener: (result,value){},
    );
    return fb_bottom_banner_ad!;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    throw UnimplementedError();
  }
}