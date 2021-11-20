

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:weather/feature/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:weather/feature/rules/screen/rules_screen.dart';
import 'package:weather/feature/splash/screen/splashScreen.dart';

import 'feature/home/screen/home_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        // ChangeNotifierProvider(create: (_) => Weather()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('fa')],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => HomeScreen(),
        // '/products': (context) => ListProductScreen(),
        // '/d': (context) => Photos(),
        // '/detailProduct': (context) => DetailScreen(),
      },
    );
  }
}
