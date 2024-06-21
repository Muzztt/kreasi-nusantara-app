import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

ThemeData getDefaultTheme() {
  return ThemeData().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.6,
      titleTextStyle: GoogleFonts.lato(
        color: Colors.blueGrey[700],
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.blueGrey[700],
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: infoColor,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blueGrey[900]!,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      titleMedium: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      titleLarge: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      bodyLarge: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      bodySmall: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
      bodyMedium: GoogleFonts.poppins(
        color: Colors.blueGrey[900],
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hoverColor: Colors.transparent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
      ),
      filled: true,
      fillColor: const Color(0xfffbfbfb),
    ),
  );
}
