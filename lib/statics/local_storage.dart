import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static _SharedRef sharedRef = _SharedRef();

  static _SharedRefKeys user = _SharedRefKeys(
    name: 'user',
    valueType: _ValueType.json,
  );
  static _SharedRefKeys token = _SharedRefKeys(
    name: 'token',
    valueType: _ValueType.string,
  );
  static _SharedRefKeys newsGuide = _SharedRefKeys(
    name: 'news_guide',
    valueType: _ValueType.bool,
  );
}

class _SharedRef {
  setValue(_SharedRefKeys key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (key.valueType == _ValueType.int) {
      return await prefs.setInt(key.name, value);
    }
    if (key.valueType == _ValueType.double) {
      return await prefs.setDouble(key.name, value);
    }
    if (key.valueType == _ValueType.string) {
      return await prefs.setString(key.name, value);
    }
    if (key.valueType == _ValueType.bool) {
      return await prefs.setBool(key.name, value);
    }
    if (key.valueType == _ValueType.list) {
      return await prefs.setStringList(key.name, value);
    }
    if (key.valueType == _ValueType.json) {
      return await prefs.setString(key.name, jsonEncode(value));
    }

    print('type not supported');
    return;
  }

  getValue(_SharedRefKeys key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var res;
    if (key.valueType == _ValueType.int) {
      res = await prefs.getInt(key.name);
    }
    if (key.valueType == _ValueType.double) {
      res = await prefs.getDouble(key.name);
    }
    if (key.valueType == _ValueType.string) {
      res = await prefs.getString(key.name);
    }
    if (key.valueType == _ValueType.bool) {
      res = await prefs.getBool(key.name);
    }
    if (key.valueType == _ValueType.list) {
      res = await prefs.getStringList(key.name);
    }
    if (key.valueType == _ValueType.json) {
      res = await prefs.getString(key.name);
      if (res != null) res = jsonDecode(res);
    }
    return res;
  }

  removeValue(_SharedRefKeys key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key.name);
  }
}

class _SharedRefKeys {
  String name;
  _ValueType valueType;
  _SharedRefKeys({required this.name, required this.valueType});
}

enum _ValueType { int, double, string, bool, list, json }
