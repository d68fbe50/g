@echo off

echo.
echo This batch file uses the WAVELIB utility to create a wave library file
echo in the current directory, and then launches the XDIGPLAY program with
echo the currently selected sound drivers to demonstrate XMIDI-triggered 
echo digital audio playback.
echo.
echo At least 2MB of hard-disk space must be free.  This batch file must
echo be run from the DRIVERS directory, and the WAVELIB program must
echo be in the ..\TOOLS directory.
echo.

echo Press control-C to abort, or any other key to continue.

pause > nul

rem
rem Launch WAVELIB
rem

if exist demo.wvl goto 1

..\tools\wavelib wavedemo.txt
if errorlevel 1 goto exit

:1

rem
rem Launch XDIGPLAY
rem

xdigplay demo.wvl digdemo.xmi

del demo.wvl

:exit
echo.

