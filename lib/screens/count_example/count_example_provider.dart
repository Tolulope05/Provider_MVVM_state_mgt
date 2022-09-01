import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/count_provider.dart';

// ignore: slash_for_doc_comments
/**
 * REBUILING OF SCREEN USING PROVIDER
 * - When listen is false
 * - There wont be any rebuild of the full widget except the consumer widget.
 * - The provider is used to control the logic and updte the consumer and listen is set to falses
 */

class CountExampleProvider extends StatelessWidget {
  const CountExampleProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(
      context,
      listen: false, // this makes a rebuild of once
    );

    void startTime() {
      Timer.periodic(
        const Duration(seconds: 0),
        (timer) {
          countProvider.updateCount();
        },
      );
    }

    print("There was a full widget build ");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider State"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<CountProvider>(
            builder: (context, value, child) {
              print("rebuild from consumer");
              return Column(
                children: [
                  Center(
                    child: Text(
                      value.count.toString(),
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => value.updateCount(),
                    child: const Text("Consumer increase"),
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => countProvider.updateCount(),
            child: const Text("Provider Increase"),
          ),
          // Center(
          //   child: Text(
          //     countProvider.count.toString(),
          //     style: const TextStyle(fontSize: 50),
          //   ),
          // ),
          ElevatedButton(
            onPressed: () {
              startTime();
            },
            child: const Text("Start "),
          ),
        ],
      ),
    );
  }
}
