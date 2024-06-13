#!/bin/bash
cd ../../../../../
manifest="./android/app/src/main/AndroidManifest.xml"
gradle="./android/app/build.gradle"
splash="./assets/splash"

echo
echo "configure: customer app ..."

cp "$splash/customer.png" "$splash/logo_splash.png"
dart run flutter_native_splash:create

sed -i -E "s/applicationId .+/applicationId 'com.yumi.customers'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI'/" "$manifest"
