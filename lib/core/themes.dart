import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const lightColors = {
  "primary": Color.fromARGB(198, 216, 253, 255),
  "onPrimary": Color.fromARGB(255, 255, 255, 255),
  "secondary": Color.fromARGB(255, 166, 172, 255),
  "onSecondary": Color.fromARGB(255, 255, 255, 255),
  "surface": Color.fromARGB(254, 238, 239, 255),
  "onSurface": Color.fromARGB(36, 33, 90, 255),
  "success": Color.fromARGB(217, 73, 226, 34),
  "error": Color.fromARGB(217, 192, 21, 21),
  "onError": Color.fromARGB(255, 255, 255, 255),
};

const darkColors = {
  "primary": Color.fromARGB(255, 255, 255, 255),
  "onPrimary": Color.fromARGB(197, 64, 137, 141),
  "secondary": Color.fromARGB(255, 255, 255, 255),
  "onSecondary": Color.fromARGB(255, 164, 99, 99),
  "surface": Color.fromARGB(36, 33, 90, 255),
  "onSurface": Color.fromARGB(255, 255, 255, 255),
  "success": Color.fromARGB(217, 73, 226, 34),
  "error": Color.fromARGB(217, 192, 21, 21),
  "onError": Color.fromARGB(255, 255, 255, 255),
};

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: lightColors["primary"]!,
    onPrimary: lightColors["onPrimary"]!,
    secondary: lightColors["secondary"]!,
    onSecondary: lightColors["onSecondary"]!,
    error: lightColors["error"]!,
    onError: lightColors["onError"]!,
    surface: lightColors["surface"]!,
    onSurface: lightColors["onSurface"]!,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.kalam(),
    bodyMedium: GoogleFonts.kalam(),
    bodyLarge: GoogleFonts.kalam(),
    labelSmall: GoogleFonts.kalam(),
    headlineLarge: GoogleFonts.kalam(),
    displayLarge: GoogleFonts.kalam(),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: darkColors["primary"]!,
    onPrimary: darkColors["onPrimary"]!,
    secondary: darkColors["secondary"]!,
    onSecondary: darkColors["onSecondary"]!,
    error: darkColors["error"]!,
    onError: darkColors["onError"]!,
    surface: darkColors["surface"]!,
    onSurface: darkColors["onSurface"]!,
  ),
  textTheme: TextTheme(
    bodySmall: GoogleFonts.kalam(),
    bodyMedium: GoogleFonts.kalam(),
    bodyLarge: GoogleFonts.kalam(),
    labelSmall: GoogleFonts.kalam(),
    headlineLarge: GoogleFonts.kalam(),
    displayLarge: GoogleFonts.kalam(),
  ),
);
