import 'package:fff/flutter_Adsdk/services/ad_display_helper/interstitial_ad_display_helper.dart';
import 'package:flutter/material.dart';

class EndScreen extends StatefulWidget {
  const EndScreen({Key? key}) : super(key: key);

  @override
  State<EndScreen> createState() => _EndScreenState();
}

class _EndScreenState extends State<EndScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          routeArgs[1].toString(),
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 0.06,
                        // decoration:
                        //     BoxDecoration(color: Theme.of(context).accentColor),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 165,
                          decoration: ShapeDecoration(
                            color: const Color.fromARGB(255, 23, 23, 23),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            image: DecorationImage(
                              //   fit: BoxFit.fill,
                              image: AssetImage(routeArgs[0]),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 150,
                        margin: const EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width * 0.47,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/end.png'))),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () async {
                        await InterstitialAdDisplayHelper()
                            .showInterstitialAd();
                        showDialog(
                          //barrierColor: Theme.of(context).canvasColor,
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0))),
                            title: const Text(
                              "Importing VIP Pack",
                              style: TextStyle(
                                  // color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              //style: TextStyle(color: Colors.white),
                            ),
                            content: const Text(
                              "You have older android version!!",
                              style: TextStyle(
                                  // color: Colors.white,
                                  ),
                              // style: TextStyle(color: Colors.white),
                            ),
                            actions: <Widget>[
                              // ignore: deprecated_member_use
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: const Text(
                                  "Ok",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/activate.png')),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
