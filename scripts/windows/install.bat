@echo off
REM Markon Windows Installation Script
REM This script installs Markon as the default handler for .md files

echo Installing Markon as default Markdown viewer...

REM Copy scripts to user profile
copy /Y "%~dp0open-with-markon.ps1" "%USERPROFILE%\open-with-markon.ps1"
copy /Y "%~dp0open-with-markon.bat" "%USERPROFILE%\open-with-markon.bat"

REM Create registry entries
reg add "HKCU\Software\Classes\.md" /ve /d "MarkonMarkdown" /f
reg add "HKCU\Software\Classes\.markdown" /ve /d "MarkonMarkdown" /f
reg add "HKCU\Software\Classes\MarkonMarkdown" /ve /d "Markdown File" /f
reg add "HKCU\Software\Classes\MarkonMarkdown\DefaultIcon" /ve /d "C:\Windows\System32\shell32.dll,70" /f
reg add "HKCU\Software\Classes\MarkonMarkdown\shell\open" /ve /d "Open with Markon" /f
reg add "HKCU\Software\Classes\MarkonMarkdown\shell\open\command" /ve /d "\"%USERPROFILE%\open-with-markon.bat\" \"%%1\"" /f

echo.
echo Installation complete!
echo Double-click any .md or .markdown file to open it in Markon.
echo.
pause
