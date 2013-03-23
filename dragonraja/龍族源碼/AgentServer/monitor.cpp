#include "monitor.h"


HANDLE g_hOut = NULL;
DWORD dwScreenBufferLastRow = 0;

void WriteText(char* msg, bool type )
{
	DWORD lenout;

	WriteConsole(g_hOut, msg, lstrlen(msg), &lenout,0);
	if( type == true )	WriteConsole(g_hOut, "\n", 1, &lenout,0);
	
	return;
}


void WriteText(char* msg,WORD x,WORD y)
{
	COORD	pos;
	pos.X = x;
	pos.Y = y;
	
	DWORD lenout;
	WriteConsoleOutputCharacter(g_hOut,msg,lstrlen(msg),pos,&lenout);

	return;
}

void SetMonitorSize(DWORD col,DWORD row)
{
	
	SMALL_RECT srect;
	COORD	dwSize;
	
	CONSOLE_SCREEN_BUFFER_INFO info;

	dwSize.X = (short) col;
	dwSize.Y = (short) row;
	
	SetConsoleScreenBufferSize(g_hOut,dwSize);
	GetConsoleScreenBufferInfo(g_hOut,&info);

	dwScreenBufferLastRow = row-1;
	srect.Top = 0;
	srect.Left = 0;
	srect.Right = info.dwMaximumWindowSize.X-1;
	srect.Bottom = info.dwMaximumWindowSize.Y-1;
	SetConsoleWindowInfo(g_hOut,TRUE, &srect);

	return;
}

HANDLE GetCurrentConsoleOut()
{
	return g_hOut;
}
