import 'package:flutter/material.dart';
import 'package:kahanify_app/screens/sign_in.dart';
import 'package:kahanify_app/screens/signin_screen.dart';
import 'package:kahanify_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const SplashScreen(),
      ),
    );
  }
}

