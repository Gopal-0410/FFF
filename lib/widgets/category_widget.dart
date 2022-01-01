import 'package:fff/flutter_Adsdk/services/ad_display_helper/interstitial_ad_display_helper.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final String url;
  // ignore: use_key_in_widget_constructors
  const CategoryWidget({required this.name, required this.url});

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
              Navigator.of(context).pushNamed('/$name', arguments: name);
            },
            child: Padding(
                padding: const EdgeInsets.all(0),
                child: GridTile(
                  child: Image(
                    image: AssetImage(url),
                    alignment: Alignment.topCenter,
                    // fit: BoxFit.fill,
                  ),
                  footer: Text(
                    name,
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

//      Card(
//       elevation: 10,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       shadowColor: Colors.red,
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).pushNamed('/$name', arguments: name);
//         },
//         child: FittedBox(
//           fit: BoxFit.fill,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: Image(
//               image: AssetImage(url),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
