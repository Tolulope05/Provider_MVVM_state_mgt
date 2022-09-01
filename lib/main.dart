import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_state_mgt/provider/color_provider.dart';
import './provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'provider/favorite_screen_provider.dart';
import 'screens/favorite_app/favorite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountProvider>(create: (_) => CountProvider()),
        ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'State Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FavoriteScreen(),
      ),
    );
  }
}
