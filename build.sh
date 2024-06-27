#!/bin/bash

# set "manifest=.\AndroidManifest.xml"
# set "gradle=.\build.gradle"
manifest="./android/app/src/main/AndroidManifest.xml"
gradle="./android/app/build.gradle"
output="./build/app/outputs/flutter-apk"
splash="./assets/splash"

################################################################################
# Versioning

echo "Versioning ..."

pubspec="./pubspec.yaml"
fullVersion=$(echo | grep -i -e "version: " "$pubspec")
buildName=$(echo $fullVersion | cut -d " " -f 2 | cut -d "+" -f 1)
buildNumber=$(echo $fullVersion | cut -d "+" -f 2 )
((buildNumber++))
sed -i -E "s/version: .+/version: ${buildName}+${buildNumber}/" "$pubspec"

rm -rf "$output/out"
mkdir -p "$output/out"

echo

################################################################################
# Customer App

echo "building: customer app ..."

cp "$splash/customer.png" "$splash/logo_splash.png"
cp "$splash/customer_x.png" "$splash/logo_splash_x.png"
dart run flutter_native_splash:create

flutter pub get

sed -i -E "s/applicationId .+/applicationId 'com.yumi.customers'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI'/" "$manifest"
flutter build apk -t lib/app/yumi/customer.dart
mv "$output/app-release.apk" "$output/out/customer.apk"

################################################################################
# Chef App

echo "building: chef app ..."

cp "$splash/chef.png" "$splash/logo_splash.png"
cp "$splash/chef_x.png" "$splash/logo_splash_x.png"
dart run flutter_native_splash:create

flutter pub get

sed -i -E "s/applicationId .+/applicationId 'com.yumi.chefs'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI Chef'/" "$manifest"
flutter build apk -t lib/app/yumi/chef.dart
mv "$output/app-release.apk" "$output/out/chef.apk"

################################################################################
# Driver App

echo "building: driver app ..."

cp "$splash/driver.png" "$splash/logo_splash.png"
cp "$splash/driver_x.png" "$splash/logo_splash_x.png"
dart run flutter_native_splash:create

flutter pub get

sed -i -E "s/applicationId .+/applicationId 'com.yumi.drivers'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI Driver'/" "$manifest"
flutter build apk -t lib/app/yumi/driver.dart
mv "$output/app-release.apk" "$output/out/driver.apk"

################################################################################
# Reset splash (to prevent git changes)

cp "$splash/customer.png" "$splash/logo_splash.png"
cp "$splash/customer_x.png" "$splash/logo_splash_x.png"
dart run flutter_native_splash:create
flutter pub get