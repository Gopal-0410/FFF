import 'package:fff/flutter_Adsdk/services/share_preferences_data_getter.dart';

import '../flutter_Adsdk/services/ad_display_helper/interstitial_ad_display_helper.dart';
import '../flutter_Adsdk/services/ad_display_helper/banner_ad_display_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    print('===========> value');
    print(BannerAdDisplayHelper().isMediumRectangleBannerAdloaded());

  }

  @override
  void dispose() {
    super.dispose();
    BannerAdDisplayHelper().bottomAdDisposMethod();
    BannerAdDisplayHelper().mediumRectangleBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      'assets/images/home/1.png',
      'assets/images/home/2.png',
      'assets/images/home/3.png',
      'assets/images/home/4.png',
      'assets/images/home/5.png',
      'assets/images/home/6.png',
    ];
    List<String> name = [
      'Trending',
      'Pro Dress',
      'Gun Skins',
      'Rare Emotes',
      'Refer',
      'How To Use?',
    ];

    return Scaffold(
      // bottomNavigationBar: BannerAdDisplayHelper().isBottomadAdloaded()
      //     ? SizedBox(
      //         height: BannerAdDisplayHelper().bottomBanneradHeight(),
      //         width: BannerAdDisplayHelper().bottomBanneradWidth(),
      //         child: AdWidget(
      //           ad: BannerAdDisplayHelper().bottomBannerAd(),
      //         ),
      //       )
      //     : Container(
      //         //here we will put custom ads
      //         ),
      drawer: Drawer(
        // elevation: 5,
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/home/tre.png'),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.72,
              color: Colors.grey,
              child: Column(
                children: [
                  // color: Colors.black45,

                  ListTile(
                    title: const Text(
                      'Trending',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/home/tre.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/Trending', arguments: 'Trending');
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    title:
                        const Text('Pro Dress', style: TextStyle(fontSize: 20)),
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/home/pro.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/Pro Dress', arguments: 'Pro Dress');
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    title: const Text(
                      'Incubator',
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage:
                          AssetImage('assets/images/incubator/incubator2.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/INCUBATOR', arguments: 'INCUBATOR');
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    title: const Text(
                      'Events',
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/events/1.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/EVENTS', arguments: 'EVENTS');
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    title: const Text(
                      'Elite Pass',
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: const CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/season/1.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/ELITE PASS', arguments: 'ELITE PASS');
                    },
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'FF SKINS',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bgimage.png'),
          ),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                child: BannerAdDisplayHelper().isMediumRectangleBannerAdloaded() ? SizedBox(height: BannerAdDisplayHelper().mediumRectangleBannerHeight(), width: BannerAdDisplayHelper().mediumRectangleBannerWidth(), child: AdWidget(ad: BannerAdDisplayHelper().mediumRectangleBannerAd()),) : null,
              ),
              Container(
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          AppBar().preferredSize.height) *
                      0.49,
                  child: ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Container(
                          height: 104,
                          margin: const EdgeInsets.only(top: 10),
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                InterstitialAdDisplayHelper()
                                    .showInterstitialAd();
                                var val = name[index];

                                await Navigator.of(context)
                                    .pushNamed('/$val', arguments: name[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 15.0,
                                  top: 5,
                                  left: 15,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(image[index]))),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
