import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: const Color.fromARGB(255, 255, 235, 208),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 235, 208),
    cardColor: Colors.orange,
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey,
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.black)),
      bodyMedium: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 20.0, color: Colors.black)),
      bodyLarge: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 24.0, color: Colors.black)),
      bodySmall: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 18.0, color: Colors.black)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: const Color.fromARGB(255, 45, 45, 45),
    cardColor: const Color.fromARGB(255, 147, 89, 1),
    colorScheme: const ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey,
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white)),
      bodyMedium: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 20.0, color: Colors.white)),
      bodyLarge: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 24.0, color: Colors.white)),
      bodySmall: GoogleFonts.roboto(
          textStyle: const TextStyle(fontSize: 18.0, color: Colors.white)),
    ),
  );
}
