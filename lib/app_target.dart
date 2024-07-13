class AppTarget {
  /// android:
  /// android/app/build.gradle <=== defaultConfig {  applicationId : $appId }
  /// android/app/src/main/AndroidManifest.xml <== android:label: $appName
  ///
  /// release apk:
  /// flutter build apk -t lib/chef.dart
  /// flutter build apk -t lib/customer.dart
  /// flutter build apk -t lib/driver.dart

  /// ios:
  /// ios/Runner/Info.plist <== CFBundleDisplayName: $appName
  /// ios/Runner/Info.plist <== CFBundleName: $appName

  static AppTargetUser user = AppTargetUser.customers;
  static String branch = AppTargetBranches.yumi;
  static String version = '1.0.9+1';
}

/// enum                    - appName     -  appId
/// AppTargetUser.chefs     - YUMI Chef   - com.yumi.chefs
/// AppTargetUser.customers - YUMI        - com.yumi.customers
/// AppTargetUser.drivers   - YUMI Driver - com.yumi.drivers
enum AppTargetUser { customers, chefs, drivers }

class AppTargetBranches {
  static String yumi = '48';
}

abstract class StripeKeys {
  static const String publishableKey = 'pk_test_51PaxDVRoObAqpHXQeaRuTvZTNUwhLog9MnExmSVRJGq73x1A0FYvjOBV5NXjZ3TmbYIHqmAk3OMzpxMgpcWo6C4t00HZNfeTVN';
  static const String secretKey = 'sk_test_51PaxDVRoObAqpHXQzwSb106U3Rr0g5vvI85JgLB8J34HLO4AuTCoqHXtx2Lwj2xkpREVRjcPfBiE1aEg55kaJVMV007oldunUg';
  static const String currency = 'GBP';
  static const String appName = 'YUMI';
}
