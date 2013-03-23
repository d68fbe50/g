@echo off
cls
echo [[[ Super Hero Story Disk Version ]]]
echo Cracked by Martin Wu,PC Game City BBS
echo PC games, SFC Games, GameBoy,........
echo [[ Line#1:26639229 Line#2:26632684 ]]
pause >nul
if exist u&j\super\pclogo.exe pclogo
smartdrv 512
cls
u&j\super\lastdrv h:
u&j\super\cdx . /l:h
cls
cd u&j\super
call play.bat
cd ..\..
u&j\super\cdx /u
cls
