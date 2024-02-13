import 'package:flutter/material.dart';

ThemeData defaultTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  useMaterial3: true,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    bodySmall: TextStyle(fontSize: 9),
    bodyMedium: TextStyle(fontSize: 12),
    bodyLarge: TextStyle(fontSize: 14),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(234, 91, 68, 1),
    onPrimary: Color.fromRGBO(255, 255, 255, 1),
    secondary: Color.fromRGBO(72, 91, 120, 1),
    onSecondary: Color.fromRGBO(255, 255, 255, 1),
    error: Color.fromRGBO(234, 91, 68, 1),
    onError: Color.fromRGBO(255, 255, 255, 1),
    background: Color.fromRGBO(250, 250, 250, 1),
    onBackground: Color.fromRGBO(72, 91, 120, 1),
    surface: Color.fromRGBO(238, 125, 107, 1),
    onSurface: Color.fromRGBO(255, 255, 255, 1),
    primaryContainer: Color.fromRGBO(245, 193, 185, 1),
    secondaryContainer: Color.fromRGBO(139, 151, 167, 1),
    onSecondaryContainer: Color.fromRGBO(217, 217, 217, 1),
    onPrimaryContainer: Color.fromRGBO(39, 170, 75, 1),
  ),
);
