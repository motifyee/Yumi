import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

ThemeData defaultTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: ThemeSelector.colors.primary,
    onPrimary: ThemeSelector.colors.onPrimary,
    secondary: ThemeSelector.colors.secondary,
    onSecondary: ThemeSelector.colors.onSecondary,
    error: ThemeSelector.colors.primary,
    onError: ThemeSelector.colors.onPrimary,
    background: ThemeSelector.colors.background,
    onBackground: ThemeSelector.colors.primary,
    surface: ThemeSelector.colors.onPrimary,
    onSurface: ThemeSelector.colors.secondary,
    inverseSurface: ThemeSelector.colors.primary,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: ThemeSelector.colors.primary,
      fontSize: ThemeSelector.fonts.font_24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: ThemeSelector.colors.primary,
      fontSize: ThemeSelector.fonts.font_16,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: ThemeSelector.colors.primary,
      fontSize: ThemeSelector.fonts.font_12,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: ThemeSelector.colors.primary,
      fontSize: ThemeSelector.fonts.font_12,
    ),
    headlineSmall: TextStyle(
      color: ThemeSelector.colors.primary,
      fontSize: ThemeSelector.fonts.font_9,
    ),
    displayLarge: TextStyle(
      color: ThemeSelector.colors.onPrimary,
      fontSize: ThemeSelector.fonts.font_14,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: ThemeSelector.colors.success,
      fontSize: ThemeSelector.fonts.font_10,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: ThemeSelector.colors.onPrimary,
      fontSize: ThemeSelector.fonts.font_12,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: ThemeSelector.colors.secondary,
      fontSize: ThemeSelector.fonts.font_14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: ThemeSelector.colors.secondary,
      fontSize: ThemeSelector.fonts.font_12,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
        color: ThemeSelector.colors.secondaryTant,
        fontSize: ThemeSelector.fonts.font_9),
    bodyLarge: TextStyle(
      color: ThemeSelector.colors.secondary,
      fontSize: ThemeSelector.fonts.font_14,
    ),
    bodyMedium: TextStyle(
      color: ThemeSelector.colors.secondary,
      fontSize: ThemeSelector.fonts.font_12,
    ),
    bodySmall: TextStyle(
      color: ThemeSelector.colors.onSuccess,
      fontSize: ThemeSelector.fonts.font_12,
      fontWeight: FontWeight.w300,
    ),
  ),
);
