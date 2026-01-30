@echo off
REM Opens markdown files with Markon (https://varunr89.github.io/markon-viewer/)
REM This wrapper calls the PowerShell script that reads and encodes the file

REM Change to a valid Windows directory first to avoid UNC path issues
pushd %SYSTEMROOT%

powershell -ExecutionPolicy Bypass -File "%USERPROFILE%\open-with-markon.ps1" "%~1"

popd
