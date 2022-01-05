import 'package:fff/flutter_Adsdk/services/admob_ad_display_helper/interstitial_ad_display_helper.dart';

import 'package:flutter/material.dart';

class ProDressScreen extends StatelessWidget {
  const ProDressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size, height, width;
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    var size = MediaQuery.of(context).size;
    List<String> tips = [
      'Elite Pass',
      'Incubator',
      'Faded Wheel',
      'Events',
    ];
    List<String> image = [
      'assets/images/pd/1.png',
      'assets/images/pd/2.png',
      'assets/images/pd/3.png',
      'assets/images/pd/4.png'
    ];
    var length = tips.length;
    // width = size.width * 0.6;
    var cwidth = size.width * 0.8;
    return Scaffold(
      // drawer:   Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          routeArgs,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bgimage.png'))),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                  itemCount: length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 90,
                      //padding: EdgeInsets.all(5),
                      width: cwidth,
                      child: Card(
                        elevation: 4,
                        // shadowColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: const Color.fromARGB(255, 23, 23, 23),

                        child: GestureDetector(
                          onTap: () async {
                            var val = tips[index];
                            InterstitialAdDisplayHelper().showInterstitialAd();
                            await Navigator.of(context)
                                .pushNamed('/$val', arguments: tips[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(image[index]))),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
