@echo off

:: Implement the -h/--help option
set /a help=0
if [%1%]==[--help] set /a help=1
if [%1%]==[-h] set /a help=1
if %help%==1 (
  echo editscr: Edit a .bat script from C:\Users\timgr\Documents\Dev\custom-cmd-scripts in vscode
  exit /B 0
)

:: This script is used to edit .bat files inside C:\Users\timgr\Documents\Dev\custom-cmd-scripts because it is annoying to have to go look for the folder and do right-click the script -> Show more options -> Edit. If the script cannot be found an error is returned. To create a new script, use the add script.

:: Check if the first argument (script name) is supplied
if [%1%]==[] (
  echo ERROR: Too few arguments; missing .bat script name
  exit /B 1
)
:: Check if there are not too many arguments given
if not [%2]==[] (
  echo ERROR: Too many arguments
  exit /B 1
)

set script=C:\Users\timgr\Documents\Dev\custom-cmd-scripts\%1%

:: Check if the script exists
set /a script_exists=0
if exist "%script%" set /a script_exists=1
if exist "%script%.bat" set /a script_exists=2

:: Early return if the script has not been found
if %script_exists%==0 (
  echo ERROR: script %1% could not be found
  exit /B 1
)

if %script_exists%==1 (
  code "%script%"
) else (
  code "%script%.bat"
)

