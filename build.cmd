
@echo off

SETLOCAL

@REM set first argumet to lower case
@REM @FOR /F "delims=" %%s IN ('') DO @set var=%%s
@REM echo @lower[%t%]
@REM echo %t% | tr '[:upper:]' '[:lower:]'


SET "target="


IF [%1] EQU [] SET target=apk
IF [%1] EQU [windows] SET target=%1
IF [%1] EQU [linux] SET target=%1
IF [%1] EQU [macos] SET target=%1
IF [%1] EQU [web] SET target=%1
IF [%1] EQU [apk] SET target=%1
IF [%1] EQU [ios] SET target=%1

IF [%target%] EQU [] (
  echo ( %1 ^) is not a recognised build target,
  echo choose a platform from [windows, linux, macos, web, apk, ios].
  exit 1
)

echo
echo building: %target% ...

if [%2] NEQ [install-only] flutter build %target%

if [%2] EQU [build-only] exit 0

if (%target%) EQU (windows) START build\windows\x64\runner\Release\yumi.exe
if (%target%) EQU (apk) adb install .\build\app\outputs\flutter-apk\app-release.apk

exit 0