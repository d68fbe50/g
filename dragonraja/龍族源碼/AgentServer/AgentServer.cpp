// -------------------------------
// ReWrite by chan78 at 2001/01/11
// -------------------------------

#include "main.h"
#include "AgentServer.h"
#include "servertable.h"
#include "usertable.h"
#include "monitor.h"
#include "mylog.h"
#include "RecvMsgFromServer.h"
#include "RecvMsgFromUser.h"
#include "network_guid.h"

I4DyuchiNET* g_pINet = NULL;

HANDLE hKeyEvent[3] = { NULL, NULL, NULL };

bool Init();

bool StartAgentServer()	
{
	return Init();
}

void __stdcall ShowAgentServerStatus(DWORD dwValue)//020511 lsw
{
	if( !g_pServerTable )
	{
		MyLog( LOG_NORMAL, "CServerTable Is Not Available." );
	}
	else
	{
		LocalMgr.DisplayLocalizingSet();//021007 lsw
		g_pServerTable->ShowServerStatus();
	}
	return;
}


void __stdcall AwaitingProxyServerConnect(DWORD dwValue)//020511 lsw
{

	LP_SERVER_DATA pProxy = NULL;

	if( g_pServerTable )
	{
		pProxy = g_pServerTable->GetOwnProxyServerData();
		if( pProxy )
		{
			// Added by chan78 at 2001/04/11 :: 이미 접속 시도중인 경우 시도하지 않는다.
			if( g_pServerTable->GetConnectionResultData()->dwConnectionType != CONNECT_TYPE_NONE )
			{
				return;
			}
			
			// Proxy 가 없으면.
			if( !g_pServerTable->GetOwnProxyServerData()->dwConnectionIndex )
			{
				MyLog( LOG_NORMAL, "@@ Trying to connect PROXY Server ..." );
				// 접속 시도.
				if( g_pServerTable->ConnectToProxyServer() )
				{
					// Modified by chan78 at 2001/04/11 :: 타이머 포즈 처리는 결과처리 콜백함수에서.
					return;
				}
			}
			else
			{
				g_pINet->PauseTimer( 0 );
				return;
			}
		}
	}
	return;
}

void __stdcall TimerForUserTable(DWORD dwValue)//020511 lsw
{
	if( g_pUserTable )
	{
		// 접속종료 대기 처리용.
		g_pUserTable->CloseConnectionWithAwaitingToDisconnect();
		// 오랜시간 쉬는 사용자 처리용.
		g_pUserTable->CloseConnectionWithSleepingUsers();
	}
}	
	
bool Init()
{	
	CUSTOM_EVENT ev[4];
	DESC_NETWORK desc;
	
	// Added by chan78 at 2000/11/27
	ev[0].dwPeriodicTime = 1000;
	ev[0].pEventFunc = AwaitingProxyServerConnect;
	ev[1].dwPeriodicTime = 0;
	ev[1].pEventFunc = ShowAgentServerStatus;
	ev[2].dwPeriodicTime = 1000;
	ev[2].pEventFunc = TimerForUserTable;
	
	desc.OnAcceptServer = OnAcceptServer;
	desc.OnAcceptUser = OnAcceptUser;
	desc.OnDisconnectServer = OnDisconnectServer;
	desc.OnDisconnectUser = OnDisconnectUser;
	desc.dwMainMsgQueMaxBufferSize = 5120000;
	desc.dwMaxServerNum = 120;//020110 LSW
	desc.dwMaxUserNum = 1500; // 010102 
	desc.dwServerBufferSizePerConnection = 256000;
	desc.dwServerMaxTransferSize = 65000;
	desc.dwUserBufferSizePerConnection = 65000;
	desc.dwUserMaxTransferSize = 8192;
	desc.OnRecvFromServerTCP = RecvMsgFromServer;
	desc.OnRecvFromUserTCP = RecvMsgFromUser;
		
	desc.dwCustomDefineEventNum = 3;
	
	// Added by chan78 at 2001/04/11
	desc.dwConnectNumAtSameTime = 200;//020110 LSW
	
	desc.pEvent = ev;
	desc.dwFlag = NULL;
	
	HRESULT hr;
	CoInitialize(NULL);
    
	hr = CoCreateInstance(
           CLSID_4DyuchiNET,
           NULL,
           CLSCTX_INPROC_SERVER,
           IID_4DyuchiNET,
           (void**)&g_pINet);
	
	if (!g_pINet->CreateNetwork(&desc, 10, 10))
		return false;
	
	// 일단 정지...
	//g_pINet->PauseTimer( 0 ); // 040406 kyo
	//g_pINet->PauseTimer( 2 ); // 040406 kyo
	
	hKeyEvent[0] = g_pINet->GetCustomEventHandle(1);
	
	// CUserTable / CServerTable 생성.
	g_pUserTable = new CUserTable((WORD)65535);
	g_pServerTable = new CServerTable(AGENT_SERVER_INI_,MAX_SERVER_NUM, g_pINet);//021007 lsw
	
	return true;
}	
	
void EndAgentServer()
{	
	// INetwork 제거.
	if (g_pINet)
	{
		g_pINet->Release();
		g_pINet = NULL;
	}
	
	// CServerTable 제거
	if (g_pServerTable)
	{
		delete g_pServerTable;
		g_pServerTable = NULL;
	}
	
	// CUserTable 제거
	if (g_pUserTable)
	{
		delete g_pUserTable;
		g_pUserTable = NULL;
	}
	
	CoFreeUnusedLibraries();
	CoUninitialize();
	
	return;
}	
	
	
	
	
	
	
	
	
/////////////////////
	
	

#define HACKING_EFFECTTABLE_	20001
#define HACKING_011106_			20002
#define HACKING_CONDITIONTABLE_	20003
#define HACKING_MOVEPATTERN_	20004
#define HACKING_ANITABLE_		20005
#define HACKING_ATTACKRANGE_	20006
#define HACKING_ACCELATOR_		20007
#define HACKING_FILTER_			20008


	
static char sMsg[MAX_PACKET_SIZE];
bool SendHackingUser2DB( USERINFO *pUserInfo, int type,  char *cause )
{	
	t_packet *p;
	t_hacking_user *tp;

	sMsg[0] = (BYTE)PTCL_AGENT_TO_DB;
	*((DWORD *)(sMsg+1)) = pUserInfo->dwID;

	p = (t_packet*)(sMsg+1+4);
				
	p->h.header.type = CMD_HACKING_USER;
	p->h.header.size = sizeof( t_hacking_user );
	tp = &p->u.hacking_user;
	tp->type = type;
	
	strcpy( tp->id, pUserInfo->szName );
	strcpy( tp->name, " " );
	strcpy( tp->ip, pUserInfo->szIP );
	strcpy( tp->cause, cause );
	
	if( !g_pServerTable->SendToDBDemon( sMsg, (1+4+sizeof(t_header)+sizeof( t_hacking_user ))) )
	{
		MyLog( LOG_NORMAL, "Fail : HackingUser ( %s:%s )",  pUserInfo->szName, pUserInfo->szIP );
	}

	return true;
}	
	
	
	
	
	
	
	
	
	
