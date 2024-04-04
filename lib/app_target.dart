class AppTarget {
  /// android:
  /// android/app/build.gradle <=== defaultConfig {  applicationId : $appId }
  /// android/app/src/main/AndroidManifest.xml <== android:label: $appName

  /// ios:
  /// ios/Runner/Info.plist <== CFBundleDisplayName: $appName
  /// ios/Runner/Info.plist <== CFBundleName: $appName

  static AppTargetUser user = AppTargetUser.drivers;
  static String branch = AppTargetBranches.yumi;
}

/// enum                    - appName     -  appId
/// AppTargetUser.chefs     - YUMI Chef   - com.yumi.chefs
/// AppTargetUser.customers - YUMI        - com.yumi.customers
/// AppTargetUser.drivers   - YUMI Driver - com.yumi.drivers
enum AppTargetUser { customers, chefs, drivers }

class AppTargetBranches {
  static String yumi = '48';
}
