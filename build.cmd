@echo off

@REM set "manifest=.\AndroidManifest.xml"
@REM set "gradle=.\build.gradle"
set "manifest=.\android\app\src\main\AndroidManifest.xml"
set "gradle=.\android\app\build.gradle"
set "output=.\build\app\outputs\flutter-apk"
mkdir %output%\out

echo preparing: git pull ...
git pull

echo
echo building: customer app ...

sed -i -E "s/applicationId .+/applicationId """com.yumi.customers"""/" %gradle%
sed -i -E "s/android:label=.+/android:label="""YUMI"""/" %manifest%
CALL flutter build apk -t lib\app\yumi\customer.dart
mv %output%\app-release.apk %output%\out\customer.apk

echo %output%\customer.apk
echo building: chef app ...
sed -i -E "s/applicationId .+/applicationId """com.yumi.chefs"""/" %gradle%
sed -i -E "s/android:label=.+/android:label="""YUMI" "Chef"""/" %manifest%
CALL flutter build apk -t lib\app\yumi\chef.dart
mv %output%\app-release.apk %output%\out\chef.apk

echo building: driver app ...
sed -i -E "s/applicationId .+/applicationId """com.yumi.drivers"""/" %gradle%
sed -i -E "s/android:label=.+/android:label="""YUMI" "Driver"""/" %manifest%
CALL flutter build apk -t lib\app\yumi\driver.dart
mv %output%\app-release.apk %output%\out\driver.apk

exit 0

@REM @echo off

@REM SET "result=cdtest"

@REM if /i "%result:~0,2%" EQU "cda" echo HI CD



@REM SET "result=cdtest"

@REM FOR /F %%I IN ('adb devices') DO ( 
  @REM SET str1=%%I
  @REM ECHO "%%i:emul="
  @REM if not %str1:emul=%==%str1% echo It contains emul

@REM )

  @REM IF /i "%%I:~0,3" NEQ "Lis" ( echo %%I ) 
@REM IF "%%I" NEQ "List"
@REM IF "%%I:~0,8%"=="emulator"

@REM CALL %0 install-only %%I // call self
@REM IF %%I NEQ [List] (
@REM     If "%%I:~0,3%"=="emulator" (
@REM       SET V=%%I
@REM     )
@REM   );

@REM ECHO %V%

@REM FOR /F %I IN ('DIR *.* /O:D /B') DO SET V=%I

@REM exit 0



@REM SETLOCAL

@REM set first argumet to lower case
@REM @FOR /F "delims=" %%s IN ('') DO @set var=%%s
@REM echo @lower[%t%]
@REM echo %t% | tr '[:upper:]' '[:lower:]'


@REM SET "target="


@REM IF [%1] EQU [] SET target=apk
@REM IF [%1] EQU [windows] SET target=%1
@REM IF [%1] EQU [linux] SET target=%1
@REM IF [%1] EQU [macos] SET target=%1
@REM IF [%1] EQU [web] SET target=%1
@REM IF [%1] EQU [apk] SET target=%1
@REM IF [%1] EQU [ios] SET target=%1

@REM IF [%target%] EQU [] (
@REM   echo ( %1 ^) is not a recognised build target,
@REM   echo choose a platform from [windows, linux, macos, web, apk, ios].
@REM   exit 1
@REM )

@REM echo
@REM echo building: %target% ...

@REM if [%2] NEQ [install-only] CALL flutter build %target%

@REM if [%2] EQU [build-only] exit 0

@REM if (%target%) EQU (windows) START build\windows\x64\runner\Release\yumi.exe
@REM if (%target%) EQU (apk) adb install .\build\app\outputs\flutter-apk\app-release.apk

@REM exit 0

@REM change build applicationId @build.gradle + android:label="YUMI Chef" @main>manifest