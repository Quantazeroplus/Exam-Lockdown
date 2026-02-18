@echo off
title GEC WC Exam Installer 
color 0B

echo ======================================================
echo    GEC WEST CHAMPARAN - ( Powered by Quantazeroplus )
echo ======================================================
echo.
echo [1/2] Creating  GEC_Exam.bat...

:: REFERENCE LINE CHANGE: Universal Desktop Detection
for /f "usebackq tokens=2,*" %%A in (`reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop`) do set "MY_DESKTOP=%%B"
call set "TARGET=%MY_DESKTOP%\GEC_Exam.bat"

echo @echo off > "%TARGET%"
echo setlocal >> "%TARGET%"
echo set "SECRET=Gecwc1234@" >> "%TARGET%"
echo set "LOGFILE=%TEMP%\exam_logs.txt" >> "%TARGET%"

:: Kill explorer immediately
echo taskkill /f /im explorer.exe ^>nul 2^>^&1 >> "%TARGET%"

echo :EXAM_LOOP >> "%TARGET%"
echo mode con: cols=70 lines=20 >> "%TARGET%"
echo cls >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo   EXAM IN PROGRESS - DO NOT CLOSE THIS WINDOW >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo. >> "%TARGET%"
echo echo   1. Dont use these keys . >> "%TARGET%"
echo echo   2. Write your answer on the paper >> "%TARGET%"
echo echo. >> "%TARGET%"

:: Start Edge and WAIT for it to close
echo start /wait msedge --kiosk "https://drive.google.com/uc?export=view&id=1T_XLcLb30OgGSg0usY6FTzniux19ilhL" --edge-kiosk-type=fullscreen >> "%TARGET%"

echo :UNLOCK_PHASE >> "%TARGET%"
echo cls >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo echo   EXAM ENDED - ENTER CO-ORDINATER PASSWORD >> "%TARGET%"
echo echo ====================================================== >> "%TARGET%"
echo set /p "user_pass=PASSWORD: " >> "%TARGET%"

:: REFERENCE LINE CHANGE: Stable IF logic to prevent auto-exit
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
echo SUCCESS! Run GEC_Exam.bat on the student PC.
pause