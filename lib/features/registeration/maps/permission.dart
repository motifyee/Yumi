import 'dart:async';

import 'package:geolocator/geolocator.dart';

Future<bool> checkGEOService([bool prompt = true]) async {
  return await Geolocator.isLocationServiceEnabled();
  // Location services are not enabled don't continue
  // accessing the position and request users of the
  // app to enable the location services.

  // Test if location services are enabled.
}

Future<bool> checkGeoPermission([bool prompt = true]) async {
  var permission = await Geolocator.checkPermission();

  bool isPermitted() =>
      permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse;

  var p = isPermitted();
  if (p || !prompt) return p;

  permission = await Geolocator.requestPermission();

  return isPermitted();
}

Future<bool> checkGEOLocation([bool prompt = true]) async {
  return await checkGEOService(prompt) && await checkGeoPermission(prompt);
}

// safe executer for geo operations.
Future<T> geo<T>(Function func, [bool prompt = true]) async {
  if (!await checkGEOLocation(prompt)) {
    // replace with a gracceful error message.
    throw Exception(
        'Location services are not accessable. replace this message with a gracceful error message.');
  }

  return func();
}

Future<T?> tryV<T>(Function func) async {
  try {
    return await func();
  } catch (e) {
    return null;
  }
}
