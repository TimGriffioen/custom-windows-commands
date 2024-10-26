@echo off 
 
:: Implement the -h/--help option 
set /a help=0 
if [%1%]==[--help] set /a help=1 
if [%1%]==[-h] set /a help=1 
if %help%==1 ( 
  echo open_readme: Open the readme file of the scripts in vscode
  exit /B 0 
) 
 
:: This script opens the scripts' readme file in vscode.

:: Check if the first argument (script name) is supplied
if not [%1%]==[] (
  echo ERROR: Too many arguments
  exit /B 1
)

code "C:\Users\timgr\Documents\Dev\custom-cmd-scripts\readme.md"
