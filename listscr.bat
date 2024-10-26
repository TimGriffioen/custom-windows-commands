@echo off 

:: Implement the -h/--help option
set /a help=0
if [%1%]==[--help] set /a help=1
if [%1%]==[-h] set /a help=1
if %help%==1 (
  echo listscr: List all .bat scripts in C:\Users\timgr\Documents\Dev\custom-cmd-scripts
  exit /B 0
)

:: This script is used to list all .bat files inside C:\Users\timgr\Documents\Dev\custom-cmd-scripts because it is annoying to have to go look for the folder.

:: Check if there are not too many arguments given
if not [%1]==[] (
  echo ERROR: Too many arguments
  exit /B 1
)

:: Loop over all .bat files in C:\Users\timgr\Documents\Dev\custom-cmd-scripts and print them without the .bat extension
for /f "delims=" %%f in ('dir /b /a-d "C:\Users\timgr\Documents\Dev\custom-cmd-scripts\*.bat"') do (
    :: Run the script with the --help option to get the short explanation
    call "C:\Users\timgr\Documents\Dev\custom-cmd-scripts\%%f" --help
)