import 'package:flutter/material.dart';

class ThemeSelector {
  static const value = true;

  static final statics = _ThemeStatics();

  static final colors = value ? _ThemeColorsLight() : _ThemeColorsDark();

  static final fonts = _ThemeFontSize();
}

class _ThemeStatics {
  double formFieldGap = 12.0;
  double formFieldInlineGap = 40.0;

  double defaultElevation = 2.0;

  double defaultImageHeightSmall = 120.0;
  double defaultImageHeight = 160.0;
  double defaultImageHeightLarge = 300.0;

  double defaultMicroGap = 4.0;
  double defaultGap = 8.0;
  double defaultInputGap = 12.0;
  double defaultLineGap = 16.0;
  double defaultBlockGap = 25.0;
  double defaultTitleGap = 35.0;
  double defaultTitleGapLarge = 45.0;
  double defaultMediumGap = 60.0;
  double defaultGapExtreme = 65.0;
  double defaultGapExtraExtreme = 85.0;
  double defaultGapXXL = 95.0;
  double defaultGapXXXL = 125.0;

  double defaultBorderRadius = 16;
  double defaultBorderRadiusSmall = 4;
  double defaultBorderRadiusMedium = 8;
  double defaultBorderRadiusSubLarge = 10;
  double defaultBorderRadiusLarge = 25;
  double defaultBorderRadiusExtraLarge = 55;
  double defaultBorderRadiusExtreme = 120;

  double buttonWidth = 280;
  double buttonPaddingV = 10;
  double buttonBorderRadiusRounded = 8;
  double buttonBorderRadius = 50;

  double iconSizeDefault = 18;
  double iconSizeSmall = 25;
  double iconSizeMedium = 35;
  double iconSizeLarge = 50;
  double iconSizeExtreme = 65;

  Duration animationDuration = const Duration(milliseconds: 250);
  Duration slowAnimationDuration = const Duration(milliseconds: 650);
}

class _ThemeFontSize {
  double font_5 = 5;
  double font_9 = 9;
  double font_10 = 10;
  double font_12 = 12;
  double font_14 = 14;
  double font_16 = 16;
  double font_18 = 18;
  double font_20 = 20;
  double font_24 = 24;
  double font_38 = 38;
}

abstract class _ThemeColors {
  late Color primary;
  late Color primaryDisabled;
  late Color onPrimary;
  late Color primaryTant;
  late Color secondary;
  late Color onSecondary;
  late Color secondaryTant;
  late Color secondaryTantLighter;
  late Color secondaryFaint;
  late Color success;
  late Color onSuccess;
  late Color error;
  late Color onError;
  late Color warning;
  late Color onWarning;
  late Color background;
  late Color backgroundTant;
  late Color shadow;
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
