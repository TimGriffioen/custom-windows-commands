@echo off 
 
:: Implement the -h/--help option 
set /a help=0 
if [%1%]==[--help] set /a help=1 
if [%1%]==[-h] set /a help=1 
if %help%==1 ( 
  echo dev: shorthand for npm run dev
  exit /B 0 
) 
 
:: This script is just a shorthand for 
:: > npm run dev

npm run dev
