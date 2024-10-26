@echo off 
 
:: Implement the -h/--help option 
set /a help=0 
if [%1%]==[--help] set /a help=1 
if [%1%]==[-h] set /a help=1 
if %help%==1 ( 
  echo importT: shorthand for npm run importTranslations
  exit /B 0 
) 
 
:: This script is a shorthand for
:: > npm run importTranslations

npm run importTranslations