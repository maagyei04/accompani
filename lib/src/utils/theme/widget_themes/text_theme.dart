import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      titleLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize:  20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize:  15,
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize:  17,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize:  15,
        fontWeight: FontWeight.normal,
      ),

    );
  static TextTheme darkTextTheme = TextTheme(
      titleLarge: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize:  20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize:  15,
        fontWeight: FontWeight.normal,
      ),
      headlineLarge: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize:  17,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize:  15,
        fontWeight: FontWeight.normal,
      ),
    );
}