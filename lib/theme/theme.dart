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
);
