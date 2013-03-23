@echo off
cls
echo [[[ Super Hero Story Disk Version ]]]
echo Cracked by Martin Wu,PC Game City BBS
echo PC games, SFC Games, GameBoy,........
echo [[ Line#1:26639229 Line#2:26632684 ]]
echo Note:-
echo Don't Run any CD-ROM Driver in Config.sys
pause >nul
if exist u&j\super\pclogo.exe pclogo
cls
u&j\super\lastdrv h:
cd u&j\super
cdx ..\.. /l:h
if exist super.tmp del super.tmp
call play.bat
cdx /u
cd ..\..
cls
