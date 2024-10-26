@echo off 
 
:: Implement the -h/--help option 
set /a help=0 
if [%1%]==[--help] set /a help=1 
if [%1%]==[-h] set /a help=1 
if %help%==1 ( 
  echo affirmation: Randomly generates an affirmation
  exit /B 0 
) 
 
:: This script is used to generate a random affirmation using a custom python script.
:: It displays the affirmation and waits for user input before terminating.
python "C:\Users\timgr\Documents\Dev\affirmation-generator\create_affirmation.py"
pause