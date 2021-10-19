:: Batch shim for dnt\dnt.exe
@echo off
SET DIR=%~dp0%
cmd /c "%DIR%\dnt\dnt.exe %*"
exit /b %ERRORLEVEL%