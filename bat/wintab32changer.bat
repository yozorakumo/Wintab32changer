@echo off

echo.
echo ======================================
echo  WACOM,HUION切り替えツール　Ver 1.0
echo ======================================
echo.

echo 現在の作業フォルダ
set A=%~dp0
set A=%A:~0,-1%
for %%A in (%A%) do set A=%%~dpA
echo %A%

set folder=%A%

echo.
echo 1.WACOM
echo 2.HUION
echo.

SET /P ANSWER="実行する処理の番号を入力してください。(1,2)？"

if /i {%ANSWER%}=={1} (goto :no1)
if /i {%ANSWER%}=={2} (goto :no2)

exit

:no1

  set SERVICENAME=WTabletServicePro
  net stop "%SERVICENAME%"
  taskkill /F /IM HuionTablet.exe
  taskkill /F /IM HuionTabletCore.exe
  taskkill /F /IM HuionServer.exe
  TIMEOUT /T 5

  del/q "C:\Windows\System32\wintab32.dll"
  copy/y %folder%\wacom\wintab32.dll C:\Windows\System32
  net start "%SERVICENAME%"
  start "" "C:\Program Files\HuionTablet\HuionTablet.exe"
  echo HuionTabletサービスを開始します
  echo 切り替え完了(現在WACOM)
  pause
  exit

:no2

  set SERVICENAME=WTabletServicePro
  net stop "%SERVICENAME%"
  taskkill /F /IM HuionTablet.exe
  taskkill /F /IM HuionTabletCore.exe
  taskkill /F /IM HuionServer.exe
  TIMEOUT /T 5

  del/q "C:\Windows\System32\wintab32.dll"
  copy/y %folder%huion\wintab32.dll C:\Windows\System32
  net start "%SERVICENAME%"
  start "" "C:\Program Files\HuionTablet\HuionTablet.exe"
  echo HuionTabletサービスを開始します
  echo 切り替え完了(現在HUION)
  pause
  exit