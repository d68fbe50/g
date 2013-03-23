# Microsoft Developer Studio Project File - Name="AgentServer" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=AgentServer - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "AgentServer.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "AgentServer.mak" CFG="AgentServer - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "AgentServer - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE "AgentServer - Win32 Debug" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/DR103/Source/Server/AgentServer", PDIAAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
RSC=rc.exe

!IF  "$(CFG)" == "AgentServer - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x412 /d "NDEBUG"
# ADD RSC /l 0x412 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386

!ELSEIF  "$(CFG)" == "AgentServer - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Debug"
# PROP Intermediate_Dir "Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_CONSOLE" /D "_MBCS" /FR /YX /FD /GZ /c
# ADD BASE RSC /l 0x412 /d "_DEBUG"
# ADD RSC /l 0x412 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib Ws2_32.lib /nologo /subsystem:console /map:"..\Exe\AgentServer103p_040407.map" /debug /machine:I386 /nodefaultlib:"libc.lib" /out:"..\Exe\AgentServer103p_040407.exe" /pdbtype:sept /MAPINFO:EXPORTS /MAPINFO:LINES
# SUBTRACT LINK32 /pdb:none

!ENDIF 

# Begin Target

# Name "AgentServer - Win32 Release"
# Name "AgentServer - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=.\AgentServer.cpp
# End Source File
# Begin Source File

SOURCE=.\CUseMoney.cpp
# End Source File
# Begin Source File

SOURCE=.\DrServerManager.cpp
# End Source File
# Begin Source File

SOURCE=.\LocalizingMgr.cpp
# End Source File
# Begin Source File

SOURCE=.\main.cpp
# End Source File
# Begin Source File

SOURCE=.\monitor.cpp
# End Source File
# Begin Source File

SOURCE=.\mylog.cpp
# End Source File
# Begin Source File

SOURCE=.\packed.cpp
# End Source File
# Begin Source File

SOURCE=.\RecvMsgFromServer.cpp
# End Source File
# Begin Source File

SOURCE=.\RecvMsgFromUser.cpp
# End Source File
# Begin Source File

SOURCE=.\RMProc.cpp
# End Source File
# Begin Source File

SOURCE=.\ServerMonitor.cpp
# End Source File
# Begin Source File

SOURCE=.\servertable.cpp
# End Source File
# Begin Source File

SOURCE=.\ServerTable2.cpp
# End Source File
# Begin Source File

SOURCE=.\struct.cpp
# End Source File
# Begin Source File

SOURCE=.\usertable.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\AgentServer.h
# End Source File
# Begin Source File

SOURCE=.\CUseMoney.h
# End Source File
# Begin Source File

SOURCE=.\define.h
# End Source File
# Begin Source File

SOURCE=.\dr_agent_defines.h
# End Source File
# Begin Source File

SOURCE=.\dr_agent_structures.h
# End Source File
# Begin Source File

SOURCE=.\DrServerManager.h
# End Source File
# Begin Source File

SOURCE=.\inetwork.h
# End Source File
# Begin Source File

SOURCE=.\LocalizingMgr.h
# End Source File
# Begin Source File

SOURCE=.\main.h
# End Source File
# Begin Source File

SOURCE=.\monitor.h
# End Source File
# Begin Source File

SOURCE=.\mylog.h
# End Source File
# Begin Source File

SOURCE=.\net_define.h
# End Source File
# Begin Source File

SOURCE=.\network_guid.h
# End Source File
# Begin Source File

SOURCE=.\packed.h
# End Source File
# Begin Source File

SOURCE=.\protocol.h
# End Source File
# Begin Source File

SOURCE=.\RecvMsgFromServer.h
# End Source File
# Begin Source File

SOURCE=.\RecvMsgFromUser.h
# End Source File
# Begin Source File

SOURCE=.\RMDefine.h
# End Source File
# Begin Source File

SOURCE=.\ServerIdentity.h
# End Source File
# Begin Source File

SOURCE=.\ServerMonitor.h
# End Source File
# Begin Source File

SOURCE=.\servertable.h
# End Source File
# Begin Source File

SOURCE=.\ServerTable2.h
# End Source File
# Begin Source File

SOURCE=.\StdAfx.h
# End Source File
# Begin Source File

SOURCE=.\Struct.h
# End Source File
# Begin Source File

SOURCE=.\typedef.h
# End Source File
# Begin Source File

SOURCE=.\usertable.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# End Target
# End Project
