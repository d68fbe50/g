#include "stdafx.h"
#include "inetwork.h"
#include "ServerTable.h"
#include "RMDefine.h"

#include "usertable.h"	
#include "CUseMoney.h" 

extern HWND m_hProcWnd; // 030422 kyo

/*
bool CServerTable::SendToProxyServer( char* pMsg, DWORD dwLength )
{
	LP_SERVER_DATA pProxyServer = this->m_pOwnProxyServerData[PRIMARY_SERVER];

	if( !pProxyServer || (pProxyServer->dwConnectionIndex == 0) )
	{
		pProxyServer = this->m_pOwnProxyServerData[SECONDARY_SERVER];
	}
	if( !pProxyServer || (pProxyServer->dwConnectionIndex == 0) )
	{
		return false;
	}

	return this->m_pINet->SendToServer( pProxyServer->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}
*/
extern void ReLoadGameServerDataByKeyInput( void );

void KickOffUserALL() // 030716 kyo copy to PTCL_BROADCAST_TO_SERVERS:
{
	USERINFO* cur = NULL;
	USERINFO* next = NULL;
	USERINFO** pTable = g_pUserTable->GetUserInfoTable();
	for (DWORD i=0; i<g_pUserTable->GetBucketNum(); i++)
	{
		cur = pTable[i];
		while (cur)
		{
			next = cur->pNextUserInfo;
			// 해당 유저에게 끊도록 권고한다.
			g_pUserTable->DisconnectUserBySuggest( cur, CMD_CLOSE_CONNECTION_SAME_ID_LOGON );			
		}
	}
}

void KickOffUser( char* szUserID )	// 030224 kyo 유저 강제로그아웃
{
	if( NULL == szUserID )// 030716 kyo
	{
		return;
	}

	USERINFO *pUser = g_pUserTable->GetUserInfo( szUserID );	
	if( pUser == NULL )
	{
		return;
	}
	g_pINet->CompulsiveDisconnectUser( pUser->dwConnectionIndex );
}


void RMProc(DWORD dwConnectionIndex, char* pMsg, DWORD dwLength)
{
	BYTE header;
	memcpy(&header,pMsg+1, 1);

	switch(header)
	{
	case MSG_SHUT_DOWN:
		{
			//CServerTable *pVoid = NULL;
			//	pVoid->StartServer(0);			
			g_pServerTable->DestroyServer( FINISH_TYPE_NORMAL );
			PostMessage( m_hProcWnd, WM_QUIT, 0, 0 );		// 030422 kyo // 스레드 종료
		}
		break;


	case MSG_ECHO:
		{
			//Echo
			g_pINet->SendToServer(dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION);
		}
		break;

	case MSG_RM_KICKOFF_USER:
		{
			KickOffUser( pMsg+2 );	// 030224 kyo 유저 강제로그아웃
			break;
		}
	case MSG_RM_KICKOFF_USER_ALL: // 030716 kyo KickOff All user
		{	//유저를 족이면
			MyLog( 0, "LogOff All user By RMTool" );
			if( LocalMgr.IsAbleNation(THAI) )
			{
				g_cAsyncPay.LogoutAllUser();
			}
			else
			{
				KickOffUserALL();
			}
			break;
		}
	}

}