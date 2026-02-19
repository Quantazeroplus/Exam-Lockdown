@echo off
title GEC WC Exam Installer 
color 0B

:: Define Installer Colors (ANSI)
set "ESC="
set "GRN=%ESC%[92m"
set "WHT=%ESC%[97m"
set "ORN=%ESC%[33m"
set "RESET=%ESC%[0m"

echo ======================================================
echo    GEC WEST CHAMPARAN - ( Powered by Quantazeroplus )
echo ======================================================
echo.
echo [1/2] Creating GEC_Exam.bat...

:: Universal Desktop Detection
for /f "usebackq tokens=2,*" %%A in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "MY_DESKTOP=%%B"
call set "TARGET=%MY_DESKTOP%\GEC_Exam.bat"

echo @echo off > "%TARGET%"
echo setlocal enabledelayedexpansion >> "%TARGET%"
echo set "SECRET=YOUR PASSWORD" >> "%TARGET%"
:: Define Colors for Student Script
echo set "RED=%ESC%[91m" >> "%TARGET%"
echo set "ORN=%ESC%[33m" >> "%TARGET%"
echo set "WHT=%ESC%[97m" >> "%TARGET%"
echo set "RESET=%ESC%[0m" >> "%TARGET%"

:: Kill explorer immediately
echo taskkill /f /im explorer.exe ^>nul 2^>^&1 >> "%TARGET%"

echo :EXAM_LOOP >> "%TARGET%"
echo mode con: cols=70 lines=20 >> "%TARGET%"
echo cls >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo !RED!  WARNING....... EXAM IN PROGRESS - DO NOT CLOSE (X) THIS WINDOW !RESET! >> "%TARGET%"
echo echo !ORN!  ONLY MINIMIZE IS ALLOWED !RESET! >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo. >> "%TARGET%"
echo echo !WHT!  1. Dont use these keys . >> "%TARGET%"
echo echo   2. Write your answer on the paper !RESET! >> "%TARGET%"
echo echo. >> "%TARGET%"

:: Start Edge and WAIT
echo start /wait msedge --kiosk "YOUR DRIVE LINK" --edge-kiosk-type=fullscreen >> "%TARGET%"

echo :UNLOCK_PHASE >> "%TARGET%"
echo cls >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo !RED!  WARNING: DON'T CLOSE (X) THIS WINDOW!RESET! >> "%TARGET%"
echo echo !ORN!  MINIMIZE IS ALLOWED !RESET! >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo !WHT!EXAM ENDED - ENTER CO-ORDINATER PASSWORD!RESET! >> "%TARGET%"
echo set /p "user_pass=PASSWORD: " >> "%TARGET%"

echo if NOT "%%user_pass%%"=="%%SECRET%%" goto WRONG_PASS >> "%TARGET%"
echo goto RESTORE >> "%TARGET%"

echo :WRONG_PASS >> "%TARGET%"
echo echo !RED!Wrong Password! Re-opening exam...!RESET! >> "%TARGET%"
echo timeout /t 3 >> "%TARGET%"
echo goto EXAM_LOOP >> "%TARGET%"

echo :RESTORE >> "%TARGET%"
echo start explorer.exe >> "%TARGET%"
echo timeout /t 2 ^>nul >> "%TARGET%"
echo del "%%~f0" ^& exit >> "%TARGET%"

echo [2/2] Finalizing...
timeout /t 2 >nul
cls

:: Success Message in Green
echo %GRN%SUCCESS! Exam file successfully installed.%WHT%
echo You can now find GEC_Exam.bat on your Desktop.
echo %RESET%
pause