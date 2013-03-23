// -------------------------------
// ReWrite by chan78 at 2001/01/11
// -------------------------------
#include "stdafx.h"
#include "AgentServer.h"
#include "monitor.h"
#include "mylog.h"
#include "servertable.h"

#include "CUseMoney.h"	// 030205 kyo
#include <process.h>

void Paythread( void *pVoid );	// 030205 kyo
extern BOOL DumpException(LPEXCEPTION_POINTERS lpExcep,char* szOutMsg, void *pData = NULL, int nSize = 0); // 030514 kyo
void ProcessEnd(const int iDestroyType) // 030514 kyo
{
	g_pServerTable->DestroyServer( iDestroyType );
	MyLog( LOG_NORMAL, "-- Agent Demon ShutDown :: Now Release INetwork Module, ServerTable" );
	// acer7
	//exit( 0 );
}

HANDLE hIn;

HWND m_hProcWnd; // 030422 kyo

int main()
{
	INPUT_RECORD				irBuffer;
	DWORD						dwResult;
	COORD						dwSize;
	SMALL_RECT					srect;
	CONSOLE_SCREEN_BUFFER_INFO	info;
	BOOL						result;
	
	EXCEPTION_POINTERS* pException = NULL; // 030514 kyo

	// Console Initialize
	// ------------------
	AllocConsole();

	memset(&irBuffer,0,sizeof(INPUT_RECORD));

	dwSize.X = 120;
	dwSize.Y = 500;

	hIn = GetStdHandle(STD_INPUT_HANDLE);
	g_hOut = GetStdHandle(STD_OUTPUT_HANDLE);

	SetConsoleScreenBufferSize(g_hOut,dwSize);
	GetConsoleScreenBufferInfo(g_hOut,&info);
	dwSize = GetLargestConsoleWindowSize(g_hOut);

	srect.Top = 0;
	srect.Left = 0;
	srect.Right = info.dwMaximumWindowSize.X-1;
	srect.Bottom = info.dwMaximumWindowSize.Y-1;

	result = SetConsoleWindowInfo(g_hOut,TRUE, &srect);
	// ------------------

	// Init Log
	InitMyLog();

	char szNationName[100] = {0,} ;//021007 lsw
	if( GetPrivateProfileString( "NATION_SET", "NATION_NAME", "" , szNationName, 50,AGENT_SERVER_INI_ ) )
	{
		bool bIsFree = (bool)GetPrivateProfileInt( "NATION_SET", "BETA_SERVER", 0, AGENT_SERVER_INI_ );
		if(!LocalMgr.InitVersion(szNationName,bIsFree)){return false;}
	}
	else
	{
		return false;
	}

	if( !StartAgentServer() )
	{
		goto FinishAgentServer;
	}


	// Make connection with PROXY
	g_pINet->ResumeTimer( 0 );
	g_pINet->ResumeTimer( 2 );

	__try// 030514 kyo
	{
		if(LocalMgr.IsAbleNation(THAI) && !LocalMgr.IsFreeBeta() )
		{	//030129 lsw 여기가 Gump 서버가 붙을 부분.
			/////////////////////////////////////////
			if( 0 < g_cAsyncPay.InitConnectPayServer() )
			{
				_beginthread( Paythread, 0, NULL );
					
				MSG msg;
				//while( PeekMessage( &msg, NULL, 0,0, PM_REMOVE) )//)GetMessage(&msg,NULL,0,0) )
				//while( PeekMessage( &msg, NULL, 0,0, PM_NOREMOVE) )//)GetMessage(&msg,NULL,0,0) )
				while( GetMessage(&msg,NULL,0,0) )
				{
					TranslateMessage(&msg);
					DispatchMessage(&msg);
				}
			}
			else
			{
				MyLog( 0, "GUMP Connection Fail" );
				goto FinishAgentServer;
			}
			
		}
		
		else
		{
			while ( g_pServerTable->IsServerRunning() )
			{
				ReadConsoleInput(hIn,&irBuffer,1,&dwResult);
			
				if (irBuffer.EventType == KEY_EVENT)
				{
					
					if (irBuffer.Event.KeyEvent.bKeyDown)
					{
						switch ( irBuffer.Event.KeyEvent.wVirtualKeyCode )
						{
						case VK_ESCAPE:
							{
								if( MessageBox( NULL, "Are you sure to DESTROY this agent server?", "IMPORTANT", MB_YESNO ) == IDYES )
								{
									g_pServerTable->DestroyServer( FINISH_TYPE_NORMAL );
								}
							}
							break;
						case VK_F1:
							{
								SetEvent(hKeyEvent[0]);
							}
							break;
						default:
							{
								// Nothing Now.
							}
							break;
						}
					}
				}
			}
			goto FinishAgentServer;
		}
	}
	__except(pException = GetExceptionInformation())//020508 lsw
	{
		DumpException( pException, "Exception Raised on main()" );
		ProcessEnd(FINISH_TYPE_UNKNOWN_ERROR);
	}
	// 순서 지킬 것.
FinishAgentServer:
	MyLog( LOG_NORMAL, "-- AgentServer ShutDown :: Now Release INetwork Module, ServerTable" );
	EndAgentServer();

	MyLog( LOG_NORMAL, "-- AgentServer Shutdown :: Now Release Console and Log Resources" );
	FreeMyLog();
	FreeConsole();

	return 0;
}

void Paythread( void *pVoid )
{
	INPUT_RECORD	irBuffer;
	DWORD			dwResult;

	while ( g_pServerTable->IsServerRunning() )
	{
		ReadConsoleInput(hIn,&irBuffer,1,&dwResult);
		
		//GetMessage(&msg,NULL,0,0);
		//TranslateMessage(&msg);
		//DispatchMessage(&msg);
		
		if (irBuffer.EventType == KEY_EVENT)
		{
			
			if (irBuffer.Event.KeyEvent.bKeyDown)
			{
				switch ( irBuffer.Event.KeyEvent.wVirtualKeyCode )
				{
				case VK_ESCAPE:
					{	
						if( MessageBox( NULL, "Are you sure to DESTROY this agent server?", "IMPORTANT", MB_YESNO ) == IDYES )
						{
							g_pServerTable->DestroyServer( FINISH_TYPE_NORMAL );
							MyLog(LOG_NORMAL, "-- AgentServer Shutdown " );
							g_cAsyncPay.LogoutAllUser(); // 030626 kyo
							PostMessage( m_hProcWnd, WM_QUIT, 0, 0 );		// 030422 kyo // 스레드 종료
						}
					}
					break;
				case VK_F1:
					{
						SendMessage( m_hProcWnd, WM_USER_ALIVE_PAY, 0,0); // 030626 kyo 
						SetEvent(hKeyEvent[0]);
					}
					break;
				default:
					{
						// Nothing Now.
					}
					break;
				}
			}
		}
	}

	return;
}