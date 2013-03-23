@echo off
cls
echo Loading...................
echo Please wait ..............
cd fmv
call copyrpl.bat
cd ..
cdx /u
cdx .
cls
tomb
cdx /u
if exist *. del *.
cls

