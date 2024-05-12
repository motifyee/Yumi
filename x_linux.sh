#!/bin/bash

# set "manifest=.\AndroidManifest.xml"
# set "gradle=.\build.gradle"
manifest="./android/app/src/main/AndroidManifest.xml"
gradle="./android/app/build.gradle"
output="./build/app/outputs/flutter-apk"
splash="./assets/splash"

#pubspac="./pubspec.yaml"
#fullVersion=$(echo | grep -i -e "version: " "$pubspac")
#buildName=$(echo $fullVersion | cut -d " " -f 2 | cut -d "+" -f 1)
#buildNumber=$(echo $fullVersion | cut -d "+" -f 2 )
#((buildNumber++))
#sed -i -E "s/version: .+/version: ${buildName}+${buildNumber}/" "$pubspac"

mkdir -p "$output/out"

echo
echo "building: customer app ..."

cp "$splash/customer.png" "$splash/logo_splash.png"
dart run flutter_native_splash:create

flutter pub get

sed -i -E "s/applicationId .+/applicationId 'com.yumi.customers'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI'/" "$manifest"
flutter build apk -t lib/app/yumi/customer.dart
mv "$output/app-release.apk" "$output/out/customer.apk"

echo "building: chef app ..."

cp "$splash/chef.png" "$splash/logo_splash.png"
dart run flutter_native_splash:create
flutter pub get

sed -i -E "s/applicationId .+/applicationId 'com.yumi.chefs'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI Chef'/" "$manifest"
flutter build apk -t lib/app/yumi/chef.dart
mv "$output/app-release.apk" "$output/out/chef.apk"


echo "building: driver app ..."
cp "$splash/driver.png" "$splash/logo_splash.png"
dart run flutter_native_splash:create
flutter pub get

sed -i -E "s/applicationId .+/applicationId 'com.yumi.drivers'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI Driver'/" "$manifest"
flutter build apk -t lib/app/yumi/driver.dart
mv "$output/app-release.apk" "$output/out/driver.apk"