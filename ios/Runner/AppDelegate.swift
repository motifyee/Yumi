import UIKit
import Flutter
import GoogleMaps

// import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Local Notifications
    // This is required to make any communication available in the action isolate.
    // FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    //   GeneratedPluginRegistrant.register(with: registry)
    // }
    // if #available(iOS 10.0, *) {
    //   UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    // }
    // GMSServices.setMetalRendererEnabled(true)
    GMSServices.provideAPIKey("AIzaSyBlhKSqJ_5FgfUS3tnGmjV6hxPocuFBB_Y")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
