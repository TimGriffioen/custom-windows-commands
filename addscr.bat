@echo off

:: Implement the -h/--help option
set /a help=0
if [%1%]==[--help] set /a help=1
if [%1%]==[-h] set /a help=1
if %help%==1 (
  echo addscr: Create a new .bat script in C:\Users\timgr\Documents\Dev\custom-cmd-scripts
  exit /B 0
)

:: This script is used to create .bat files inside C:\Users\timgr\Documents\Dev\custom-cmd-scripts because it is annoying to have to go look for the folder and add it there. If the script exists already an error is returned. To edit a new script, use the edit script.

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
if exist "%script%.bat" set /a script_exists=1

:: Early return if a script already exists
if not %script_exists%==0 (
  echo ERROR: script %1% already exists
  exit /B 1
)

:: Add the .bat extension if it is not given
if not "%script:~-4%"==".bat" set script=%script%.bat

:: Create the script with the -h/--help option and a short explanation
echo @echo off > "%script%"
echo. >> "%script%"
echo :: Implement the -h/--help option >> "%script%"
echo set /a help=0 >> "%script%"
echo if [%%1%%]==[--help] set /a help=1 >> "%script%"
echo if [%%1%%]==[-h] set /a help=1 >> "%script%"
echo if %%help%%==1 ( >> "%script%"
echo   echo SCRIPT_NAME: SHORT_SCRIPT_EXPLANATION >> "%script%"
echo   exit /B 0 >> "%script%"
echo ) >> "%script%"
echo. >> "%script%"
echo :: This script is used to ... >> "%script%"

echo Created script %1%