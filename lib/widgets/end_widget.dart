import 'package:fff/flutter_Adsdk/services/admob_ad_display_helper/interstitial_ad_display_helper.dart';

import 'package:flutter/material.dart';

class EndWidget extends StatefulWidget {
  final String name;
  final String url;
  // ignore: use_key_in_widget_constructors
  const EndWidget({required this.name, required this.url});

  @override
  State<EndWidget> createState() => _EndWidgetState();
}

class _EndWidgetState extends State<EndWidget> {
  @override
  void initState() {
    //   setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // InterstitialAdDisplayHelper().admobInterstitialAdUnitId1Dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 23, 23, 23),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side: BorderSide(color: Colors.red)
            ),
          ),
          child: GestureDetector(
            onTap: () async {
              await InterstitialAdDisplayHelper().showInterstitialAd();
              Navigator.of(context)
                  .pushNamed('/END', arguments: [widget.url, widget.name]);
            },
            child: Padding(
                padding: const EdgeInsets.all(0),
                child: GridTile(
                  child: Image(
                    image: AssetImage(widget.url),
                    alignment: Alignment.topCenter,
                    // fit: BoxFit.fill,
                  ),
                  footer: Text(
                    widget.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
