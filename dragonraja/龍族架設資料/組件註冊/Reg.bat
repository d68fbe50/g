@echo off
regsvr32.exe inetwork.dll
regsvr32.exe OleDbThread.dll
echo 注册成功，按任意键退出!
Pause>nul