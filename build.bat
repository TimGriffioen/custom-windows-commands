@echo off 
 
:: Implement the -h/--help option 
set /a help=0 
if [%1%]==[--help] set /a help=1 
if [%1%]==[-h] set /a help=1 
if %help%==1 ( 
  echo build: shorthand for npm run build
  exit /B 0 
) 
 
:: This script is used as a shorthand for npm run build
npm run build
