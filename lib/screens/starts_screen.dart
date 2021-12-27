import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/bgimage.jpg'),
        ),
      ),
      child: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/homeScreen');
          },
          child: Container(
            // margin:
            //EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.8),
            height: 90,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/launch.png'))),
          ),
        ),
      ),
    );
  }
}
