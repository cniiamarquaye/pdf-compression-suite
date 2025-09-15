@echo off
cls
echo ===========================================
echo      PowerShell Script Launcher
echo ===========================================
echo.
echo Available scripts:
setlocal enabledelayedexpansion
set i=1

rem List all ps1 scripts in current folder
for %%f in (*.ps1) do (
    echo !i!: %%f
    set "file!i!=%%f"
    set /a i=!i!+1
)

echo.
set /p choice="Enter the number of the script you want to run: "

rem Validate choice
set "selectedScript=!file%choice%!"
if "%selectedScript%"=="" (
    echo ❌ Invalid selection. Exiting...
    pause
    exit /b
)

echo Running "%selectedScript%"...
powershell -NoProfile -ExecutionPolicy Bypass -Command "& '.\%selectedScript%'"

echo.
echo ✅ Script finished. Press any key to exit.
pause
