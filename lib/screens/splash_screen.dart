import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            () => Navigator.pushReplacementNamed(context, HomeScreen.routName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blackBG,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/movies.png",
              width: 168,
              height: 187,
            ),
          ),
          Image.asset(
            "assets/images/splash_leading.png",
            width: 213,
            height: 128,
          ),
        ],
      ),
    );
  }
}
