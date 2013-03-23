@echo off

:disk_2
echo 
echo Please Insert Disk 2 . . .
pause
if not exist a:fd2.lzh goto disk_2
echo ......................... W A I T ..................................
copy a:fd2.lzh
lha e fd2
del fd2.lzh

:disk_3
echo 
echo Please Insert Disk 3 . . .
pause
if not exist a:fd3.lzh goto disk_3
echo ......................... W A I T ..................................
copy a:fd3.lzh
lha e fd3
del fd3.lzh

:disk_4
echo 
echo Please Insert Disk 4 . . .
pause
if not exist a:fd4.lzh goto disk_4
echo ......................... W A I T ..................................
copy a:fd4.lzh
lha e fd4
del fd4.lzh

:disk_5
echo 
echo Please Insert Disk 5 . . .
pause
if not exist a:fd5.lzh goto disk_5
echo ......................... W A I T ..................................
copy a:fd5.lzh
lha e fd5
del fd5.lzh

:disk_6
echo 
echo Please Insert Disk 6 . . .
pause
if not exist a:fd6.lzh goto disk_6
echo ......................... W A I T ..................................
copy a:fd6.lzh
lha e fd6
del fd6.lzh

cls
echo Install O.K.
echo Please type FD to run the 'FLAME DRAGON KNIGHTS'
