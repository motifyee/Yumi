import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/snack_bar.dart';

Future<bool> checkGEOService([
  bool prompt = true,
  BuildContext? context,
]) async {
  return await Geolocator.isLocationServiceEnabled().then((enabled) async {
    if (enabled) return enabled;
    if (!prompt || context == null) return enabled;

    showAlertDialog(
      context: context,
      title: const Text("Location Service"),
      content: const Padding(
        padding: EdgeInsets.all(8),
        child: Text(
            "Location services are not enabled on your device. Please enable it."),
      ),
      actions: {
        'Cancel': null,
        'OK': (context) async {
          Navigator.of(context, rootNavigator: true).pop();
          await Geolocator.openLocationSettings();
        },
      },
      dismissible: true,
    );

    var res = await Geolocator.isLocationServiceEnabled();
    return res;
  });

  // Location services are not enabled don't continue
  // accessing the position and request users of the
  // app to enable the location services.

  // Test if location services are enabled.
}

Future<bool> checkGeoPermission([
  bool prompt = true,
  BuildContext? context,
]) async {
  var permission = await Geolocator.checkPermission();

  bool isPermitted() =>
      permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse;

  var p = isPermitted();
  if (p || !prompt) return p;

  return await Geolocator.requestPermission().then((permission) {
    if (context == null) return isPermitted();

    if (permission == LocationPermission.deniedForever) {
      showAlertDialog(
        context: context,
        title: const Text("Location Service"),
        content: const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
              "Location permission is not granted. Please allow it in app settings."),
        ),
        actions: {
          'Cancel': null,
          'OK': (context) async {
            Navigator.of(context, rootNavigator: true).pop();
            await Geolocator.openAppSettings();
          },
        },
        dismissible: true,
      );
    }
    return isPermitted();
  });
}

Future<bool> checkGEOLocation(
    [bool prompt = true, BuildContext? context]) async {
  return await checkGEOService(prompt, context).then(
    (serviceEnabled) async {
      return !serviceEnabled
          ? false
          : await checkGeoPermission(prompt, context);
    },
  );
}

// safe executer for geo operations.
Future<T?> geo<T>(
  Function func, [
  bool prompt = true,
  BuildContext? context,
]) async {
  if (!await checkGEOLocation(prompt, context)) {
    // if (context != null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: SnackBarMassage(
    //         massage: "Location services are not accessable",
    //       ),
    //     ),
    //   );
    // }
    return null;
  }
  // replace with a gracceful error message.
  // throw Exception(
  //     'Location services are not accessable. replace this message with a gracceful error message.');

  // return await func();
  return await tryV(func);
}

Future<T?> tryV<T>(Function func) async {
  try {
    return await func();
  } catch (e) {
    return null;
  }
}
