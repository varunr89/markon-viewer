@echo off
REM Markon Windows Uninstallation Script
REM This script removes Markon as the default handler for .md files

echo Uninstalling Markon...

REM Remove registry entries
reg delete "HKCU\Software\Classes\.md" /f 2>nul
reg delete "HKCU\Software\Classes\.markdown" /f 2>nul
reg delete "HKCU\Software\Classes\MarkonMarkdown" /f 2>nul

REM Remove scripts from user profile
del /Q "%USERPROFILE%\open-with-markon.ps1" 2>nul
del /Q "%USERPROFILE%\open-with-markon.bat" 2>nul

echo.
echo Uninstallation complete!
echo.
pause
