import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: ThemeSelector.colors.primary,
  onPrimary: ThemeSelector.colors.onPrimary,
  secondary: ThemeSelector.colors.secondary,
  onSecondary: ThemeSelector.colors.onSecondary,
  error: ThemeSelector.colors.primary,
  onError: ThemeSelector.colors.onPrimary,
  surface: ThemeSelector.colors.onPrimary,
  onSurface: ThemeSelector.colors.secondary,
  inverseSurface: ThemeSelector.colors.primary,
);

ThemeData defaultTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  useMaterial3: true,
  colorScheme: colorScheme,
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
  timePickerTheme: timePickerTheme,
  buttonTheme: ButtonThemeData(
    buttonColor: ThemeSelector.colors.secondaryFaint,
    minWidth: 0,
    colorScheme: colorScheme,
    shape: CircleBorder(eccentricity: .1),
  ),
);

// https://developer.school/snippets/flutter/how-to-customise-the-timepicker-widget
final timePickerTheme = TimePickerThemeData(
  backgroundColor: Colors.blueGrey,
  hourMinuteShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.orange, width: 4),
  ),
  dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
  dayPeriodColor: Colors.blueGrey.shade600,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.orange, width: 4),
  ),
  dayPeriodTextColor: Colors.white,
  dayPeriodShape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
    side: BorderSide(color: Colors.orange, width: 4),
  ),
  hourMinuteColor: WidgetStateColor.resolveWith((states) =>
      states.contains(WidgetState.selected)
          ? Colors.orange
          : Colors.blueGrey.shade800),
  hourMinuteTextColor: WidgetStateColor.resolveWith((states) =>
      states.contains(WidgetState.selected) ? Colors.white : Colors.orange),
  dialHandColor: Colors.blueGrey.shade700,
  dialBackgroundColor: Colors.blueGrey.shade800,
  hourMinuteTextStyle:
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  dayPeriodTextStyle:
      const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  helpTextStyle: const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
    contentPadding: EdgeInsets.all(0),
  ),
  dialTextColor: WidgetStateColor.resolveWith((states) =>
      states.contains(WidgetState.selected) ? Colors.orange : Colors.white),
  entryModeIconColor: Colors.orange,
);
