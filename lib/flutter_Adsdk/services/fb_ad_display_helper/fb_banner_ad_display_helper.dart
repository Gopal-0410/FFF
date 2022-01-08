import 'dart:developer';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/cupertino.dart';
import 'fb_ad_helper.dart';

String? fbAdUnitId;

class ShowStandardFbBannerAd extends StatefulWidget {
  const ShowStandardFbBannerAd({Key? key}) : super(key: key);

  @override
  _ShowStandardFbBannerAdState createState() => _ShowStandardFbBannerAdState();
}

class _ShowStandardFbBannerAdState extends State<ShowStandardFbBannerAd> {
  FacebookBannerAd? fbBottomBannerAd;
  FbAdHelper fbAdHelperVariable = FbAdHelper();

  Future<String> check() async {
    print('Here banner ads show =========> ');
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

class ShowLargeFbBannerAd extends StatefulWidget {
  const ShowLargeFbBannerAd({Key? key}) : super(key: key);

  @override
  _ShowLargeFbBannerAdState createState() => _ShowLargeFbBannerAdState();
}

class _ShowLargeFbBannerAdState extends State<ShowLargeFbBannerAd> {
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

class ShowMediumFbBannerAd extends StatefulWidget {
  const ShowMediumFbBannerAd({Key? key}) : super(key: key);

  @override
  _ShowMediumFbBannerAdState createState() => _ShowMediumFbBannerAdState();
}

class _ShowMediumFbBannerAdState extends State<ShowMediumFbBannerAd> {
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
                  bannerSize: BannerSize.MEDIUM_RECTANGLE,
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
