@echo off
title GEC WC Exam 
color 0B

echo ======================================================
echo    GEC WEST CHAMPARAN - Quantazeroplus
echo ======================================================
echo.
echo [1/2] Creating GEC_Exam.bat...

:: Universal Desktop Detection (Works for OneDrive/Local)
for /f "usebackq tokens=2,*" %%A in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "MY_DESKTOP=%%B"
call set "TARGET=%MY_DESKTOP%\GEC_Exam.bat"

echo @echo off > "%TARGET%"
echo setlocal >> "%TARGET%"
echo set "SECRET=Gecwc1234@" >> "%TARGET%"
echo set "LOGFILE=%TEMP%\exam_logs.txt" >> "%TARGET%"

:: Kill explorer immediately
echo taskkill /f /im explorer.exe ^>nul 2^>^&1 >> "%TARGET%"

echo :EXAM_LOOP >> "%TARGET%"
echo mode con: cols=75 lines=22 >> "%TARGET%"
echo cls >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo   EXAM IN PROGRESS - GEC WEST CHAMPARAN >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo. >> "%TARGET%"
echo echo   STUDENT INSTRUCTIONS: >> "%TARGET%"
echo echo   1. WRITE YOUR ANSWERS ON PAPER/OMR SHEET. >> "%TARGET%"
echo echo   2. DONT USE THIS KEYS. >> "%TARGET%"
echo echo   3. BEST WISHES >> "%TARGET%"
echo echo. >> "%TARGET%"

:: Start Edge and WAIT - FIXED URL TO STOP DOWNLOAD
:: Changed /uc?export=view to /file/d/.../preview
echo start /wait msedge --kiosk "https://drive.google.com/file/d/1T_XLcLb30OgGSg0usY6FTzniux19ilhL/preview" --edge-kiosk-type=fullscreen >> "%TARGET%"

echo :UNLOCK_PHASE >> "%TARGET%"
echo cls >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo   EXAM ENDED - ENTER TEACHER PASSWORD >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo set /p "user_pass=PASSWORD: " >> "%TARGET%"

:: Stable IF logic to prevent auto-exit
echo if NOT "%%user_pass%%"=="%%SECRET%%" goto WRONG_PASS >> "%TARGET%"
echo goto RESTORE >> "%TARGET%"

echo :WRONG_PASS >> "%TARGET%"
echo echo Wrong Password! Re-opening exam... >> "%TARGET%"
echo timeout /t 3 >> "%TARGET%"
echo goto EXAM_LOOP >> "%TARGET%"

echo :RESTORE >> "%TARGET%"
echo start explorer.exe >> "%TARGET%"
echo timeout /t 2 ^>nul >> "%TARGET%"
echo del "%%~f0" ^& exit >> "%TARGET%"

echo [2/2] Finalizing...
timeout /t 2 >nul
cls
echo SUCCESS! PDF will show in-browser and instructions are updated.
pause