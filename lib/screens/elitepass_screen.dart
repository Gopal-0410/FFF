import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/category_widget.dart';
import '../widgets/end_widget.dart';
import '../data/dummy_data.dart';

class ElitePassScreen extends StatelessWidget {
  const ElitePassScreen({Key? key}) : super(key: key);

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
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/bgimage.png'))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.9,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // mainAxisExtent: 20,
                  ),
                  children: elitepass_data
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
