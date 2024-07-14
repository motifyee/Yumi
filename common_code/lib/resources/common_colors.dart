import 'package:flutter/material.dart';

class CommonColors {
  static bool isDark = false;

  static _ThemeColors get _themeColors =>
      isDark ? _ThemeColorsDark() : _ThemeColorsLight();

  static Color get primary => _themeColors.primary;
  static Color get primaryDisabled => _themeColors.primaryDisabled;
  static Color get onPrimary => _themeColors.onPrimary;
  static Color get primaryTant => _themeColors.primaryTant;

  static Color get secondary => _themeColors.secondary;
  static Color get onSecondary => _themeColors.onSecondary;
  static Color get secondaryTant => _themeColors.secondaryTant;
  static Color get secondaryTantLighter => _themeColors.secondaryTantLighter;
  static Color get secondaryFaint => _themeColors.secondaryFaint;

  static Color get success => _themeColors.success;
  static Color get onSuccess => _themeColors.onSuccess;
  static Color get error => _themeColors.error;
  static Color get onError => _themeColors.onError;

  static Color get warning => _themeColors.warning;
  static Color get onWarning => _themeColors.onWarning;

  static Color get background => _themeColors.background;
  static Color get backgroundTant => _themeColors.backgroundTant;
  static Color get shadow => _themeColors.shadow;
}

abstract class _ThemeColors {
  late final Color primary;
  late final Color primaryDisabled;
  late final Color onPrimary;
  late final Color primaryTant;

  late final Color secondary;
  late final Color onSecondary;
  late final Color secondaryTant;
  late final Color secondaryTantLighter;
  late final Color secondaryFaint;

  late final Color success;
  late final Color onSuccess;
  late final Color error;
  late final Color onError;

  late final Color warning;
  late final Color onWarning;

  late final Color background;
  late final Color backgroundTant;
  late final Color shadow;
}

class _ThemeColorsLight implements _ThemeColors {
  @override
  Color primary = const Color.fromRGBO(234, 91, 68, 1);
  @override
  Color primaryDisabled = const Color.fromRGBO(238, 125, 107, 1.0);
  @override
  Color onPrimary = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color primaryTant = const Color.fromRGBO(245, 193, 185, 1);

  @override
  Color secondary = const Color.fromRGBO(72, 91, 120, 1);
  @override
  Color onSecondary = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color secondaryTant = const Color.fromRGBO(139, 151, 167, 1);
  @override
  Color secondaryTantLighter = const Color.fromRGBO(187, 187, 187, 1);
  @override
  Color secondaryFaint = const Color.fromRGBO(217, 217, 217, 1);

  @override
  Color success = const Color.fromRGBO(39, 170, 75, 1);
  @override
  Color onSuccess = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color background = const Color.fromRGBO(250, 250, 250, 1);
  @override
  Color backgroundTant = const Color.fromRGBO(238, 240, 242, 1);

  @override
  Color shadow = const Color.fromRGBO(0, 0, 0, .15);

  @override
  Color error = const Color.fromARGB(255, 252, 60, 70);
  @override
  Color onError = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color onWarning = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color warning = const Color.fromRGBO(234, 179, 8, 1);
}

class _ThemeColorsDark implements _ThemeColors {
  @override
  Color primary = const Color.fromRGBO(234, 91, 68, 1);
  @override
  Color primaryDisabled = const Color.fromRGBO(238, 125, 107, 1.0);
  @override
  Color onPrimary = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color primaryTant = const Color.fromRGBO(245, 193, 185, 1);
  @override
  Color secondary = const Color.fromRGBO(72, 91, 120, 1);
  @override
  Color onSecondary = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color secondaryTant = const Color.fromRGBO(139, 151, 167, 1);
  @override
  Color secondaryTantLighter = const Color.fromRGBO(187, 187, 187, 1);
  @override
  Color secondaryFaint = const Color.fromRGBO(217, 217, 217, 1);
  @override
  Color success = const Color.fromRGBO(39, 170, 75, 1);
  @override
  Color onSuccess = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color background = const Color.fromRGBO(255, 255, 255, 1);
  @override
  Color backgroundTant = const Color.fromRGBO(238, 240, 242, 1);
  @override
  Color shadow = const Color.fromRGBO(0, 0, 0, .15);

  @override
  Color error = const Color.fromRGBO(234, 91, 68, 1);

  @override
  Color onError = const Color.fromRGBO(255, 255, 255, 1);

  @override
  Color onWarning = const Color.fromRGBO(255, 255, 255, 0);

  @override
  Color warning = const Color.fromRGBO(234, 179, 8, 1);
}
