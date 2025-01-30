import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Light mod için pastel tonları
const lightColors = {
  "primary": Color.fromARGB(255, 254, 236, 196), // Pastel sarı
  "onPrimary": Color.fromARGB(255, 0, 0, 0),
  "secondary": Color.fromARGB(255, 166, 172, 255), // Pastel mavi
  "onSecondary": Color.fromARGB(255, 0, 0, 0),
  "surface": Color.fromARGB(255, 240, 247, 255),
  "onSurface": Color.fromARGB(36, 33, 90, 255),
  "success": Color.fromARGB(217, 73, 226, 34),
  "error": Color.fromARGB(217, 192, 21, 21),
  "onError": Color.fromARGB(255, 255, 255, 255),
};

// Dark mod için pastel tonları
const darkColors = {
  "primary": Color.fromARGB(255, 28, 33, 53), // Koyu pastel renk
  "onPrimary": Color.fromARGB(255, 255, 255, 255),
  "secondary": Color.fromARGB(255, 164, 166, 99), // Koyu pastel yeşil
  "onSecondary": Color.fromARGB(255, 255, 255, 255),
  "surface": Color.fromARGB(255, 36, 33, 90),
  "onSurface": Color.fromARGB(255, 255, 255, 255),
  "success": Color.fromARGB(217, 73, 226, 34),
  "error": Color.fromARGB(217, 192, 21, 21),
  "onError": Color.fromARGB(255, 255, 255, 255),
};

// Google Fonts style'ını bir değişkende tutalım
final textTheme = TextTheme(
  bodySmall: GoogleFonts.kalam(),
  bodyMedium: GoogleFonts.kalam(),
  bodyLarge: GoogleFonts.kalam(),
  labelSmall: GoogleFonts.kalam(),
  headlineLarge: GoogleFonts.kalam(),
  displayLarge: GoogleFonts.kalam(),
);

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
  textTheme: textTheme, // Google font'ları tek yerde kullanalım
  appBarTheme: AppBarTheme(
    backgroundColor: lightColors["primary"],
    titleTextStyle: TextStyle(color: lightColors["onPrimary"], fontSize: 20),
    iconTheme: IconThemeData(
        color: lightColors["onPrimary"]), // AppBar ikonları beyaz olacak
  ),
  iconTheme:
      IconThemeData(color: lightColors["onPrimary"]), // Genel ikon rengi beyaz
  buttonTheme: ButtonThemeData(
      buttonColor: lightColors["primary"]), // Button renklerini ayarlama
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
  textTheme: textTheme, // Google font'ları tek yerde kullanalım
  appBarTheme: AppBarTheme(
    backgroundColor: darkColors["primary"],
    titleTextStyle: TextStyle(color: darkColors["onPrimary"], fontSize: 20),
    iconTheme: IconThemeData(
        color: darkColors["onPrimary"]), // AppBar ikonları beyaz olacak
  ),
  iconTheme:
      IconThemeData(color: darkColors["onPrimary"]), // Genel ikon rengi beyaz
  buttonTheme: ButtonThemeData(
      buttonColor: darkColors["primary"]), // Button renklerini ayarlama
);
