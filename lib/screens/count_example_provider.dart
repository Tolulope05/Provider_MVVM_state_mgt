import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountExampleProvider extends StatelessWidget {
  const CountExampleProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context);
    print("There is a rebuild");

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
              countProvider.count.toString(),
              style: const TextStyle(fontSize: 50),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () => countProvider.updateCount(),
            child: Text("Increase"),
          ),
        ],
      ),
    );
  }
}
