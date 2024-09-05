import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFFFFB224);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blackBG = Color(0xFF1E1E1E);
  static const Color grayBG = Color(0xFF282A28);
  static const Color grayDate = Color(0xFFB5B4B4);
  static const Color grayBody = Color(0xFFCBCBCB);
  static const Color line = Color(0xFF707070);
  static const Color search = Color(0xFF514F4F);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: blackBG,
    dividerColor: line,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: grayBG,
      elevation: 20,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: primary,
      unselectedItemColor: white,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.inder(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      titleMedium: GoogleFonts.inder(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      titleSmall: GoogleFonts.inder(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      bodyMedium: GoogleFonts.inder(
        color: grayBody,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      ),
      bodySmall: GoogleFonts.poppins(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
      headlineLarge: GoogleFonts.poppins(
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      headlineMedium: GoogleFonts.inder(
        color: grayDate,
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
      headlineSmall: GoogleFonts.inder(
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 8,
      ),
    ),
  );
}
