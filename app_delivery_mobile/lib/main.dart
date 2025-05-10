import 'package:app_delivery_mobile/ui/_core/app_theme.dart';
import 'package:app_delivery_mobile/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}