@echo off
set CURRENT_DIR=%~dp0

:: Make sure dnt is not installed
dotnet tool uninstall -g dnt

:: Build
cd %CURRENT_DIR%\src\DNT
dotnet publish -r win-x64 -p:PublishSingleFile=true --self-contained true
cd %CURRENT_DIR%\src\Dnt.Npm\bin\binaries\Net50\win-x64\publish

:: Remove possible existing old dnt folder
rmdir /Q %USERPROFILE%\.dotnet\tools\dnt\

:: Copy this build and add shim cmd file
xcopy /s/y %CURRENT_DIR%\src\Dnt.Npm\bin\binaries\Net50\win-x64\publish\* %USERPROFILE%\.dotnet\tools\dnt\*
copy %CURRENT_DIR%\dnt.cmd %USERPROFILE%\.dotnet\tools

echo "Done"

pause