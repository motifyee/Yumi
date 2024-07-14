import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';

ColorScheme colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: CommonColors.primary,
  onPrimary: CommonColors.onPrimary,
  secondary: CommonColors.secondary,
  onSecondary: CommonColors.onSecondary,
  error: CommonColors.primary,
  onError: CommonColors.onPrimary,
  surface: CommonColors.onPrimary,
  onSurface: CommonColors.secondary,
  inverseSurface: CommonColors.primary,
);

ThemeData defaultTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Inter',
  useMaterial3: true,
  colorScheme: colorScheme,
  textTheme: TextTheme(
    titleLarge: TextStyle(
      color: CommonColors.primary,
      fontSize: CommonFontSize.font_24,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      color: CommonColors.primary,
      fontSize: CommonFontSize.font_16,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: CommonColors.primary,
      fontSize: CommonFontSize.font_12,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      color: CommonColors.primary,
      fontSize: CommonFontSize.font_12,
    ),
    headlineSmall: TextStyle(
      color: CommonColors.primary,
      fontSize: CommonFontSize.font_9,
    ),
    displayLarge: TextStyle(
      color: CommonColors.onPrimary,
      fontSize: CommonFontSize.font_14,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: TextStyle(
      color: CommonColors.success,
      fontSize: CommonFontSize.font_10,
      fontWeight: FontWeight.w700,
    ),
    displaySmall: TextStyle(
      color: CommonColors.onPrimary,
      fontSize: CommonFontSize.font_12,
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: CommonColors.secondary,
      fontSize: CommonFontSize.font_14,
      fontWeight: FontWeight.w700,
    ),
    labelMedium: TextStyle(
      color: CommonColors.secondary,
      fontSize: CommonFontSize.font_12,
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
        color: CommonColors.secondaryTant, fontSize: CommonFontSize.font_9),
    bodyLarge: TextStyle(
      color: CommonColors.secondary,
      fontSize: CommonFontSize.font_14,
    ),
    bodyMedium: TextStyle(
      color: CommonColors.secondary,
      fontSize: CommonFontSize.font_12,
    ),
    bodySmall: TextStyle(
      color: CommonColors.onSuccess,
      fontSize: CommonFontSize.font_12,
      fontWeight: FontWeight.w300,
    ),
  ),
  timePickerTheme: timePickerTheme,
  buttonTheme: ButtonThemeData(
    buttonColor: CommonColors.secondaryFaint,
    minWidth: 0,
    colorScheme: colorScheme,
    shape: const CircleBorder(eccentricity: .1),
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
