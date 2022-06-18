// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    // Changing color of buttons
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
    ),
    buttonColor: Colors.white,
    accentColor: Colors.blue,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color.fromARGB(255, 41, 41, 41),
    colorScheme: const ColorScheme.dark(),
    // Changing color of buttons
    textTheme: const TextTheme(
      button: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
    ),
    buttonColor: const Color(
      0xFF262626,
    ),
    accentColor: const Color.fromARGB(255, 170, 12, 12),

    splashColor: Colors.white,
  );
}
