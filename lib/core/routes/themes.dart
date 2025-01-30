import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

const colors = {
  "primary": Color.fromARGB(198, 216, 253, 255),
  "onPrimary": Color.fromARGB(255, 255, 255, 255),
  "secondary": Color.fromARGB(255, 166, 172, 255),
  "onSecondary": Color.fromARGB(255, 255, 255, 255),
  "surface": Color.fromARGB(254, 238, 239, 255),
  "onSurface": Color.fromARGB(36, 33, 90, 255),
  "success": Color.fromARGB(217, 73, 226, 34),
  "error": Color.fromARGB(217, 192, 21, 21),
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
};

final lightTheme = ThemeData(
    textTheme: TextTheme(
  bodySmall: TextStyle(),
  bodyMedium: TextStyle(),
  bodyLarge: TextStyle(),
  labelSmall: TextStyle(),
));

final darkTheme = ThemeData();
