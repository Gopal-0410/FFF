import 'dart:developer';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/cupertino.dart';
import 'fb_ad_helper.dart';

String? fbAdUnitId;

class ShowFbBannerAds extends StatefulWidget {
  const ShowFbBannerAds({Key? key}) : super(key: key);

  @override
  _ShowFbBannerAdsState createState() => _ShowFbBannerAdsState();
}

class _ShowFbBannerAdsState extends State<ShowFbBannerAds> {
  FacebookBannerAd? fbBottomBannerAd;
  FbAdHelper fbAdHelperVariable = FbAdHelper();

  Future<String> check() async {
    fbAdUnitId = await fbAdHelperVariable.fbAdUnitId;

    return fbAdUnitId!;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: check(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          alignment: const Alignment(1, 0),
          child: snapshot.hasData
              ? FacebookBannerAd(
                  placementId: fbAdUnitId!,
                  bannerSize: BannerSize.STANDARD,
                  listener: (result, value) {
                    switch (result) {
                      case BannerAdResult.ERROR:
                        log("Error: $value");
                        break;
                      case BannerAdResult.LOADED:
                        log("Loaded: $value");
                        break;
                      case BannerAdResult.CLICKED:
                        log("Clicked: $value");
                        break;
                      case BannerAdResult.LOGGING_IMPRESSION:
                        log("Logging Impression: $value");
                        break;
                    }
                  },
                )
              : null,
        );
      },
    );
  }
}
