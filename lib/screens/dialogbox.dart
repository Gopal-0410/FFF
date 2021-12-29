import 'package:flutter/material.dart';

class DialogBox extends StatefulWidget {
  static const routName = '/DialogBox';
  const DialogBox({Key? key}) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            child: const Text("Retry"),
            onPressed: () {
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
