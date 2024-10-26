@echo off

:: Implement the -h/--help option
set /a help=0
if [%1%]==[--help] set /a help=1
if [%1%]==[-h] set /a help=1
if %help%==1 (
  echo delscr: Delete a .bat script from C:\Users\timgr\Documents\Dev\custom-cmd-scripts
  exit /B 0
)

:: This script is used to delete .bat files inside C:\Users\timgr\Documents\Dev\custom-cmd-scripts because it is annoying to have to go look for the folder and do delete it there. If the script cannot be found an error is returned. A confirmation is asked before deleting the script.

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

:: Ask for confirmation
if %script_exists%==1 (
  set /p confirm=Are you sure you want to delete %script%? [y/n] 
) else (
  set /p confirm=Are you sure you want to delete %script%.bat? [y/n] 
)
if /i not "%confirm%"=="y" (
  echo Aborted
  exit /B 1
)

:: Delete the script
if %script_exists%==1 (
  del "%script%"
) else (
  del "%script%.bat"
)

echo Deleted script %1%