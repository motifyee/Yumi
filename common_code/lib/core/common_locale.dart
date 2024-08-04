import 'dart:io';
import 'dart:ui';

import 'package:common_code/util/global_context.dart';

const _appLocaleKey = 'app_locale';

class CommonLocale {
  static List<String> _availableLocales = ['en_US', 'ar_EG'];
  static List<String> get availableLocales => _availableLocales;
  static void setAvailableLocales(List<String> locales) {
    _availableLocales = locales;
  }

  // ===========================================================================

  static String get deviceLocaleName => Platform.localeName;
  static bool get _deviceLocaleHasCountry => deviceLocaleName.contains('_');

  static String get deviceLocaleLanguage => deviceLocaleName.split('_')[0];
  static String get deviceLocaleCountry =>
      _deviceLocaleHasCountry ? deviceLocaleName.split('_')[1] : '';

  // ===========================================================================

  static int _appLocaleIdx = 0;
  static bool get _appLocaleHasCountry =>
      _availableLocales[_appLocaleIdx].contains('_');

  static String get appLocaleLanguage =>
      _availableLocales[_appLocaleIdx].split('_')[0];
  static String get appLocaleCountry => _appLocaleHasCountry
      ? _availableLocales[_appLocaleIdx].split('_')[1]
      : '';

  static Locale get appLocale => Locale(appLocaleLanguage);

  // ===========================================================================

  static bool get isRTL =>
      ['ar', 'fa', 'ur', 'ku', 'he'].contains(appLocaleLanguage);
  static bool get isLTR => !isRTL;

  // ===========================================================================

  static Future<String> loadAppLocale() async {
    return await GlobalContext().prefs.then((prefs) async {
      String localeName;
      if (!prefs.containsKey(_appLocaleKey)) localeName = deviceLocaleName;

      localeName = prefs.getString(_appLocaleKey) ?? _availableLocales[0];

      localeName = localeName.replaceAll('-', '_');
      localeName = localeName.replaceAll(' ', '_');

      if (!_availableLocales.contains(localeName)) {
        localeName = _availableLocales[0];
      }

      _appLocaleIdx = _availableLocales.indexOf(localeName);

      if (!prefs.containsKey(_appLocaleKey)) await setAppLocale(localeName);

      return localeName;
    });
  }

  static Future<void> setAppLocale(String localeName) async {
    await GlobalContext()
        .prefs
        .then((prefs) => prefs.setString(_appLocaleKey, localeName));
  }

  static Future<void> toggleAppLocale() async {
    _appLocaleIdx = (_appLocaleIdx + 1) % _availableLocales.length;

    await setAppLocale(_availableLocales[_appLocaleIdx]);
  }
}
