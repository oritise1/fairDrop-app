import 'package:flutter/material.dart';
import 'theme/brand_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const FairDropApp());
}

class FairDropApp extends StatelessWidget {
  const FairDropApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FairDrop',
      debugShowCheckedModeBanner: false,
      theme: FairDropTheme.lightTheme,
      // The app now points to the SplashScreen in the screens folder
      home: const SplashScreen(),
    );
  }
}