#!/bin/bash

manifest="../../../android/app/src/main/AndroidManifest.xml"
gradle="../../../android/app/build.gradle"

echo
echo "configure: customer app ..."

sed -i -E "s/applicationId .+/applicationId 'com.yumi.drivers'/" "$gradle"
sed -i -E "s/android:label=.+/android:label='YUMI Driver'/" "$manifest"
