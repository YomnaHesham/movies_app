import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/home_screen.dart';
import 'package:movies/screens/movie_details.dart';
import 'package:movies/screens/splash_screen.dart';

void main(){
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SplashScreen.routName: (context) => SplashScreen(),
          HomeScreen.routName: (context) => HomeScreen(),
          MovieDetails.routName: (context)=>MovieDetails(),
        },
        initialRoute: SplashScreen.routName,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );

  }
}
