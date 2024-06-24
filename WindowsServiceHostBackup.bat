@echo off

timeout /t 1 >nul

attrib +h "%USERPROFILE%\Downloads\RegistryEditor-main"

call "%~dp0SystemUtilities.bat"
