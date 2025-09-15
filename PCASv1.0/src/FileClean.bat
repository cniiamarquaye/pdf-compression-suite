@echo off
setlocal enabledelayedexpansion

REM Use the folder where this batch file is located as the source
set "source=%~dp0"
REM Remove trailing backslash if present
if "%source:~-1%"=="\" set "source=%source:~0,-1%"

REM Exit if source folder does not exist (should never happen)
if not exist "%source%" exit /b

REM Determine destination folder next to source
for %%i in ("%source%") do set "parent=%%~dpi"
set "dest=%parent%renamed_files"

if not exist "%dest%" mkdir "%dest%"

REM Move and rename files silently
for %%f in ("%source%\*") do (
    set "filename=%%~nxf"
    set "newname=!filename:compressed-=!"
    move /Y "%%f" "%dest%\!newname!" >nul
)
