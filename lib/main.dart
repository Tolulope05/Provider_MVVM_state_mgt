import 'package:flutter/material.dart';
import './provider/color_provider.dart';
import './provider/theme_change_provider.dart';
import './screens/themeChanger/theme_change.dart';
import './provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'provider/favorite_screen_provider.dart';

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
        ChangeNotifierProvider<ThemeChangeProvider>(
          create: (_) => ThemeChangeProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        final themeChanger = Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          title: 'State Management',
          themeMode: themeChanger.themeMode,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData.dark().copyWith(
              primaryColor: Colors.green,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.green,
              )),
          home: ThemeChange(),
        );
      }),
    );
  }
}
