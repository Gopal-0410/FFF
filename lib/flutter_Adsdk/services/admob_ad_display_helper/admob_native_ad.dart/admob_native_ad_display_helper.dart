import 'package:flutter/material.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class NativeAds extends StatefulWidget {
  const NativeAds({Key? key}) : super(key: key);

  @override
  _NativeAdsState createState() => _NativeAdsState();
}

class _NativeAdsState extends State<NativeAds>
    with AutomaticKeepAliveClientMixin {
  final controller = NativeAdController();

  @override
  void initState() {
    super.initState();
    controller.load(keywords: ['car', 'sport']);
    controller.onEvent.listen((event) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.isLoaded
        ? NativeAd(
            height: 330,
            unitId: 'ca-app-pub-3940256099942544/2247696110',
            // unitId: MobileAds.nativeAdTestUnitId,

            loading: const Text('loading'),
            error: const Text('Ads failed to load'),
            icon: AdImageView(size: 80),
            headline: AdTextView(
              padding: const EdgeInsets.only(bottom: 10),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              maxLines: 1,
            ),
            media: AdMediaView(
              height: 180,
              width: MATCH_PARENT,
            ),
            attribution: AdTextView(
              width: WRAP_CONTENT,
              text: 'Ad',
              decoration: AdDecoration(
                  border: const BorderSide(color: Colors.green, width: 2),
                  borderRadius: AdBorderRadius.all(16)),
              style: const TextStyle(color: Colors.green),
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            ),
            button: AdButtonView(
              decoration: AdDecoration(backgroundColor: Colors.blue),
              elevation: 18,
              textStyle: const TextStyle(color: Colors.white),
              height: MATCH_PARENT,
            ),

            buildLayout: fullBuilder,
          )
        : const SizedBox(
            height: 330,
          );
  }

  @override
  // ignore: todo
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribuition, button) {
      return AdLinearLayout(
        decoration: AdDecoration(
          backgroundColor: Colors.black54,
        ),
        padding: const EdgeInsets.all(10),
        // The first linear layout width needs to be extended to the
        // parents height, otherwise the children won't fit good
        width: MATCH_PARENT,

        children: [
          media,
          AdLinearLayout(
            children: [
              icon,
              AdLinearLayout(children: [
                headline,
                AdLinearLayout(
                  children: [attribuition, advertiser, ratingBar],
                  orientation: HORIZONTAL,
                  width: MATCH_PARENT,
                ),
              ], margin: const EdgeInsets.only(left: 4)),
            ],
            gravity: LayoutGravity.center_horizontal,
            width: WRAP_CONTENT,
            orientation: HORIZONTAL,
            margin: const EdgeInsets.only(top: 6),
          ),
          AdLinearLayout(
            children: [button],
            orientation: HORIZONTAL,
          ),
        ],
      );
    };
