import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/theme.dart';
import 'feature/home/provider/home_provider.dart';
import 'feature/home/screen/home.dart';
import 'feature/location/provider/location_provider.dart';
import 'feature/splash/screen/splash_screen.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate],
      theme: AppTheme.basic,
      supportedLocales: const [Locale('fa')],
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => const Home(),
      },
    );
  }
}
