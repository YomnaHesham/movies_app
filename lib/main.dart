import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/home_screen.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/screens/splash_screen.dart';
import 'package:movies/screens/tabs/browes/browse_tab.dart';
import 'package:movies/screens/tabs/browes/movies_category.dart';

void main() {
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
          MovieDetailsScreen.routName: (context) => MovieDetailsScreen(),
          MoviesCategory.routName: (context) => MoviesCategory(),
        },
        initialRoute: SplashScreen.routName,
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
