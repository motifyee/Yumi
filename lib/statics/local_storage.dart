import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static _SharedRef sharedRef = _SharedRef();
}

class _SharedRef {
  setValue(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value.runtimeType == int) return await prefs.setInt(key, value);
    if (value.runtimeType == double) return await prefs.setDouble(key, value);
    if (value.runtimeType == String) return await prefs.setString(key, value);
    if (value.runtimeType == bool) return await prefs.setBool(key, value);
    if (value.runtimeType == List<String>)
      return await prefs.setStringList(key, value);

    throw Exception(['type not supported']);
  }

  getValue(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var res;
    if (value == 'int') res = await prefs.getInt(key);
    if (value == 'double') res = await prefs.getDouble(key);
    if (value == 'String') res = await prefs.getString(key);
    if (value == 'bool') res = await prefs.getBool(key);
    if (value == 'List<String>') res = await prefs.getStringList(key);
    return res;
  }
}
