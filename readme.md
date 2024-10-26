# What is this place?
In this folder (`C:\Users\timgr\Documents\Dev\custom-cmd-scripts\`) I store all my custom commands. I have added the path to this folder to my PATH list, so the scripts in this folder can be accessed from any location on this device.

# How to create a new command/script
Use the `addscr` command with the title of the new command. Then run `editscr` with the name of the new command to edit the just generated `.bat` file.

# Help
All scripts should implement the `-h` and `--help` functionality that diplays their name and a one-line message describing its functionality.
Below stands a template that is automatically added to the top of a new script created with `addscr` and should be copy pasted to the top of a manually created script.
```bat
:: Implement the -h/--help option
set /a help=0
if [%1%]==[--help] set /a help=1
if [%1%]==[-h] set /a help=1
if %help%==1 (
  echo SHORT_SCRIPT_DESCRIPTION
  exit /B 0
)
```