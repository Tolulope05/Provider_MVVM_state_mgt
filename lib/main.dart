import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt/provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'screens/count_example_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        title: 'State Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CountExampleProvider(),
      ),
    );
  }
}
