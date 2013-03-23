#ifndef MONITOR_H
#define MONITOR_H

#include "stdafx.h"
#define SCREEN_TEXT_SIZE_X		100
#define SCREEN_TEXT_SIZE_Y		500

extern HANDLE g_hOut;
HANDLE GetCurrentConsoleOut();
void SetMonitorSize(DWORD col,DWORD row);
void WriteText(char* msg, bool type = true );
void WriteText(char* msg,WORD x,WORD y);

#endif
