@echo off

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

if [%2] NEQ [install-only] CALL flutter build %target%

if [%2] EQU [build-only] exit 0

if (%target%) EQU (windows) START build\windows\x64\runner\Release\yumi.exe
if (%target%) EQU (apk) adb install .\build\app\outputs\flutter-apk\app-release.apk

exit 0

@REM change build applicationId @build.gradle + android:label="YUMI Chef" @main>manifest