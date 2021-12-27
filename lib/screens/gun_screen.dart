// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

import '../widgets/end_widget.dart';

class GunScreen extends StatelessWidget {
  GunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          routeArgs,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bgimage.png'))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // mainAxisExtent: 20,
                  ),
                  children: gun_data
                      .map((cat) => EndWidget(name: cat.name, url: cat.url))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
