@echo off
title LinguaPlay - servidor + emulador
cd /d "%~dp0"

echo ============================================
echo  1/3  Servidor de legendas (Python)
echo ============================================
start "LinguaPlay Captions" cmd /k "cd /d %~dp0 && python -m pip install -r requirements.txt -q && python app.py"

timeout /t 3 /nobreak >nul

echo ============================================
echo  2/3  Emulador Android (se instalado)
echo ============================================
set SDK=%LOCALAPPDATA%\Android\Sdk
if exist "%SDK%\emulator\emulator.exe" (
  start "Emulator" "%SDK%\emulator\emulator.exe" -avd Pixel_API_34 -no-snapshot-load -gpu swiftshader_indirect -no-audio -partition-size 1024
) else (
  echo Emulador nao encontrado. Abra o emulador manualmente.
)

echo Aguardando emulador...
set ADB=%SDK%\platform-tools\adb.exe
set /a n=0
:wait
set /a n+=1
if %n% GTR 60 goto skip_reverse
"%ADB%" wait-for-device >nul 2>&1
"%ADB%" shell getprop sys.boot_completed 2>nul | findstr 1 >nul
if errorlevel 1 (
  timeout /t 3 /nobreak >nul
  goto wait
)

echo ============================================
echo  3/3  adb reverse (app -^> PC:8765)
echo ============================================
"%ADB%" reverse tcp:8765 tcp:8765
"%ADB%" reverse --list

echo.
echo Pronto!
echo  - Servidor: http://127.0.0.1:8765/health
echo  - Abra o app LinguaPlay no emulador
echo  - Cole o link do YouTube e Buscar
echo.
echo Deixe esta janela e a do Python abertas.
pause
:skip_reverse
echo Emulador demorou. Rode manualmente:
echo   adb reverse tcp:8765 tcp:8765
pause
