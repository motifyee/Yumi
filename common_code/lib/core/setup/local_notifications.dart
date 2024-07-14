// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:yumi/global.dart';

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<bool> requestIOSPermissions() async {
//   return await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               IOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           ) ??
//       false;
// }

// Future<bool> requestMacOSPermissions() async {
//   return await flutterLocalNotificationsPlugin
//           .resolvePlatformSpecificImplementation<
//               MacOSFlutterLocalNotificationsPlugin>()
//           ?.requestPermissions(
//             alert: true,
//             badge: true,
//             sound: true,
//           ) ??
//       false;
// }

// void init() async {
// // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//   const AndroidInitializationSettings initializationSettingsAndroid =
//       AndroidInitializationSettings('app_icon');

//   const DarwinInitializationSettings initializationSettingsDarwin =
//       DarwinInitializationSettings(
//     requestSoundPermission: false,
//     requestBadgePermission: false,
//     requestAlertPermission: false,
//     onDidReceiveLocalNotification: onDidReceiveLocalNotification,
//   );

//   // final MacOSInitializationSettings initializationSettingsMacOS =
//   //     MacOSInitializationSettings(
//   //         requestAlertPermission: false,
//   //         requestBadgePermission: false,
//   //         requestSoundPermission: false);

//   const LinuxInitializationSettings initializationSettingsLinux =
//       LinuxInitializationSettings(defaultActionName: 'Open notification');

//   const InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//     iOS: initializationSettingsDarwin,
//     macOS: initializationSettingsDarwin,
//     linux: initializationSettingsLinux,
//   );

//   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
// }

// void onDidReceiveNotificationResponse(
//     NotificationResponse notificationResponse) async {
//   final String? payload = notificationResponse.payload;
//   if (notificationResponse.payload != null) {
//     debugPrint('notification payload: $payload');
//   }

//   // await Navigator.push( context, MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),);
// }

// void onDidReceiveLocalNotification(
//     int id, String? title, String? body, String? payload) async {
//   // display a dialog with the notification details, tap ok to go to another page
//   showDialog(
//     context: G().context,
//     builder: (BuildContext context) => CupertinoAlertDialog(
//       title: Text(title ?? ''),
//       content: Text(body ?? ''),
//       actions: [
//         CupertinoDialogAction(
//           isDefaultAction: true,
//           child: const Text('Ok'),
//           onPressed: () async {
//             Navigator.of(context, rootNavigator: true).pop();
//             // await Navigator.push(
//             // context,
//             // MaterialPageRoute(
//             // builder: (context) => SecondScreen(payload),
//             // ),
//             // );
//           },
//         )
//       ],
//     ),
//   );
// }

// void showNotification({
//   int id = 0,
//   String? title,
//   String? body,
//   String? payload,
// }) async {
//   const AndroidNotificationDetails androidNotificationDetails =
//       AndroidNotificationDetails(
//     'your channel id',
//     'your channel name',
//     channelDescription: 'your channel description',
//     importance: Importance.max,
//     priority: Priority.high,
//     ticker: 'ticker',
//   );

//   const NotificationDetails notificationDetails =
//       NotificationDetails(android: androidNotificationDetails);

//   await flutterLocalNotificationsPlugin.show(
//     id,
//     title,
//     body,
//     notificationDetails,
//     payload: payload,
//   );
// }
