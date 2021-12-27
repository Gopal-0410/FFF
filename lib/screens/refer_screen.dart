import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:share/share.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    String _content =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum diam ipsum, lobortis quis ultricies non, lacinia at justo.';
    String subject = 'hello';
    void _shareContent(BuildContext context) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      Share.share(_content,
          subject: subject,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }

    return Scaffold(
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/share.png'),
                  ),
                ),
              )),
              Container(
                margin: const EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  'Well,Everyone knows sharing is caring.You can share this app with your friends so that they can also enterain themselves by using this app.',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.11,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/sharei.png'),
                      ),
                    ),
                  ),
                  onTap: () async {
                    _shareContent(context);
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
