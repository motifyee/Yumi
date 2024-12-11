# Usage: build.sh customer android bundle => for appbundle
# Usage: build.sh customer android apk => for apk
# Usage: build.sh customer ios => third parameter is not required
test=0

build() {

  # getBundleId customer android
  getBundleId() {
    if [ "$2" == "android" ]; then
      echo "com.yumi.$1s"
    elif [ "$2" == "ios" ]; then
      if [ "$1" == "driver" ]; then
        echo "com.yumi.deliveryapp"
      else
        echo "com.yumi.$1app"
      fi
    fi
  }

  # getBundleName customer
  getBundleName() {
    if [ "$1" == "customer" ]; then
      echo "Yumi Food"
    elif [ "$1" == "chef" ]; then
      echo "Yumi Chef"
    elif [ "$1" == "driver" ]; then
      echo "Yumi Driver"
    fi
  }

  getBuildTarget() {
    if [ "$2" == "android" ]; then
      if [ "$3" == "bundle" ]; then
        echo "appbundle"
      else
        echo "apk"
      fi
    elif [ "$2" == "ios" ]; then
      echo "ipa"
    fi
  }

  getBuildOutput() {
    apkOutput="./build/app/outputs/flutter-apk"
    appbundleOutput="./build/app/outputs/bundle"
    ipaOutput="./build/ios/ipa"

    if [ "$1" == "apk" ]; then
      echo "$apkOutput|app-release|apk"
    elif [ "$1" == "appbundle" ]; then
      echo "$appbundleOutput|app-release|aab"
    elif [ "$1" == "ipa" ]; then
      echo "$ipaOutput|YUMI|ipa"
    fi
  }

  targetPlatform="$2"
  buildTarget="$(getBuildTarget $1 $2 $3)"
  appName="$1"
  bundleId="$(getBundleId $1 $2)"
  bundleName="$(getBundleName $1)"

  outputInfo="$(getBuildOutput $buildTarget)"

  gradle="./android/app/build.gradle"
  manifest="./android/app/src/main/AndroidManifest.xml"
  keystoresDir="./android/keystores"

  xcodeProject="./ios/Runner.xcodeproj/project.pbxproj"

  splash="assets/splash"
  icon="assets/icon"

  echo ======================
  echo Building: $targetPlatform app ...
  echo ======================

  echo
  echo 1. Update Bundle Info:
  echo ======================

  # sed -i -E "s/PRODUCT_BUNDLE_IDENTIFIER\\\\s*=\\\\s*com\\\\.yumi\\\\.\\\\w+app;/PRODUCT_BUNDLE_IDENTIFIER = $bundleId;/" "$xcodeProject"
  # sed -i -E "s/INFOPLIST_KEY_CFBundleDisplayName\\\\s*=\\\\s*.+/INFOPLIST_KEY_CFBundleDisplayName = \\\\"$bundleName\\\\";/" "$xcodeProject"
  # else
  if [ "$targetPlatform" == "android" ]; then
    sed -i -E "s/applicationId .+/applicationId '$bundleId'/" "$gradle"
    sed -i -E "s/android:label=.+/android:label='$bundleName'/" "$manifest"
  fi

  echo
  echo "targetPlatform: $targetPlatform"
  echo "bundleId: $bundleId"
  echo "bundleName: $bundleName"
  echo "buildTarget: $buildTarget"
  echo "outputInfo: $$outputInfo"

  echo "appName: $appName"
  echo "appName_x: ${appName}_x"
  echo "icon: $icon"

  if [ "$test" = 1 ]; then
    exit 1
  fi

  echo
  echo 2. Update Splash Images:
  echo ========================

  cp "$splash/images/$appName.png" "$splash/logo_splash.png"
  cp "$splash/images/${appName}_x.png" "$splash/logo_splash_x.png"

  flutter pub get
  dart run flutter_native_splash:create

  echo
  echo 3. Update Icon Image:
  echo =====================

  cp "$icon/$appName.png" "$icon/icon.png"

  # flutter pub get
  # dart run flutter_launcher_icons
  dart run icons_launcher:create

  echo
  echo 4. Perform Build:
  echo =================

  if [ "$buildTarget" == "appbundle" ]; then
    rm "$keystoresDir/yumi-keystore.jks"
    cp "$keystoresDir/yumi-$appName-keystore.jks" "$keystoresDir/yumi-keystore.jks"
  fi

  flutter build $buildTarget -t lib/app/yumi/$appName.dart

  IFS="|"
  set -- $outputInfo
  mkdir -p "$1/out"
  mv "$1/$2.$3" "$1/out/$appName.$3"
}

################################################################################

usageMsg="usage: build.sh [customer|chef|driver|all] [ios|android] [ipa|apk|bundle]"

# check target app
if [ "$1" != "customer" ] && [ "$1" != "chef" ] && [ "$1" != "driver" ] && [ "$1" != "all" ] && [ "$1" != "test" ]; then
  echo "$usageMsg"
  echo "invalid app: $1"
  exit 1
fi

# check target platform
if [ "$1" != "test" ] && [ "$2" != "ios" ] && [ "$2" != "android" ]; then
  echo "$usageMsg"
  echo "invalid platform: $2"
  exit 1
fi

# check build target
if [ "$1" != "test" ] && [ "$2" == "android" ] && [ "$3" != "apk" ] && [ "$3" != "bundle" ] && [ "$3" != "" ]; then
  echo "$usageMsg"
  echo "invalid build target: $3"
  exit 1
fi

if [ "$1" != "test" ] && [ "$2" == "ios" ] && [ "$3" != "ipa" ] && [ "$3" != "" ]; then
  echo "$usageMsg"
  echo "invalid build target: $3"
  exit 1
fi

# execute
if [ "$1" == "all" ]; then
  build customer $2 $3
  build chef $2 $3
  build driver $2 $3
  exit 0
fi

if [ "$1" == "test" ]; then
  test=1
  echo testing
  build $2 $3 $4
else
  echo building
  build $1 $2 $3
fi
