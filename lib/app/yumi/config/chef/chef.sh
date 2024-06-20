#!/bin/bash
cd ../../../../../

manifest="./android/app/src/main/AndroidManifest.xml"
gradle="./android/app/build.gradle"
splash="./assets/splash"

echo
echo "configure: chef app ..."

cp "$splash/chef.png" "$splash/logo_splash.png"

dart run flutter_native_splash:create

sed -i -E "s/applicationId .+/applicationId 'com.yumi.chefs'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI Chef'/" "$manifest"
