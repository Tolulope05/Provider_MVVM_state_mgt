import 'dart:async';

import 'package:flutter/material.dart';

/// COUNT EXAMPLE USING STATEFUL WIDGET AND TIMER FUNCTION

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  int count = 5;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      // increaseNumber();
    });
  }

  void increaseNumber() {
    setState(() {
      count++;
    });
    // print(dat);
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider State"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              count.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => increaseNumber(),
        child: const Text("Add"),
      ),
    );
  }
}
