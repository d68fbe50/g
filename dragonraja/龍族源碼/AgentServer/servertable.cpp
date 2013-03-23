// -------------------------------
// New Server Table
//
// Rewrote By chan78 at 2000/12/27
// -------------------------------

#define _WIN32_WINNT 0x0500

// Added by chan78 at 2001/07/16 :: include windows.h for WriteConsoleInput()
//#include <windows.h>

#include "servertable.h"
#include "servertable2.h"

// Added by chan78 at 2001/07/16 :: hIn.
extern HANDLE hIn;

CServerTable* g_pServerTable;

char ServerStatusSymbols[NUM_OF_SERVER_STATUS] =
{
	{' '},	// STATUS_NOT_IN_NETWORK
	{'T'},	// STATUS_TRYING_TO_CONNECT
	{'P'},	// STATUS_AWAITING_PROXY_CONNECTION
	{'C'},	// STATUS_SERVER_LIST_CERTIFIED
	{'1'},	// STATUS_AWAITING_SERVER_LIST
	{'2'},  // STATUS_AWAITING_SET_SERVER_LIST_RESULT
	{'3'},	// STATUS_AWAITING_CONNECTION_ORDER
	{'4'},	// STATUS_AWAITING_CONNECTION_RESULT
	{'5'},	// STATUS_AWAITING_DB_DEMON_SETTING
	{'6'},	// STATUS_AWAITING_SET_DB_DEMON_RESULT
	{'O'},	// STATUS_ACTIVATED
	{'-'},	// STATUS_INACTIVATED
	{'X'},	// STATUS_CLOSING
	{'R'},	// STATUS_RELOAD_GAMESERVER_DATA			//Added by KBS 020120
	{'O'}	// STATUS_FINISH_RELOAD_GAMESERVER_DATA		//Added by KBS 020120
};

//010221 KHS  
BYTE szMsg[MM_MAX_PACKET_SIZE+1+4];

// -----------------------------------------------------------------
// Constructor / Destructor
// -----------------------------------------------------------------
CServerTable::CServerTable( char* sFileName, WORD wMaxBucketNum, I4DyuchiNET* pINet )
{
	this->m_wMaxBucketNum = wMaxBucketNum;

	this->m_bIsServerRunning = true;
	this->m_dwNumOfServerConnections = 0;
	this->m_dwNumOfConnectedServers = 0;
	this->m_dwNumOfUsersInServerSet = 0;
	this->m_dwNumOfServers = 0;
	this->m_dwNumOfUsers = 0;

	for( DWORD i = 0; i < NUM_OF_SERVER_TYPES; i++ )
	{
		this->m_dwNumOfTypedServers[i] = 0;
	}

	this->m_pOwnDBDemonData = NULL;
	this->m_pOwnProxyServerData[PRIMARY_SERVER] = NULL;
	this->m_pOwnProxyServerData[SECONDARY_SERVER] = NULL;
	this->m_pOwnServerData = NULL;

	this->m_ppPackedTable = NULL;

	this->m_pServerListHead = NULL;
	this->m_pServerListTail = NULL;

	this->m_pINet = pINet;

	memset( this->m_szNewMsg, 0, MM_MAX_PACKET_SIZE );

	this->m_ppServerTable = new LP_HASHED_SERVER_DATA[this->m_wMaxBucketNum];
	memset(this->m_ppServerTable, 0, sizeof(LP_HASHED_SERVER_DATA)*this->m_wMaxBucketNum);

	this->m_ppPackedTable = new CPackedMsg*[this->m_wMaxBucketNum];
	memset(this->m_ppPackedTable, 0, m_wMaxBucketNum * sizeof(CPackedMsg*));

	// Added by chan78 at 2001/04/11
	this->m_ConnectionResultData.dwConnectionType = CONNECT_TYPE_NONE;
	this->m_ConnectionResultData.dwResultCheckedServers = 0;
	this->m_ConnectionResultData.dwToConnectServers = 0;
	this->m_ConnectionResultData.pSender = NULL;

	InitializeCriticalSection( &m_IsRunningCriticalSection );

#ifdef __IS_PROXY_SERVER
	memset( m_bConnectionStatus, 0, (MAX_SERVER_NUM*MAX_SERVER_NUM*sizeof(BYTE)) );
	InitializeCriticalSection( &m_IsUserAcceptAllowedCriticalSection );

	m_bIsUserAcceptAllowed = false;
#endif

	// Initialize
	this->InitServerTable( sFileName );

	return;
}

CServerTable::~CServerTable()
{
	// Remove OwnServerInfo
	if (this->m_pOwnServerData)
	{
		delete this->m_pOwnServerData;
		this->m_pOwnServerData = NULL;
	}
	
	// Remove PackedMsg Table
	if (this->m_ppPackedTable)
	{
		for ( DWORD i=0; i < this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT]; i++)
		{
			delete this->m_ppPackedTable[i];
			this->m_ppPackedTable[i] = NULL;
		}
		delete this->m_ppPackedTable;
		this->m_ppPackedTable = NULL;
	}

	// Remove All ServerDatas In List
	this->RemoveAllServerDatasFromList();

	// Remove All HashedServerDatas In HashTable
	this->RemoveAllServerDatasFromTable();

	// Remove Server Table
	if ( this->m_ppServerTable )
	{
		delete [] this->m_ppServerTable;
		this->m_ppServerTable = NULL;
	}

	// Delete Critical Section
	DeleteCriticalSection( &m_IsRunningCriticalSection );

#ifdef __IS_PROXY_SERVER
	DeleteCriticalSection( &m_IsUserAcceptAllowedCriticalSection );
#endif

	return;
}


// -----------------------------------------------------------------
// Private Methods
// -----------------------------------------------------------------
void CServerTable::RemoveAllServerDatasFromTable()
{
	LP_HASHED_SERVER_DATA pCur = NULL;
	LP_HASHED_SERVER_DATA pNext = NULL;

	for ( WORD wIndex = 0; wIndex < this->m_wMaxBucketNum; wIndex++ )
	{
		pCur = this->m_ppServerTable[wIndex];
		while ( pCur )
		{
			pNext = pCur->pNextHashedServerData;
			delete pCur;
			pCur = pNext;
		}
		this->m_ppServerTable[wIndex] = NULL;
	}
	return;
}

void CServerTable::RemoveAllServerDatasFromList()
{
	LP_SERVER_DATA pCur = this->m_pServerListHead;
	LP_SERVER_DATA pNext = NULL;
	LP_HASHED_SERVER_DATA pDummy = NULL;

	while ( pCur )
	{
		pNext = pCur->pNextServerData;
		delete pCur;
		pCur = pNext;
	}
	return;
}

#ifdef __IS_PROXY_SERVER
DWORD CServerTable::BatchConnect()
{
	LP_AWAITING_CONNECTION_RESULT_DATA pResult = this->GetConnectionResultData();
	LP_SERVER_DATA pToConnectServer;

	// Added by chan78 at 2001/03/16 :: this->m_ConnectionResultData 가 사용중일땐 무시.
	// 이런 상황은 심각하다. 발생해선 안됨.
	if( pResult->dwConnectionType != CONNECT_TYPE_NONE )
	{
		MyLog( LOG_FATAL, "BatchConnect() :: this->m_ConnectionResultData is Already Using!!!(%d)", this->GetConnectionResultData()->dwConnectionType );
#ifdef __ON_DEBUG
		_asm int 3;
#else
		this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
	}
	pResult->dwConnectionType = CONNECT_TYPE_BATCH;
	pResult->dwToConnectServers = 0;
	pResult->dwResultCheckedServers = 0;
	pResult->pSender = NULL;

	// 2001/03/14
	for( pToConnectServer = this->m_pServerListHead; pToConnectServer; pToConnectServer = pToConnectServer->pNextServerData )
	{
		if( !this->ConnectToServer( pToConnectServer, CONNECT_TYPE_BATCH ) )
		{
			// 심각. 서버 죽인다.
			MyLog( LOG_FATAL, "INETWORK::ConnectToServer() returned NULL!!!(port:%d)", pToConnectServer->wPort );
			this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
			return 0;
		}

		// 접속결과 처리는 콜백함수에서.
		pResult->dwToConnectServers++;
	}

	return pResult->dwToConnectServers;
}
#endif

void CServerTable::NotifyServerStatus()
{
	register char szDummy[16];
	LP_SERVER_DATA pDummyServerData;
	LP_NOTIFY_SERVER_STATUS_PACKET pPacket = (LP_NOTIFY_SERVER_STATUS_PACKET)(szDummy+1);
	DWORD dwFailCounter = 0;

	// BuildPacket
	szDummy[0] = PTCL_NOTIFY_SERVER_STATUS;
	pPacket->dwServerStatus = this->GetOwnServerData()->dwStatus;

	for( pDummyServerData = this->GetServerListHead(); pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
	{
		if( pDummyServerData->dwConnectionIndex )
		{
			if( !this->Send( pDummyServerData->dwConnectionIndex, szDummy, sizeof(BYTE)+sizeof(NOTIFY_SERVER_STATUS_PACKET) ) )
			{
				dwFailCounter++;
			}
		}
	}
	if( dwFailCounter )
	{
		MyLog( LOG_IMPORTANT, "NotifyServerStatus :: %d Servers are can't receive Packet", dwFailCounter );
	}
	return;
}

bool CServerTable::NotifyServerStatus( LP_SERVER_DATA pToServer )
{
	register char szDummy[16];
	LP_NOTIFY_SERVER_STATUS_PACKET pPacket = (LP_NOTIFY_SERVER_STATUS_PACKET)(szDummy+1);

	// BuildPacket
	szDummy[0] = PTCL_NOTIFY_SERVER_STATUS;
	pPacket->dwServerStatus = this->GetOwnServerData()->dwStatus;

	if( !pToServer || !pToServer->dwConnectionIndex )
		return false;

	return this->Send( pToServer->dwConnectionIndex, szDummy, sizeof(BYTE)+sizeof(NOTIFY_SERVER_STATUS_PACKET) );
}


bool CServerTable::ReportServerStatus()
{
	if( this->GetOwnProxyServerData() )
	{
		return this->ReportServerStatus( this->GetOwnProxyServerData() );
	}
	else return false;
}

bool CServerTable::ReportServerStatus( LP_SERVER_DATA pToServer )
{
	register char szDummy[16];
	LP_REPORT_SERVER_STATUS_PACKET pAnswerPacket = (LP_REPORT_SERVER_STATUS_PACKET)(szDummy+1);

	szDummy[0] = PTCL_REPORT_SERVER_STATUS;

	pAnswerPacket->dwServerStatus = this->GetServerStatus();
	pAnswerPacket->dwNumOfUsers = this->m_dwNumOfUsers;

	if( !this->Send( pToServer->dwConnectionIndex, szDummy, sizeof(BYTE)+sizeof(REPORT_SERVER_STATUS_PACKET) ) )
	{
		MyLog( LOG_IMPORTANT, "Failed To Answer PTCL_ORDER_TO_REPORT_SERVER_STATUS to %s(%d)", GetTypedServerText(pToServer->dwServerType), pToServer->wPort );
		return false;
	}
	return true;
}

// -----------------------------------------------------------------
// Public Methods
// -----------------------------------------------------------------
void CServerTable::ShowServerStatus()
{

	LP_SERVER_DATA pCur = this->GetServerListHead();
	LP_SERVER_DATA pBefore = NULL;

	DWORD dwCount = 0;
	DWORD dwTurn = 0;

	MyLog( LOG_JUST_DISPLAY, "__________________________________________________________________________________" );
	MyLog( LOG_JUST_DISPLAY, "( )_NotInNetwork________(O)_Activated___________________(-)_InActivated___________" );
	MyLog( LOG_JUST_DISPLAY, "(P)_Awaiting PROXY Conn_(C)_Awaiting ServerList Certify_(1-6)_Being Negotiation___" );



	m_dwNumOfUsersInServerSet = 0;
	while( pCur )
	{
		dwCount++;

		dwTurn = (dwCount % 2);

		if( !dwTurn )
		{
#ifdef __IS_PROXY_SERVER

			MyLog( LOG_JUST_DISPLAY, "[%12s/%15s/%4d/(%c)(%4d)]      [%12s/%15s/%4d/(%c)(%4d)]"
			, GetTypedServerText( pBefore->dwServerType )
			, pBefore->szIP, pBefore->wPort, ServerStatusSymbols[pBefore->dwStatus] , pBefore->dwNumOfUsers 

			, GetTypedServerText( pCur->dwServerType )
			, pCur->szIP, pCur->wPort, ServerStatusSymbols[pCur->dwStatus],				pCur->dwNumOfUsers );
#else 

			MyLog( LOG_JUST_DISPLAY, "[%12s/%15s/%4d/(%c)]      [%12s/%15s/%4d/(%c)]"
			, GetTypedServerText( pBefore->dwServerType )
			, pBefore->szIP, pBefore->wPort, ServerStatusSymbols[pBefore->dwStatus]

			, GetTypedServerText( pCur->dwServerType )
			, pCur->szIP, pCur->wPort, ServerStatusSymbols[pCur->dwStatus]);
#endif
			if( pCur->dwServerType == SERVER_TYPE_AGENT ) m_dwNumOfUsersInServerSet += pCur->dwNumOfUsers ;
			if( pBefore->dwServerType == SERVER_TYPE_AGENT ) m_dwNumOfUsersInServerSet += pBefore->dwNumOfUsers ;
		}

		pBefore = pCur;
		pCur = pCur->pNextServerData;
	}

	if( dwTurn )
	{
#ifdef __IS_PROXY_SERVER
		MyLog( LOG_JUST_DISPLAY, "[%12s/%15s/%4d/(%c)(%4d)]"
		, GetTypedServerText( pBefore->dwServerType ), pBefore->szIP, pBefore->wPort, ServerStatusSymbols[pBefore->dwStatus], pBefore->dwNumOfUsers  );
#else
		MyLog( LOG_JUST_DISPLAY, "[%12s/%15s/%4d/(%c)]"
		, GetTypedServerText( pBefore->dwServerType ), pBefore->szIP, pBefore->wPort, ServerStatusSymbols[pBefore->dwStatus] );
#endif

		if( pBefore->dwServerType == SERVER_TYPE_AGENT ) m_dwNumOfUsersInServerSet += pBefore->dwNumOfUsers ;
	}


#ifdef __IS_PROXY_SERVER
	MyLog( LOG_JUST_DISPLAY, "Total %d Servers are listed(%d Connected)( %d ConcurUsers ).", this->GetNumOfServers(), this->GetNumOfConnectedServers(), m_dwNumOfUsersInServerSet);
#else
	MyLog( LOG_JUST_DISPLAY, "Total %d Servers are listed(%d Connected)", this->GetNumOfServers(), this->GetNumOfConnectedServers()  );
#endif

#ifdef __IS_MAP_SERVER
	// 010322 KHS
	extern char MapName[ MAX_PATH];	
	extern int NPC_COUNT;
	extern int ITEM_COUNT;
	MyLog( LOG_JUST_DISPLAY, "Server Info  [     %s    ] - Users: %d. Items: %d.  NPCs: %d.", MapName, this->GetNumOfUsers(), ITEM_COUNT, NPC_COUNT );
	MyLog( LOG_JUST_DISPLAY, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" );
	                          
#endif 
#ifdef __IS_AGENT_SERVER
	MyLog( LOG_JUST_DISPLAY, "Server Info  AGENT SERVER(%d) - Total (%d) Users are connected.", this->GetOwnServerData()->wPort, this->GetNumOfUsers() );
	MyLog( LOG_JUST_DISPLAY, "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" );

#endif

	return;

}

void CServerTable::SendPackedMsg()
{
	CPackedMsg* pPack = NULL;

	for (DWORD i=0; i < this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT]; i++)
	{
		pPack = this->m_ppPackedTable[i];
		if ( pPack->GetUserNum() )
		{
			this->m_pINet->SendToServer( pPack->GetConnectionIndex(), (char*)pPack, pPack->GetPacketSize(), FLAG_SEND_NOT_ENCRYPTION );
			pPack->Release();
		}
	}
	return;
}

// To set OWN Server Status
void CServerTable::SetServerStatus( DWORD dwStatus )
{
	this->m_pOwnServerData->dwStatus = dwStatus;

	// ServerStatus 변경 알림.
	this->NotifyServerStatus();
	return;
}


// To set OTHER Server Status
void CServerTable::SetServerStatus( LP_SERVER_DATA pServerData, DWORD dwStatus )
{
	pServerData->dwStatus = dwStatus;
	return;
}

// Must be Thread-Safe
void CServerTable::DestroyServer( DWORD dwFinishType )
{
	// PROXY에 알린다.
	char szDummy[1+4];
	szDummy[0] = (BYTE)PTCL_REPORT_SERVER_DESTROY;
	memcpy( szDummy+1, &dwFinishType, sizeof(DWORD) );

	if( this->GetOwnServerData() )
	{
		MyLog( LOG_NORMAL, "** %s Server(%d) Under Destroy Process(by %s)", GetTypedServerText(this->GetOwnServerData()->dwServerType), this->GetOwnServerData()->wPort, GetFinishTypeText(dwFinishType) );
	}
	else
	{
		MyLog( LOG_NORMAL, "** Server Under Destroy Process(Before Read OwnServerData)" );
	}

	if( !this->SendToProxyServer( szDummy, sizeof(BYTE)+sizeof(DWORD) ) )
	{
		MyLog( LOG_NORMAL, "-- Failed To Notify Server Destroy To Proxy" );
	}

#ifdef __IS_MAP_SERVER
	void SaveAllUserDatas(void);

	SaveAllUserDatas();
#endif

	// Must be placed on end of this member function.
	EnterCriticalSection( &this->m_IsRunningCriticalSection );
	m_bIsServerRunning = false;

	// Added by chan78 at 2001/07/16 :: Rise console event.
	// HANDLE hIn : main() 에 선언되어 있습니다.
	// " "        : 간단하게 스페이스를 입력한걸로 합니다.
	// 1          : 한바이트를 씁니다.
	// &dwResult  : Write 한 결과값을 얻어옵니다.
	DWORD dwResult;
	DWORD dwTries = 0;
	do
	{
		if( dwTries )
		{
			// Input buffer 에 Write를 실패한 경우 잠시 대기했다 다시 시도합니다.
			// 단 첫번째 시도인 경우엔 대기하지 않습니다.
			Sleep( 1000 );
		}
		dwTries++;
		WriteConsoleInput( hIn, (INPUT_RECORD *)" ", 1, &dwResult );

		// 무한히 반복할수는 없으므로 다섯번 시도하고 포기합니다.
	} while( (dwResult != 1) && (dwTries <= 5) );

	LeaveCriticalSection( &this->m_IsRunningCriticalSection );
	return;
}

void CServerTable::CheckServerConnections()
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];
	LP_SERVER_DATA pDummyServer;
	DWORD NowTime = GetTickCount();

	// 서버와 연결된 모든 서버의 접속상태를 검사한다.
	for( pDummyServer = this->GetServerListHead(); pDummyServer; pDummyServer = pDummyServer->pNextServerData )
	{
		// 이 패킷을 받은 서버들은 PTCL_SERVER_CONNECTION_OK 로 응답하고,
		// 이 서버는 그 패킷을 받은 시점의 시간을 그 서버의 dwLastCheckAliveTime으로 갱신한다.
		if( pDummyServer->dwConnectionIndex )
		{
			// 일단 접속 확인 패킷을 날린다.
			szDummyMsg[0] = (BYTE)PTCL_SERVER_TRY_TO_CHECK_CONNECTION;
			if( !this->Send( pDummyServer->dwConnectionIndex, szDummyMsg, sizeof(BYTE) ) )
			{
				MyLog( LOG_IMPORTANT, "Failed To Send Check Connection Packet to %s(%d)", GetTypedServerText(pDummyServer->dwServerType), pDummyServer->wPort );
			}

			if( NowTime < pDummyServer->dwLastCheckAliveTime )
			{
				// GetTickCount()값이 리셋되었거나 서버가 시작된 후 처음 체크한 경우.
				continue;
			}
			else
			{
				if( (NowTime - pDummyServer->dwLastCheckAliveTime) > SERVER_CONNECTION_TIME_OUT )
				{
					// Notify It To Proxy
					LP_SERVER_ERROR_PACKET pErrorPacket = (LP_SERVER_ERROR_PACKET)(szDummyMsg+1);
					szDummyMsg[0] = PTCL_REPORT_SERVER_ERROR;

					pErrorPacket->dwErrorCode = ERROR_SERVER_CONNECTION_TIMED_OUT;
					sprintf( pErrorPacket->szError, "%s(%d) Connection Timed Out. Now Try To Purge This Connection", GetTypedServerText(pDummyServer->dwServerType), pDummyServer->wPort );

					if( !SendToProxyServer( szDummyMsg, sizeof(BYTE)+sizeof(DWORD)+strlen(pErrorPacket->szError)+1 ) )
					{
						MyLog( LOG_IMPORTANT, "Failed To Notify Server Connection(%d) Timed Out to PROXY SERVER", pDummyServer->wPort );
					}

					this->m_pINet->CompulsiveDisconnectServer( pDummyServer->dwConnectionIndex );
				}
			}
		}
	}
}

void CServerTable::CloseServerConnection( LP_SERVER_DATA pServerData )
{
	if( !pServerData )
	{
		MyLog( LOG_IMPORTANT, "CloseServerConnection() :: pServerData is NULL!!!" );
		return;
	}
	if( !pServerData->dwConnectionIndex )
	{
		MyLog( LOG_IMPORTANT, "CloseServerConnection() :: pServerData(%d)->dwConnection is 0!!!", pServerData->wPort );
		return;
	}

	this->m_pINet->CompulsiveDisconnectServer( pServerData->dwConnectionIndex );
	return;
}

void CServerTable::CloseServerConnection( WORD wPort )
{
	LP_SERVER_DATA pServerData;

	pServerData = this->GetServerData( wPort );

	this->CloseServerConnection( pServerData );
	return;
}

void CServerTable::ReportOrderedConnectionResult()
{
	LP_AWAITING_CONNECTION_RESULT_DATA pResult = this->GetConnectionResultData();
	LP_SERVER_PORT_LIST_PACKET pConnectedList = (LP_SERVER_PORT_LIST_PACKET)(pResult->szAnswer+1);

	if( !pResult->pSender->dwConnectionIndex )
	{
		MyLog( LOG_IMPORTANT, "Failed To Report 'PTCL_SERVER_CONNECTING_RESULT' :: PROXY(%d) lost connection", pResult->pSender->wPort );
#ifdef __ON_DEBUG
		_asm int 3;
#else
		this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
		return;
	}

	// Answer.
	pResult->szAnswer[0] = PTCL_SERVER_CONNECTING_RESULT;
	if( !this->Send( pResult->pSender->dwConnectionIndex, pResult->szAnswer, (sizeof(BYTE)+sizeof(WORD)+(sizeof(WORD)*pConnectedList->wNum)) ) )
	{
		MyLog( LOG_IMPORTANT, "Failed To Report 'PTCL_SERVER_CONNECTING_RESULT' :: PROXY(%d) / send() has failed", pResult->pSender->wPort );
#ifdef __ON_DEBUG
		_asm int 3;
#else
		this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
		return;
	}


	// DB Demon request
#if defined(__IS_AGENT_SERVER) || defined(__IS_MAP_SERVER)
	if( !this->RequestToSetDBDemon() )
	{
#ifdef __ON_DEBUG
		_asm int 3;
#else
		this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
		return;
	}

	this->SetServerStatus( STATUS_AWAITING_DB_DEMON_SETTING );
#endif

#if defined(__IS_PROXY_SERVER) || defined(__IS_DB_DEMON)
	this->SetServerStatus( STATUS_ACTIVATED );
#endif

	return;
}

bool CServerTable::OnRecvServerUpMsg( DWORD dwConnectionIndex, WORD wPort )
{
	sockaddr_in* pSockAddr;
	LP_SERVER_DATA pServerData;
	char szIP[32+1];

	pSockAddr = this->m_pINet->GetServerAddress( dwConnectionIndex );

	sprintf( szIP, "%d.%d.%d.%d", pSockAddr->sin_addr.S_un.S_un_b.s_b1
	, pSockAddr->sin_addr.S_un.S_un_b.s_b2
		, pSockAddr->sin_addr.S_un.S_un_b.s_b3
		, pSockAddr->sin_addr.S_un.S_un_b.s_b4 );

	pServerData = this->GetServerData( wPort );

	// Modified by chan78 at 2001/02/21, 리스트에 없는 녀석.
	if( !pServerData )
	{
		this->m_pINet->CompulsiveDisconnectServer( dwConnectionIndex );
		return false;
	}

	// IP가 다른 경우, 인정하지 않는다.
	if( strcmp( pServerData->szIP, szIP ) )
	{
		MyLog( LOG_NORMAL, "OnRecvServerUp() :: SERVER(%d) has wrong IP(%s/%s)", wPort, szIP, pServerData->szIP );
		this->m_pINet->CompulsiveDisconnectServer( dwConnectionIndex );
		return false;
	}

	// 치명적인 오류.
	// 이미 접속되어있는 서버가 SERVER_UP 을 한번 더 보냈다. 혹은 더 나쁜 상황. 꼬였다.
	if( pServerData->dwConnectionIndex )
	{
		// 이런건 나오면 안돼~~~~~~ NEVER!!!
#ifdef __ON_DEBUG
//		_asm int 3;
#endif
		MyLog( LOG_FATAL, "OnRecvServerUp() :: SERVER(%d) is Already Connected!!!", wPort );
		this->m_pINet->CompulsiveDisconnectServer( dwConnectionIndex );
		return false;
	}

	// 접속 엔트리에 추가.
	if( !this->AddConnectedServerDataToHashTable( pServerData, dwConnectionIndex ) )
	{
		MyLog( LOG_FATAL, "OnRecvServerUp() :: SERVER(%d) - AddConnectedServerDataToHashTable() has Failed", wPort );
		this->m_pINet->CompulsiveDisconnectServer( dwConnectionIndex );
		return false;
	}

	// 정상적인 Server UP
	MyLog( LOG_FATAL, "New Server Connection... %s(%d/%d)", GetTypedServerText(pServerData->dwServerType), dwConnectionIndex, wPort );

	// 현재 내 Server Status 알림.
	this->NotifyServerStatus( pServerData );

#ifndef __IS_PROXY_SERVER
	// Notify Connection Status Change to Proxy
	this->ReportServerConnectionStatusChange( pServerData, (BYTE)CONNECTION_STATUS_ACCEPTED );
#endif

	return true;
}

bool CServerTable::IsServerRunning()
{
	bool result;
	EnterCriticalSection( &this->m_IsRunningCriticalSection );
	result = m_bIsServerRunning;
	LeaveCriticalSection( &this->m_IsRunningCriticalSection );
	return result;
}

bool CServerTable::OnRecvNegotiationMsgs( LP_SERVER_DATA pSender, BYTE bID, char *pMsg, DWORD dwLength )
{
	WORD i;
	char szDummyMsg[MM_MAX_PACKET_SIZE];

#ifndef __IS_PROXY_SERVER
	// --------------------
	// Sender Must be Proxy
	// --------------------
	if( pSender->dwServerType != SERVER_TYPE_PROXY )
	{
		switch( bID )
		{
		case PTCL_ORDER_DESTROY_SERVER:
		case PTCL_NOTIFY_SERVER_STATUS:
		case PTCL_ORDER_TO_REPORT_SERVER_STATUS:
		case PTCL_SERVER_TRY_TO_CHECK_CONNECTION:
		case PTCL_SERVER_CONNECTION_OK:
			{
				// 예외.
			}
			break;
		default:
			{
				// 패킷 무시
				return false;
			}
		}
	}
#endif

	// ---------------------
	// Process Packets
	// ---------------------
	switch( bID )
	{
	// --------------
	// 모든 서버 공통
	// --------------
	case PTCL_ORDER_DESTROY_SERVER:
		{
			MyLog( LOG_NORMAL, "Server Destroying by PROXY ORDER..." );
			this->SetServerStatus( STATUS_CLOSING );
			this->DestroyServer( FINISH_TYPE_BY_PROXY );
		}
		break;
	case PTCL_NOTIFY_SERVER_STATUS:
		{
			LP_NOTIFY_SERVER_STATUS_PACKET pPacket = (LP_NOTIFY_SERVER_STATUS_PACKET)pMsg;

			//Modified by KBS 020121
			if(pPacket->dwServerStatus == STATUS_RELOAD_GAMESERVER_DATA)
			{
				SetServerStatus( pSender, pPacket->dwServerStatus );
			}
			else if(pPacket->dwServerStatus == STATUS_FINISH_RELOAD_GAMESERVER_DATA)
			{
				SetServerStatus( pSender, STATUS_ACTIVATED );
			}
			else  
				SetServerStatus( pSender, pPacket->dwServerStatus );
			//
		}
		break;
	case PTCL_ORDER_TO_REPORT_SERVER_STATUS:
		{
			if( !this->ReportServerStatus( pSender ) )
			{
				MyLog( LOG_NORMAL, "Failed To Report SERVER STATUS to %s(%d)", GetTypedServerText(pSender->dwServerType), pSender->wPort );
			}
		}
		break;
	case PTCL_SERVER_TRY_TO_CHECK_CONNECTION:
		{
			// ANSWER
			szDummyMsg[0] = (BYTE)PTCL_SERVER_CONNECTION_OK;

			if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, 1 ) )
			{
				MyLog( LOG_IMPORTANT, "Failed To send 'PTCL_SERVER_CONNECTION_OK' to %s(%d)", GetTypedServerText(pSender->dwServerType), pSender->wPort );
			}
		}
		break;
	case PTCL_SERVER_CONNECTION_OK:
		{
			// 시간갱신
			pSender->dwLastCheckAliveTime = GetTickCount();
		}
		break;
	// ---------------------
	// 비 PROXY SERVER 전용 
	// ---------------------
#ifndef __IS_PROXY_SERVER
	// ---------------------
	// SERVER LIST 세팅 패킷
	// ---------------------
	case PTCL_ORDER_SET_SERVER_LIST:
		{
			if( this->GetServerStatus() > STATUS_AWAITING_SERVER_LIST )
			{
				// 받으면 안된다.
				MyLog( LOG_FATAL, "PTCL_ORDER_SET_SERVER_LIST :: PROXY Sent this Packet AGAIN!" );
				this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
			}

			// Server List Accept는 단 한번만 허용한다.
			LP_SERVER_CINFO_LIST_PACKET pServerList = (LP_SERVER_CINFO_LIST_PACKET)pMsg;
			LP_SERVER_CINFO_LIST_PACKET pFailedServerList = (LP_SERVER_CINFO_LIST_PACKET)(szDummyMsg+1);
			LP_SERVER_DATA pDummyServerData = NULL;

			this->m_dwServerSetNumber = pServerList->dwServerSetNumber;
			pFailedServerList->wNum = 0;

			for( i = 0; i < pServerList->wNum; i++ )
			{
				// alloc new server data and add it to list.
				if ( !(pDummyServerData = this->GetNewServerData( pServerList->pServerData[i].szIP, pServerList->pServerData[i].wPort) ) || !this->AddServerDataToList( pDummyServerData ) )
				{
					// failed
					if( pDummyServerData )
					{
						delete pDummyServerData;
						pDummyServerData = NULL;
					}

					// Build Answer Packet
					memcpy( pFailedServerList->pServerData[pFailedServerList->wNum].szIP, pServerList->pServerData[i].szIP, MM_IP_LENGTH );
					pFailedServerList->pServerData[pFailedServerList->wNum].wPort = pServerList->pServerData[i].wPort;

					pFailedServerList->wNum++;
				}
			}

			if( !pFailedServerList->wNum )
			{
// ---------------------------------------------------------------------------------------------
#ifndef __IS_PROXY_SERVER
				// SERVER SIDE Socket을 바인드 한다.(지금부터 다른 서버의 커넥션을 받을 수 있다.
				if( !this->StartServer( TYPE_SERVER_SIDE ) )
				{
					MyLog( LOG_FATAL, "SERVER_SIDE Socket Bind Failed!!!" );
					this->DestroyServer( FINISH_TYPE_BIND_FAILED );
				}
				MyLog( LOG_NORMAL, "SERVER_SIDE Socket Binded." );
#ifdef __IS_AGENT_SERVER
				// USER SIDE Socket 바인드.
				if( !this->StartServer( TYPE_USER_SIDE ) )
				{
					MyLog( LOG_NORMAL, "USER_SIDE Socket Bind Failed!!!" );
					this->DestroyServer( FINISH_TYPE_BIND_FAILED );
				}
				MyLog( LOG_NORMAL, "USER_SIDE Socket Binded" );
#endif
#endif
// ---------------------------------------------------------------------------------------------
				// 성공. 접속할 서버의 리스트를 요구한다.
				szDummyMsg[0] = (BYTE)PTCL_REQUEST_TO_CONNECT_SERVER_LIST;
				if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, 1 ) )
				{
#ifdef __ON_DEBUG
//					_asm int 3;
#endif
				}

				this->SetServerStatus( STATUS_AWAITING_CONNECTION_ORDER );
			}
			else
			{
				// 실패.
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
				// 이 서버는 종료된다.
				MyLog( LOG_FATAL, "CServerTable::OnRecvMsgNegotiationMsgs() - Failed To accept Server List" );
				this->DestroyServer( FINISH_TYPE_SERVER_LIST_ACCEPT_FAIL );
			}
		}
		break;
	// ---------------------
	// 접속 명령 패킷 
	// ---------------------
	case PTCL_ORDER_CONNECT_TO_SERVERS:
		{
			LP_AWAITING_CONNECTION_RESULT_DATA pResult = this->GetConnectionResultData();
			LP_SERVER_PORT_LIST_PACKET pToConnectList = (LP_SERVER_PORT_LIST_PACKET)pMsg;
			LP_SERVER_PORT_LIST_PACKET pConnectedList = (LP_SERVER_PORT_LIST_PACKET)(pResult->szAnswer+1);
			LP_SERVER_DATA pTargetServer;

			// Added by chan78 at 2001/03/16 :: this->m_ConnectionResultData 가 사용중일땐 무시.
			// 이런 상황은 심각하다. 발생해선 안됨.
			if( this->GetConnectionResultData()->dwConnectionType != CONNECT_TYPE_NONE )
			{
				MyLog( LOG_FATAL, "PTCL_ORDER_SET_SERVER_LIST :: this->m_ConnectionResultData is Already Using!!!(%d)", this->GetConnectionResultData()->dwConnectionType );
#ifdef __ON_DEBUG
				_asm int 3;
#else
				this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
			}

			pResult->dwConnectionType = CONNECT_TYPE_BY_PROXY_ORDER;
			pResult->dwToConnectServers = 0;
			pResult->dwResultCheckedServers = 0;
			pResult->pSender = pSender;

			pConnectedList->wNum = 0;

			for( i = 0; i < pToConnectList->wNum; i++ )
			{
				pTargetServer = GetServerData( pToConnectList->wPort[i] );

				if( pTargetServer && pTargetServer->dwConnectionIndex )
				{
					// 이미 접속되어 있는 경우.

					pConnectedList->wPort[pConnectedList->wNum++] = pTargetServer->wPort;
				}
				else 
				{
					if( pTargetServer && this->ConnectToServer( pTargetServer, CONNECT_TYPE_BY_PROXY_ORDER ) )
					{
						// 시도는 성공...
						// 결과 처리는 콜백함수에서.
						pResult->dwToConnectServers++;
					}
					else
					{
						if( !pTargetServer )
						{
							MyLog( LOG_FATAL, "PTCL_ORDER_CONNECT_TO_SERVERS :: pTargetServer is NULL!!!(port:%d)", pTargetServer->wPort );
						}
						else
						{
							MyLog( LOG_FATAL, "INETWORK::ConnectToServer() returned NULL!!!(port:%d)", pTargetServer->wPort );
							this->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
						}
					}
				}
			}

			// 접속 결과를 기다릴 서버가 없는 경우.
			if( pResult->dwToConnectServers == 0 )
			{
				this->ReportOrderedConnectionResult();
			}
		}
		break;
	// ------------------
	// DB Demon 배정 패킷
	// ------------------
	case PTCL_ORDER_SET_DB_DEMON:
		{
			WORD wDBDemonPort = *(WORD*)pMsg;
			LP_SET_DB_DEMON_RESULT_PACKET pPacket = (LP_SET_DB_DEMON_RESULT_PACKET)(szDummyMsg+1);

			szDummyMsg[0] = PTCL_DB_DEMON_SETTING_RESULT;

			LP_SERVER_DATA pDBDemon;

			if( pDBDemon = GetServerData( wDBDemonPort ) )
			{
				if( pDBDemon->dwConnectionIndex )
				{
					// 세팅
					this->m_pOwnDBDemonData = pDBDemon;

					// 성공 알림.
					pPacket->dwResult = RESULT_DB_DEMON_SETTING_SUCCESSED;
					this->SetServerStatus( STATUS_ACTIVATED );
				}
				else
				{
					pPacket->dwResult = RESULT_DB_DEMON_IS_NOT_CONNECTED;
					// 재요청.
					this->RequestToSetDBDemon();
				}
			}
			else
			{
				pPacket->dwResult = RESULT_DB_DEMON_IS_NOT_IN_LIST;
			}

			szDummyMsg[0] = (BYTE)PTCL_DB_DEMON_SETTING_RESULT;
			if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, (sizeof(BYTE)+sizeof(SET_DB_DEMON_RESULT_PACKET))) )
			{
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
				this->SetServerStatus( STATUS_AWAITING_DB_DEMON_SETTING );
			}
		}
		break;
	// ---------------
	// 서버리스트 보고
	// ---------------
	case PTCL_ORDER_TO_REPORT_SERVER_DATAS:
		{
			LP_SERVER_CINFO_LIST_PACKET pPacket = (LP_SERVER_CINFO_LIST_PACKET)(szDummyMsg+1);
			LP_SERVER_CINFO pCInfo = NULL;
			LP_SERVER_DATA pDummyServerData = NULL;

			pPacket->dwServerSetNumber = this->m_dwServerSetNumber;
			pPacket->wNum = 0;

			for( pDummyServerData = this->GetServerListHead(); pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
			{
				// Own Proxy는 제외.
				if( pDummyServerData == pSender )
					continue;

				memcpy( pPacket->pServerData[pPacket->wNum].szIP, pDummyServerData->szIP, MM_IP_LENGTH );
				pPacket->pServerData[pPacket->wNum].wPort = pDummyServerData->wPort;
				pPacket->pServerData[pPacket->wNum].bConnected = (pDummyServerData->dwConnectionIndex?true:false);

				pPacket->wNum++;
			}

			szDummyMsg[0] = (BYTE)PTCL_REPORT_SERVER_DATAS;

			// Send it
			if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, sizeof(BYTE)+sizeof(WORD)+(sizeof(SERVER_CINFO)*pPacket->wNum) ) )
			{
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
			}
		}
		break;
	// ------------------
	// 인증확인 패킷 처리
	// ------------------
	case PTCL_NOTIFY_YOU_ARE_CERTIFIED:
		{
			// Proxy Is Activated
			this->SetServerStatus( pSender, STATUS_ACTIVATED );

			// 접속할 서버의 목록을 요구한다.
			szDummyMsg[0] = (BYTE)PTCL_REQUEST_TO_CONNECT_SERVER_LIST;

			if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, (sizeof(BYTE))) )
			{
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
			}
		}
		break;
#endif
// ----------------------------------------------------------------------------
// PROXY 전용 Packet들
// ----------------------------------------------------------------------------
#ifdef __IS_PROXY_SERVER
	// -----------------------------------
	// SERVER LIST 배정 패킷 요청을 처리함
	// -----------------------------------
	case PTCL_REQUEST_SET_SERVER_LIST:
		{
			LP_SERVER_CINFO_LIST_PACKET pPacket = (LP_SERVER_CINFO_LIST_PACKET)(szDummyMsg + 1);
			LP_SERVER_DATA pDummyServer;

			pPacket->dwServerSetNumber = this->m_dwServerSetNumber;
			pPacket->wNum = 0;
			for( pDummyServer = this->GetServerListHead(); pDummyServer; pDummyServer = pDummyServer->pNextServerData )
			{
				// 전송자의 정보는 배정하지 않는다.
				if( pDummyServer->wPort == pSender->wPort )
					continue;

				memcpy( pPacket->pServerData[pPacket->wNum].szIP, pDummyServer->szIP, MM_IP_LENGTH );
				pPacket->pServerData[pPacket->wNum].wPort = pDummyServer->wPort;
				pPacket->wNum++;

				this->SetServerConnectionStatus( pSender, pDummyServer, (BYTE)CONNECTION_STATUS_NOT_CONNECTED );
			}

			szDummyMsg[0] = (BYTE)PTCL_ORDER_SET_SERVER_LIST;

			// Send it
			if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, sizeof(BYTE)+sizeof(WORD)+(sizeof(SERVER_CINFO_LIST_PACKET)*pPacket->wNum) ) )
			{
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
				return true;
			}
			// Change Sender Status
			this->SetServerStatus( pSender, STATUS_AWAITING_SET_SERVER_LIST_RESULT );
		}
		break;
	// ------------------------------------------
	// 접속할 서버의 목록 배정 패킷 요청을 처리함
	// ------------------------------------------
	case PTCL_REQUEST_TO_CONNECT_SERVER_LIST:
		{
			LP_SERVER_PORT_LIST_PACKET pPacket = (LP_SERVER_PORT_LIST_PACKET)(szDummyMsg + 1);
			LP_SERVER_DATA pDummyServer;

			pPacket->wNum = 0;
			for( pDummyServer = this->GetServerListHead(); pDummyServer; pDummyServer = pDummyServer->pNextServerData )
			{
				// 전송자의 정보는 배정하지 않는다.
				if( pDummyServer->wPort == pSender->wPort )
					continue;

				if( pDummyServer->dwConnectionIndex )
					if( (pDummyServer->dwStatus > STATUS_AWAITING_SERVER_LIST) && (pDummyServer->dwStatus < STATUS_CLOSING ) )
					{
						pPacket->wPort[pPacket->wNum++] = pDummyServer->wPort;
						this->SetServerConnectionStatus( pSender, pDummyServer, (BYTE)CONNECTION_STATUS_TRYING_TO_CONNECT );
					}
			}
			MyLog( LOG_DEBUG, "%s(%d) 에게 %d개의 서버에 접속하도록 배정함", GetTypedServerText(pSender->dwServerType), pSender->wPort, pPacket->wNum );

			// 보낸다
			szDummyMsg[0] = (BYTE)PTCL_ORDER_CONNECT_TO_SERVERS;
			if( !this->Send( pSender->dwConnectionIndex, szDummyMsg, sizeof(BYTE)+sizeof(WORD)+(sizeof(WORD)*pPacket->wNum) ) )
			{
				// 실패.
#ifdef __ON_DEBUG
//				_asm int 3;

#endif
				MyLog( LOG_IGNORE, "Failed To Send PTCL_ORDER_CONNECT_SERVERS For %s(%d)", GetTypedServerText( pSender->dwServerType ), pSender->wPort );
				return true;
			}
			// Change Sender Status
			this->SetServerStatus( pSender, STATUS_AWAITING_CONNECTION_RESULT );
		}
		break;
	// -----------------------------------
	// 접속결과 패킷을 받아 처리.
	// -----------------------------------
	case PTCL_SERVER_CONNECTING_RESULT:
		{
			LP_SERVER_PORT_LIST_PACKET pToConnectList = (LP_SERVER_PORT_LIST_PACKET)pMsg;
			LP_SERVER_DATA pTargetServer;

			for( DWORD i = 0; i< pToConnectList->wNum; i++ )
			{
				pTargetServer = this->GetServerData( pToConnectList->wPort[i] );

				if( !pTargetServer )
				{
#ifdef __ON_DEBUG
//					_asm int 3;
#endif
					continue;
				}
				this->SetServerConnectionStatus( pSender, pTargetServer, (BYTE)CONNECTION_STATUS_CONNECTED );
			}

			// Change Sender Status
			if( pSender->dwServerType == SERVER_TYPE_AGENT || pSender->dwServerType == SERVER_TYPE_MAP )
			{
				this->SetServerStatus( pSender, STATUS_AWAITING_DB_DEMON_SETTING );
			}
			else
			{
				this->SetServerStatus( pSender, STATUS_ACTIVATED );

				if( pSender->dwServerType == SERVER_TYPE_DB )
				{
					LP_SERVER_DATA pDummyServer;
					for( pDummyServer = this->GetServerListHead(); pDummyServer; pDummyServer = pDummyServer->pNextServerData )
					{
						if( pDummyServer->dwConnectionIndex && (pDummyServer->dwStatus == STATUS_AWAITING_DB_DEMON_SETTING) )
						{
							if( this->SetDBDemon( pDummyServer, pSender ) == false )
							{
								MyLog( LOG_IMPORTANT, "Failed To Set DB Demon To %s Server(%d)", GetTypedServerText( pDummyServer->dwServerType ), pDummyServer->wPort );
							}
							else
							{
								this->SetServerStatus( pDummyServer, STATUS_AWAITING_SET_DB_DEMON_RESULT );
							}
						}
					}
				}
			}
		}
		break;
	// -----------------------------------
	// DB DEMON 배정 패킷 요청을 처리함
	// -----------------------------------
	case PTCL_REQUEST_SET_DB_DEMON:
		{
			if( this->SetDBDemon( pSender ) == false )
			{
				MyLog( LOG_IMPORTANT, "Failed To Set DB Demon To %s Server(%d)", GetTypedServerText( pSender->dwServerType ), pSender->wPort );
				this->SetServerStatus( pSender, STATUS_AWAITING_DB_DEMON_SETTING );
			}
			else
			{
				this->SetServerStatus( pSender, STATUS_AWAITING_SET_DB_DEMON_RESULT );
			}
		}
		break;
	// -----------------------------------
	// DB DEMON 배정 결과 패킷을 처리함
	// -----------------------------------
	case PTCL_DB_DEMON_SETTING_RESULT:
		{
			LP_SET_DB_DEMON_RESULT_PACKET pResultPacket = (LP_SET_DB_DEMON_RESULT_PACKET)pMsg;
			
			switch( pResultPacket->dwResult )
			{
			case RESULT_DB_DEMON_SETTING_SUCCESSED:
				{
					this->SetServerStatus( pSender, STATUS_ACTIVATED );
					return true;
				}
				break;
			case RESULT_DB_DEMON_IS_NOT_ACTIVATED:
				{
					MyLog( LOG_IMPORTANT, "PTCL_DB_DEMON_SETTING_RESULT(RESULT_DB_DEMON_IS_NOT_ACTIVATED) from %s(%d)", GetTypedServerText(pSender->dwServerType), pSender->wPort );
				}
				break;
			case RESULT_DB_DEMON_IS_NOT_CONNECTED:
				{
					MyLog( LOG_IMPORTANT, "PTCL_DB_DEMON_SETTING_RESULT(RESULT_DB_DEMON_IS_NOT_CONNECTED) from %s(%d)", GetTypedServerText(pSender->dwServerType), pSender->wPort );
				}
				break;
			case RESULT_DB_DEMON_IS_NOT_IN_LIST:
				{
					MyLog( LOG_IMPORTANT, "PTCL_DB_DEMON_SETTING_RESULT(RESULT_DB_DEMON_IS_NOT_IN_LIST) from %s(%d)", GetTypedServerText(pSender->dwServerType), pSender->wPort );
				}
				break;
			default:
				{
					MyLog( LOG_IMPORTANT, "PTCL_DB_DEMON_SETTING_RESULT:: from %s(%d) has Wrong dwResult(%d)!!!", GetTypedServerText(pSender->dwServerType), pSender->wPort, pResultPacket->dwResult );
				}
				break;
			}
			this->SetServerStatus( pSender, STATUS_AWAITING_DB_DEMON_SETTING );
			return true;
		}
		break;
	// -------------------------------
	// PROXY SERVER 의 정보수집
	// -------------------------------
	case PTCL_REPORT_SERVER_DATAS:
		{
			LP_SERVER_CINFO_LIST_PACKET pPacket = (LP_SERVER_CINFO_LIST_PACKET)pMsg;
			LP_SERVER_DATA pDummyServerData = NULL;

			if( pPacket->dwServerSetNumber != this->m_dwServerSetNumber )
			{
				// Server Set Number가 맞지 않으면 인정하지 않는다.
				goto ServerDatasAreDiffrent;
			}

			if( pPacket->wNum != (this->m_dwNumOfServers-2) )	// 자기자신, pSender제외.
			{
				// 수가 안맞으면 더 볼것도 없다.
				goto ServerDatasAreDiffrent;
			}

			for( i = 0; i < pPacket->wNum; i++ )
			{
				// 현재 PROXY 인 경우 Continue;
				if( pPacket->pServerData[i].wPort == this->GetOwnServerData()->wPort )
					continue;

				pDummyServerData = this->GetServerData( pPacket->pServerData[i].wPort );

				if( !pDummyServerData )
					break;

				if( strcmp(pDummyServerData->szIP, pPacket->pServerData[i].szIP) )
					break;

				if( pPacket->pServerData[i].bConnected )
				{
					this->SetServerConnectionStatus( pSender, pDummyServerData, (BYTE)CONNECTION_STATUS_CONNECTED_BETWEEN );
				}
				else
				{
					this->SetServerConnectionStatus( pSender, pDummyServerData, (BYTE)CONNECTION_STATUS_NOT_CONNECTED );
				}
			}

			if( i != (pPacket->wNum-1) )
			{
				// Not Vertified.

ServerDatasAreDiffrent:
				// 일치하지 않으면 그 서버를 강제로 종료시킨다.
				this->DestroyOtherServer(pSender);

				return true;
			}
			this->SetServerStatus( pSender, STATUS_SERVER_LIST_CERTIFIED );

			// 현재 떠있는 모든 서버의 데이터 검증이 끝났는지 확인 후 PROXY를 동작시킨다.
			DWORD dwNumOfCertifiedServer = 0;
			for( pDummyServerData = this->GetServerListHead(); pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
			{
				if( pDummyServerData->dwConnectionIndex )
				{
					if( pDummyServerData->dwStatus == STATUS_SERVER_LIST_CERTIFIED )
						dwNumOfCertifiedServer++;
				}
			}

			// 모든 서버가 인증되었다.
			if( dwNumOfCertifiedServer == this->m_dwNumOfConnectedServers )
			{
				szDummyMsg[0] = (BYTE)PTCL_NOTIFY_YOU_ARE_CERTIFIED;

				for( pDummyServerData = this->GetServerListHead(); pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
				{
					if( pDummyServerData->dwConnectionIndex )
					{
						if( !this->Send( pDummyServerData->dwConnectionIndex, szDummyMsg, 1 ) )
						{
#ifdef __ON_DEBUG
//							_asm int 3;
#endif
						}
					}
				}
			}
		}
	// ------------------
	// 서버종료 알림 패킷
	// ------------------
		break;
	case PTCL_REPORT_SERVER_DESTROY:
		{
			DWORD dwFinishType = *((DWORD *)pMsg);

			MyLog( LOG_NORMAL, "%s(%d) Reported DESTROY(by %s)", GetTypedServerText(pSender->dwServerType), pSender->wPort, GetFinishTypeText(dwFinishType) );
		}
		break;
	// ------------------
	// 서버상태 보고 패킷
	// ------------------
	case PTCL_REPORT_SERVER_STATUS:
		// 서버 상태(STATUS, 사용자 수) 보고 패킷.
		{
			LP_REPORT_SERVER_STATUS_PACKET pPacket = (LP_REPORT_SERVER_STATUS_PACKET)pMsg;

			// 시간 갱신.
			pSender->dwLastCheckAliveTime = GetTickCount();

			// Status...
			this->SetServerStatus( pSender, pPacket->dwServerStatus );

			// 사용자 수..
			pSender->dwNumOfUsers = pPacket->dwNumOfUsers;
		}
		break;
	// ----------------------------
	// 서버간 접속상태 알림 패킷.
	// ----------------------------
	case PTCL_REPORT_SERVER_CONNECTION_STATUS_CHANGE:
		{
			LP_REPORT_SERVER_CONNECTION_STATUS_PACKET pPacket = (LP_REPORT_SERVER_CONNECTION_STATUS_PACKET)pMsg;
			LP_SERVER_DATA pServerData = this->GetServerData( pPacket->wPort );

			this->SetServerConnectionStatus( pSender, pServerData, pPacket->bConnectionType );
		}
		break;
// ----------------------------
// #endif for __IS_PROXY_SERVER
// ----------------------------
#endif

	default:
		{
#ifdef __ON_DEBUG
//			_asm int 3;
#endif
		return false;
		}
		break;
	}

	return true;
}

bool CServerTable::OnRecvDestroyServerMsg( LP_SERVER_DATA pSender, BYTE bID, char *pMsg, DWORD dwLength )
{
	if( (pSender == this->m_pOwnProxyServerData[0]) || (pSender == this->m_pOwnProxyServerData[0]) )
	{
		this->DestroyServer( (DWORD)FINISH_TYPE_BY_PROXY );
		return true;
	}
	return false;
}

bool CServerTable::ReportServerConnectionStatusChange( LP_SERVER_DATA pServerData, BYTE bConnectionStatus )
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];

	LP_REPORT_SERVER_CONNECTION_STATUS_PACKET pPacket = (LP_REPORT_SERVER_CONNECTION_STATUS_PACKET)(szDummyMsg+1);
	szDummyMsg[0] = PTCL_REPORT_SERVER_CONNECTION_STATUS_CHANGE;

	pPacket->bConnectionType = bConnectionStatus;
	pPacket->wPort = pServerData->wPort;
	if( !this->SendToProxyServer( szDummyMsg, sizeof(BYTE)+sizeof(REPORT_SERVER_CONNECTION_STATUS_PACKET) ) )
	{
		MyLog( LOG_IGNORE, "ReportServerConnectionStatusChange() :: Failed To Notify it To PROXY" );
		return false;
	}

	return true;
}

bool CServerTable::RemoveConnectedServerDataFromHashTable( DWORD dwConnectionIndex )
{
	LP_SERVER_DATA pServerData;
	LP_HASHED_SERVER_DATA pHashedServerData;

	pServerData = GetConnectedServerData( dwConnectionIndex );
	if ( !pServerData || !pServerData->pHashedServerData )
	{
		return false;
	}
	pHashedServerData = pServerData->pHashedServerData;

	// ------------ For DEBUGGING by chan78 (SHOULD BE DELETED)
	LP_HASHED_SERVER_DATA pTest;
	DWORD dwCount = 0;
	for( WORD bb = 0; bb < this->m_wMaxBucketNum; bb++ )
	{
		pTest = this->m_ppServerTable[bb];
		while( pTest )
		{
			ASSERT(pTest);
			dwCount++;
//			if( this->m_ppServerTable[pTest->wPosInHashTable] == NULL )
//				_asm int 3;
			pTest = pTest->pNextHashedServerData;
		}
		
	}
//	if( g_pServerTable->GetNumOfConnectedServers() != dwCount )
//		_asm int 3;
	// ------------


#if defined(__IS_AGENT_SERVER) || defined(__IS_MAP_SERVER)
	// 내게 배정된 DB Demon이면.
	if( pServerData == this->m_pOwnDBDemonData )
	{
		SetServerStatus( STATUS_AWAITING_DB_DEMON_SETTING );
		MyLog( LOG_IMPORTANT, "SERVER Lost given DB DEMON Connection(%d/%d)", pServerData->dwConnectionIndex, pServerData->wPort );

		// Clear DB Demon Pointer.
		this->m_pOwnDBDemonData = NULL;

		this->RequestToSetDBDemon();
	}
#endif

#ifdef __IS_PROXY_SERVER
	if( pServerData->dwServerType == SERVER_TYPE_DB )
	{
		// DB의 경우 이 서버에 배정된 모든 서버들의 DB 배정 상태를 바꾼다.
		LP_SERVER_DATA pDummyToReset = NULL;
		for( WORD i = 0; i< MAX_SERVER_NUM; i++ )
		{
			pDummyToReset = pServerData->ppUsingServers[i];
			if( pDummyToReset )
			{
				pDummyToReset->pUsingDBDemon = NULL;

				// Modified by chan78 at 2001/02/21
				if( pDummyToReset->dwConnectionIndex && ((pDummyToReset->dwStatus > STATUS_AWAITING_DB_DEMON_SETTING) && (pDummyToReset->dwStatus <= STATUS_ACTIVATED)) )
				{
					this->SetServerStatus( pDummyToReset, STATUS_AWAITING_DB_DEMON_SETTING );
				}
				pDummyToReset = NULL;
			}
		}
	}
	else
	{
		// 기타 서버의 경우 배정된 DB Demon의 리스트로부터 제거한다.
		if( pServerData->pUsingDBDemon )
		{
			LP_SERVER_DATA pDummyToReset = NULL;
			for( WORD i = 0; i< MAX_SERVER_NUM; i++ )
			{
				if( pServerData->pUsingDBDemon->ppUsingServers[i] == pServerData )
				{
					pServerData->pUsingDBDemon->ppUsingServers[i] = NULL;
					break;
				}
			}
		}
		// Modified by chan78 at 2001/02/21
		pServerData->pUsingDBDemon = NULL;
	}
#endif

	// Notify Connection Status Change to Proxy
#ifndef __IS_PROXY_SERVER
	this->ReportServerConnectionStatusChange( pServerData, (BYTE)CONNECTION_STATUS_NOT_CONNECTED );
#endif

#ifdef __IS_PROXY_SERVER
	LP_SERVER_DATA pDummyServer;
	for( pDummyServer = this->GetServerListHead(); pDummyServer; pDummyServer = pDummyServer->pNextServerData )
	{
		if( pDummyServer == pServerData ) continue;

		this->SetServerConnectionStatus( pServerData, pDummyServer, (BYTE)CONNECTION_STATUS_NOT_CONNECTED );
		this->SetServerConnectionStatus( pDummyServer, pServerData, (BYTE)CONNECTION_STATUS_NOT_CONNECTED );
	}
	
	// Added by chan78 at 2001/02/22 :: 사용자수 클리어.
	pServerData->dwNumOfUsers = 0;

#endif

	// Processes for Typed Servers Disconnect
	this->OnDisconnectTypedServer( pServerData );

	this->m_dwNumOfConnectedServers--;
	this->m_dwNumOfTypedServers[pServerData->dwServerType]--;

	pServerData->dwConnectionIndex = 0;
	SetServerStatus( pServerData, STATUS_NOT_IN_NETWORK );

	MyLog( LOG_NORMAL, "%s(%d/%d) Has Lost Connection.", GetTypedServerText(pServerData->dwServerType), dwConnectionIndex, pServerData->wPort );

	// Unlink
	if( pHashedServerData->pPrevHashedServerData && pHashedServerData->pNextHashedServerData )
	{
		pHashedServerData->pPrevHashedServerData->pNextHashedServerData = pHashedServerData->pNextHashedServerData;
		pHashedServerData->pNextHashedServerData->pPrevHashedServerData = pHashedServerData->pPrevHashedServerData;
	}
	else if( pHashedServerData->pPrevHashedServerData && !pHashedServerData->pNextHashedServerData )
	{
		pHashedServerData->pPrevHashedServerData->pNextHashedServerData = NULL;
	}
	else if( !pHashedServerData->pPrevHashedServerData && pHashedServerData->pNextHashedServerData )
	{
		this->m_ppServerTable[pHashedServerData->wPosInHashTable] = pHashedServerData->pNextHashedServerData;
		pHashedServerData->pNextHashedServerData->pPrevHashedServerData = NULL;
	}
	else if( !pHashedServerData->pPrevHashedServerData && !pHashedServerData->pNextHashedServerData )
	{
		this->m_ppServerTable[pHashedServerData->wPosInHashTable] = NULL;
	}

	delete pHashedServerData;
	pHashedServerData = NULL;

	return true;
}

bool CServerTable::AddServerDataToList( LP_SERVER_DATA pServerData )
{
	if ( !this->m_pServerListHead )
	{
		this->m_pServerListHead = pServerData;
		this->m_pServerListHead->pNextServerData = NULL;
		this->m_pServerListTail = this->m_pServerListHead;
	} 
	else 
	{
		pServerData->pNextServerData = NULL;
		this->m_pServerListTail->pNextServerData = pServerData;
		this->m_pServerListTail = pServerData;
	}
	return true;
}

bool CServerTable::AddConnectedServerDataToHashTable( LP_SERVER_DATA pServerData, DWORD dwConnectionIndex )
{
	LP_HASHED_SERVER_DATA pHashedServerData;
	LP_HASHED_SERVER_DATA pHashedServerPrv;
	WORD wIndex;

	pServerData->dwConnectionIndex = dwConnectionIndex;

	// Get Position in Hashtable and get it's own pointer
	wIndex = (WORD)(pServerData->wPort % this->m_wMaxBucketNum);

	// Get a new HASHED_SERVER_DATA
	pHashedServerData = new HASHED_SERVER_DATA;
	memset( pHashedServerData, 0, sizeof( HASHED_SERVER_DATA ) );

	// Fill Datas
	pHashedServerData->wPosInHashTable = wIndex;
	pHashedServerData->pServerData = pServerData;

	// Add It to Linked List;
	pHashedServerPrv = this->m_ppServerTable[wIndex];
	if( pHashedServerPrv )
	{
		pHashedServerPrv->pPrevHashedServerData = pHashedServerData;
		pHashedServerData->pNextHashedServerData = pHashedServerPrv;
	}
	this->m_ppServerTable[wIndex] = pHashedServerData;
	pServerData->pHashedServerData = pHashedServerData;

	// Processes for Typed Servers OnConnect
	this->OnConnectTypedServer( pServerData );

	this->m_dwNumOfConnectedServers++;
	this->m_dwNumOfTypedServers[pServerData->dwServerType]++;

	return true;
}

bool CServerTable::ConnectToServer( LP_SERVER_DATA pServerData, DWORD dwConnectType )
{
	if( !this->m_pINet->ConnectToServerWithServerSide( pServerData->szIP, pServerData->wPort, OnConnectServerSuccess, OnFailedToConnectServer, (void *)pServerData ) )
	{
		// 실패한 경우!?
		return false;
	}

	// 성공
	this->SetServerStatus( pServerData, STATUS_TRYING_TO_CONNECT );
	pServerData->dwConnectType = dwConnectType;

	return true;
}

bool CServerTable::ConnectToServer( WORD wServerID, DWORD dwConnectType )
{
	LP_SERVER_DATA pServerData = this->GetServerData( wServerID );
	return this->ConnectToServer( pServerData, dwConnectType );
}

bool CServerTable::StartServer( DWORD dwType )
{
	switch( dwType )
	{
	case TYPE_SERVER_SIDE:
		{
			if ( !(this->m_pINet->StartServerWithServerSide( m_pOwnServerData->szIP, m_pOwnServerData->wPort)) ) // 서버 가동
				return false;
		}
		break;
	case TYPE_USER_SIDE:
		{
			switch( m_pOwnServerData->dwServerType )
			{
			case SERVER_TYPE_AGENT:
			case SERVER_TYPE_PROXY:
				{
					if ( !(this->m_pINet->StartServerWithUserSide( m_pOwnServerData->szIPForUser, m_pOwnServerData->wPortForUser)) )
						return false;
				}
				break;
			case SERVER_TYPE_MAP:
			case SERVER_TYPE_DB:
				{
					return false;
				}
				break;
			default:
				{
					return false;
				}
			}
		}
		break;
	default:
		{
			return false;
		}
		break;
	}
	return true;
}

bool CServerTable::ConnectToProxyServer()
{
	LP_AWAITING_CONNECTION_RESULT_DATA pResult = this->GetConnectionResultData();
	LP_SERVER_PORT_LIST_PACKET pConnectedList = (LP_SERVER_PORT_LIST_PACKET)(pResult->szAnswer+1);

	DWORD dwCount = 0;
	char szSendMsg[32];
	LP_SERVER_DATA pServerData;

	// Clear pResult & pConnectedList
	pResult->dwConnectionType = CONNECT_TYPE_WITH_PROXY;
	pResult->dwResultCheckedServers = 0;
	pResult->dwToConnectServers = 0;
	pResult->pSender = NULL;
	pConnectedList->wNum = 0;

	for( DWORD dwDummy = PRIMARY_SERVER; dwDummy <= SECONDARY_SERVER; dwDummy++ )
	{
		pServerData = this->m_pOwnProxyServerData[dwDummy];

		if( !pServerData )
			continue;

		if( !pServerData->wPort )
			continue;

		// Already Connected
		if( pServerData->dwConnectionIndex )
		{
			dwCount++;
			continue;
		}

		// Connect...
		if( this->m_pINet->ConnectToServerWithServerSide( pServerData->szIP, pServerData->wPort, OnConnectServerSuccess, OnFailedToConnectServer, (void *)pServerData ) )
		{
			this->SetServerStatus( pServerData, STATUS_TRYING_TO_CONNECT );
			pServerData->dwConnectType = CONNECT_TYPE_WITH_PROXY;
			pResult->dwToConnectServers++;
			dwCount++;
		}

	}

	// 성공? 실패?
	if( dwCount )
	{
		return true;
	}
	else
	{
		return false;
	}
}

bool CServerTable::BeginNegotiationWithProxyServer( LP_SERVER_DATA pServerData )
{
	char szSendMsg[32];

	// Proxy Server 는 접속만 되면 늘 이용할 수 있는 상태로 가정한다.
	this->SetServerStatus( pServerData, STATUS_ACTIVATED );

	// PTCL_NOTIFY_SERVER_UP 패킷을 만든다.
	szSendMsg[0] = (BYTE)PTCL_NOTIFY_SERVER_UP;
	memcpy( szSendMsg+1, &this->GetOwnServerData()->wPort, 2 );

	// PTCL_NOTIFY_SERVER_UP 패킷을 전송한다.
	if( !this->Send( pServerData->dwConnectionIndex, szSendMsg, 3 ) )
	{
		this->SetServerStatus( pServerData, STATUS_INACTIVATED );

		this->m_pINet->CompulsiveDisconnectServer( pServerData->dwConnectionIndex );
		return false;
	}

	// PTCL_REQUEST_SET_SERVER_LIST 패킷을 만든다.
	szSendMsg[0] = (BYTE)PTCL_REQUEST_SET_SERVER_LIST;

	// PTCL_REQUEST_SET_SERVER_LIST 패킷을 전송한다.
	if( !this->Send( pServerData->dwConnectionIndex, szSendMsg, 1 ) )
	{
		this->SetServerStatus( pServerData, STATUS_INACTIVATED );

		this->m_pINet->CompulsiveDisconnectServer( pServerData->dwConnectionIndex );
		return false;
	}

	// 여기까지 성공하면 일단 접속이 정상적으로 이루어진것으로 본다.
	// 내 상태를 서버리스트 배정 대기상태로 바꾼다.
	this->SetServerStatus( STATUS_AWAITING_SERVER_LIST );

	return true;
}

bool CServerTable::BeginNegotiationWithNormalServer( LP_SERVER_DATA pServerData )
{
	char szSendMsg[32];

	// PTCL_NOTIFY_SERVER_UP 만들기.
	szSendMsg[0] = (BYTE)PTCL_NOTIFY_SERVER_UP;
	memcpy( szSendMsg+1, &this->GetOwnServerData()->wPort, 2 );

	// PTCL_NOTIFY_SERVER_UP 전송.
	if( !this->Send( pServerData->dwConnectionIndex, szSendMsg, 3 ) )
	{
		MyLog( LOG_IMPORTANT, "ConnectToServer() :: Failed To Send PTCL_NOTIFY_SERVER_UP to %s(%d)", GetTypedServerText(pServerData->dwServerType), pServerData->wPort);

		this->SetServerStatus( pServerData, STATUS_INACTIVATED );
		this->m_pINet->CompulsiveDisconnectServer( pServerData->dwConnectionIndex );
		return false;
	}

	// Server Status 알림.
	if( !this->NotifyServerStatus( pServerData ) )
	{
		MyLog( LOG_IMPORTANT, "ConnectToServer() :: Failed to Notify Server Status to %s(%d)", GetTypedServerText(pServerData->dwServerType), pServerData->wPort );

		this->SetServerStatus( pServerData, STATUS_INACTIVATED );
		this->m_pINet->CompulsiveDisconnectServer( pServerData->dwConnectionIndex );
		return false;
	}

	return true;
}

bool CServerTable::InitServerTable( char *sFileName )
{
	LP_SERVER_DATA pServerData = NULL;
	char	sDummyIP[MM_IP_LENGTH];
	char	sDummyExternalIP[MM_IP_LENGTH];
	DWORD	i;
	WORD	wDummyPort;
	WORD	wDummyExternalPort;

	// 기본 Server정보 (Own Server, Proxy Server)를 읽는다.
	char keyname_list[8][80+1] = {
		"own_server_ip_for_server",			// 0
		"own_server_port_for_server",
		"own_server_ip_for_user",
		"own_server_port_for_user",
		"primary_proxy_server_ip",
		"primary_proxy_server_port",
		"secondary_proxy_server_ip",
		"secondary_proxy_server_port"		// 7
	};

#ifdef __IS_PROXY_SERVER
	DWORD num_of_dr_servers;

	char base_keyname[4][80+1] = {
		"external_server_ip",
		"external_server_port",
		"external_server_ip_for_user",
		"external_server_port_for_user"
	};

	// Read ServerSetInfo
	this->m_dwServerSetNumber = (DWORD)GetPrivateProfileInt( "server_set_info", "own_server_set_number", 0, sFileName );
	if( m_dwServerSetNumber == 0 )
	{
		MyLog( LOG_FATAL, "INI Read Fail('own_server_set_number') is 0 (Might be Read Fail)" );
		this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
		return false;
	}
	// 2001.2.28 added by slowboat
	// read max user define at INI file
	this->m_dwMaxUserNumPerSec = (DWORD)GetPrivateProfileInt( "server_set_info", "default_max_user_can_login_per_sec", 0, sFileName );
	this->m_dwMaxUserNum = (DWORD)GetPrivateProfileInt( "server_set_info", "default_max_user_can_login", 0, sFileName );
	// Read NumOfDrServers
	num_of_dr_servers = (DWORD)GetPrivateProfileInt( "external_server_info", "num_of_external_servers", 0, sFileName );
	if( num_of_dr_servers == 0 )
	{
		MyLog( LOG_FATAL, "INI Read Fail(%s) : On Reading [num_of_external_servers]", sFileName );
		this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
		return false;
	}

#endif

	for( i = 0; i < 8; i+=2 )			// attention. not ++, +=2
	{

#ifdef __IS_PROXY_SERVER
		if( i >= 4 )
			break;
#endif

#if defined(__IS_MAP_SERVER) || defined(__IS_DB_DEMON)
		if( i == 2 )
			continue;
#endif

		memset( sDummyIP, 0, MM_IP_LENGTH );
		GetPrivateProfileString( "server_info", keyname_list[i], "", sDummyIP, sizeof(sDummyIP), sFileName );
		wDummyPort = (WORD)GetPrivateProfileInt( "server_info", keyname_list[i+1], 0, sFileName );

		if( ( (sDummyIP[0] == NULL) || (wDummyPort == 0) ) && (i != 6) )
		{
			MyLog( LOG_FATAL, "INI Read Fail(%s) : On Reading [%s]", sFileName, keyname_list[i] );
			this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
			return false;
		}

		switch (i) {
		case 0:			// Own Server IP/Port for Server Connections.
			{
				// AddNewServer will create a SERVER_LIST, add it on serverlist, and return it's pointer.
				pServerData = this->m_pOwnServerData = this->GetNewServerData( sDummyIP, wDummyPort );
			}
			break;
		case 2:			// Set Own Server IP/Port for User Connections. Map Server Does not need this parameters.
			{
				strcpy( pServerData->szIPForUser, sDummyIP );
				pServerData->wPortForUser = wDummyPort;
			}
			break;
		case 4:			// Primary Proxy Server IP/Port
			{
				pServerData = this->GetNewServerData( sDummyIP, wDummyPort );
				this->m_pOwnProxyServerData[PRIMARY_SERVER] = pServerData;

				if( pServerData )
				{
					this->AddServerDataToList( pServerData );
				}
			}
			break;
		case 6:			// Secondary Proxy Server IP/Port
			{
				// 2001/02/01
				// 현재 두개의 PROXY가 떴을때 상황처리가 완벽하지 않으므로
				// 하나의 프락시만 허용한다.

				/* pServerData = this->GetNewServerData( sDummyIP, wDummyPort );
				this->m_pOwnProxyServerData[SECONDARY_SERVER] = pServerData;

				if( pServerData )
				{
					this->AddServerDataToList( pServerData );
				}
				*/
			}
			break;
		default:
			return false;
		}
	}

#ifdef __IS_PROXY_SERVER
	char dummy_key_name[80+1];
	for( i = 0; i < num_of_dr_servers; i++ )
	{
		// Read IP
		sprintf( dummy_key_name, "%s%d", base_keyname[0], i );
		memset( sDummyIP, 0, MM_IP_LENGTH );
		GetPrivateProfileString( "external_server_info", dummy_key_name, "", sDummyIP, sizeof(sDummyIP), sFileName );

		if( sDummyIP[0] == NULL )
		{
			MyLog( LOG_FATAL, "INI Read Fail(%s) : On Reading [%s]", sFileName, dummy_key_name );
			this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
			return false;
		}
		// Read Port
		sprintf( dummy_key_name, "%s%d", base_keyname[1], i );
		wDummyPort = (WORD)GetPrivateProfileInt( "external_server_info", dummy_key_name, 0, sFileName );

		if( wDummyPort == 0 )
		{
			MyLog( LOG_FATAL, "INI Read Fail(%s) : On Reading [%s]", sFileName, dummy_key_name );
			this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
			return false;
		}

		// Add it To ServerList
		pServerData = this->GetNewServerData( sDummyIP, wDummyPort );
		pServerData->wServerIndex = i;

		// Added by chan78 at 2001/02/24
		// 외부 포트정보를 읽는다
		if( pServerData->dwServerType == SERVER_TYPE_AGENT )
		{
			// Read IP
			sprintf( dummy_key_name, "%s%d", base_keyname[2], i );
			GetPrivateProfileString( "external_server_info", dummy_key_name, "", sDummyExternalIP, sizeof(sDummyExternalIP), sFileName );

			// Vertify
			if( sDummyExternalIP[0] == 0 )
			{
				MyLog( LOG_FATAL, "INI Read Fail(%s) : On Reading [%s]", sFileName, dummy_key_name );
				this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
				return false;
			}

			// Read Port
			sprintf( dummy_key_name, "%s%d", base_keyname[3], i );
			wDummyExternalPort = (WORD)GetPrivateProfileInt( "external_server_info", dummy_key_name, 0, sFileName );

			// Vertify
			if( wDummyExternalPort == 0 )
			{
				MyLog( LOG_FATAL, "INI Read Fail(%s) : On Reading [%s]", sFileName, dummy_key_name );
				this->DestroyServer( FINISH_TYPE_BOOT_FAIL );
				return false;
			}

			// Copy it
			memcpy( pServerData->szIPForUser, sDummyExternalIP, MM_IP_LENGTH );
			pServerData->wPortForUser = wDummyExternalPort;
		}
		
		if( !pServerData )
		{
#ifdef __ON_DEBUG
//			_asm int 3;
#endif
		}
		if( !this->AddServerDataToList( pServerData ) )
		{
#ifdef __ON_DEBUG
//			_asm int 3;
#endif
		}
	}
#endif		//endif for #ifdef__IS_PROXY_SERVER

	return true;
}

bool CServerTable::Send( WORD wServerID, char* pMsg, DWORD dwLength )
{
	LP_SERVER_DATA pServerData = this->GetServerData( wServerID );
	
	if ( !pServerData || !pServerData->dwConnectionIndex )
	{
		return false;
	}
	
	return this->m_pINet->SendToServer( pServerData->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}

bool CServerTable::Send( DWORD dwConnectionIndex, char* pMsg, DWORD dwLength )
{
	return this->m_pINet->SendToServer( dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}

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

	// For Debugging
//	if( pProxyServer->dwServerType != SERVER_TYPE_PROXY )
//		_asm int 3;

	return this->m_pINet->SendToServer( pProxyServer->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}

bool CServerTable::SendToDBDemon( char *pMsg, DWORD dwLength )
{
	LP_SERVER_DATA pDBDemon = this->m_pOwnDBDemonData;

	if( pDBDemon && pDBDemon->dwConnectionIndex )
	{
		if( this->m_pINet->SendToServer( pDBDemon->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION ) )
		{
			return true;
		}
	}

	// Failed to Send to Given DB Demon
	// First, Find-out another DB Demon
	for( pDBDemon = this->m_pServerListHead; pDBDemon; pDBDemon->pNextServerData )
	{
		if( (pDBDemon->dwServerType == SERVER_TYPE_DB) && (pDBDemon->dwConnectionIndex) )
		{
			if( this->m_pINet->SendToServer( pDBDemon->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION ) )
			{
				// Change DB Demon To This one.
				this->m_pOwnDBDemonData = pDBDemon;
				// Request to set DB Demon to PROXY
				this->RequestToSetDBDemon();

				return true;
			}
		}
	}

	// No way to send... It's FATAL ERROR.
	return false;
}

// 특정 DB Demon에게 보낸다. Entry를 가진 User의 처리는 이렇게 한다.
bool CServerTable::SendToDBDemon( DWORD dwConnectionIndex, char *pMsg, DWORD dwLength )
{
	LP_SERVER_DATA pDBDemon = this->GetServerData( dwConnectionIndex );

	if( pDBDemon->dwConnectionIndex && pDBDemon->dwServerType == SERVER_TYPE_DB )
	{
		if( this->m_pINet->SendToServer( pDBDemon->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION ) )
		{
			return true;
		}
	}
	return false;
}

bool CServerTable::RequestToSetDBDemon()
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];
	char buf[256+1];

	sprintf( buf, "Now Request DB DEMON Setting..." );
	
	szDummyMsg[0] = (BYTE)PTCL_REQUEST_SET_DB_DEMON;

	if( this->SendToProxyServer( szDummyMsg, 1 ) )
	{
		strcat( buf, " Ok." );
		MyLog( LOG_NORMAL, buf );
		return true;
	}
	else
	{
		strcat( buf, " Failed!" );
		MyLog( LOG_IMPORTANT, buf );
		return false;
	}
}

bool CServerTable::IsServerActivated( LP_SERVER_DATA pServerData )
{
	if( !pServerData )
		return false;
	
	if( pServerData->dwStatus == STATUS_ACTIVATED )
	{
		return true;
	}

	return false;
}

bool CServerTable::IsServerActivated( WORD wPort )
{
	LP_SERVER_DATA pServerData = this->GetServerData( wPort );

	if( !pServerData )
	return false;
	
	if( pServerData->dwStatus == STATUS_ACTIVATED )
	{
		return true;
	}

	return false;
}

#ifdef __IS_MAP_SERVER
bool CServerTable::SendRajaPacketToOtherMapServer( WORD wPort, char* szMsg, DWORD dwLength )
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];

	szDummyMsg[0] = (BYTE)PTCL_MAP_TO_MAP;
	memcpy( szDummyMsg+1, szMsg, dwLength );

	if( !this->Send( wPort, szDummyMsg, dwLength+1 ) )
	{
#ifdef __ON_DEBUG
//		_asm int 3;
#endif
		return false;
	}
	return true;
}
#endif

#ifdef __IS_PROXY_SERVER

void CServerTable::ReBalanceDBDemonSettings()
{
	LP_SERVER_DATA pDummyServerData;
	DWORD dwNumOfServers1 = 0;
	DWORD dwNumOfServers2 = 0;

	// 모든 서버를 DB Demon으로부터 분리함.
	pDummyServerData = this->GetServerListHead();
	for(; pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
	{
		if( (pDummyServerData->dwConnectionIndex) && (pDummyServerData->dwStatus > STATUS_AWAITING_CONNECTION_RESULT) )
		{
			if( (pDummyServerData->dwServerType == SERVER_TYPE_AGENT) || (pDummyServerData->dwServerType == SERVER_TYPE_MAP) )
			{
				this->ClearDBDemonSetting( pDummyServerData );
				dwNumOfServers1++;
			}
		}
	}

	// 전부 다 재 배정.
	pDummyServerData = this->GetServerListHead();
	for(; pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
	{
		if( (pDummyServerData->dwConnectionIndex) && (pDummyServerData->dwStatus > STATUS_AWAITING_CONNECTION_RESULT) )
		{
			if( (pDummyServerData->dwServerType == SERVER_TYPE_AGENT) || (pDummyServerData->dwServerType == SERVER_TYPE_MAP) )
			{
				if( this->SetDBDemon( pDummyServerData ) == false )
				{
					this->SetServerStatus( pDummyServerData, STATUS_AWAITING_DB_DEMON_SETTING );
				}
				else
				{
					this->SetServerStatus( pDummyServerData, STATUS_AWAITING_SET_DB_DEMON_RESULT );
				}
				dwNumOfServers2++;
			}
		}
	}

	MyLog( LOG_NORMAL, "DB Demon Load Balanced by Timer...(Target:%d / Balanced:%d)", dwNumOfServers1, dwNumOfServers2 );

	return;
}

void CServerTable::ShowServerConnectionStatus()
{
	LP_SERVER_DATA pDummyServerData;
	char buf[256];
	char CStatus[6] =
	{
		'#',
		'X',
		'-',
		'O',
		'O',
		'O'
	};

	memset( buf, 0, (sizeof(char)*256) );
	DWORD dwCount = 0;

	for( pDummyServerData = this->GetServerListHead(); pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
	{
		dwCount++;

		if( !(dwCount % 10) )
		{
			MyLog( LOG_JUST_DISPLAY, buf );
			memset( buf, 0, (sizeof(char)*256) );
		}
		else
		{
			sprintf( buf, "%s(%2d)%4d ", buf, pDummyServerData->wServerIndex, pDummyServerData->wPort );
		}
	}
	if( (dwCount % 10) )
	{
		MyLog( LOG_JUST_DISPLAY, buf );
		memset( buf, 0, (sizeof(char)*256) );
	}

	for( WORD y = 0; y < dwCount+1; y++ )
	{
		for( WORD x = 0; x < dwCount+1; x++ )
		{
			if( y == 0 )
			{
				if( x == 0 )
					sprintf( buf, "%s ", buf );
				else
					sprintf( buf, "%s%d", buf, ((x-1)?((x-1)%10):0) );
			}
			else if( x == y )
			{
				sprintf( buf, "%s%c", buf, '.' );
			}
			else
			{
				if( x == 0 ) sprintf( buf, "%s%d", buf, ((y-1)?((y-1)%10):0) );
				else sprintf( buf, "%s%c", buf, CStatus[this->m_bConnectionStatus[y-1][x-1]] );
			}
		}
		MyLog( LOG_JUST_DISPLAY, buf );
		memset( buf, 0, (sizeof(char)*256) );
	}

	return;
}


bool CServerTable::DestroyOtherServer( WORD wServerID )
{
	LP_SERVER_DATA pDummyServer = this->GetServerData( wServerID );
	if( pDummyServer )
	{
		return this->DestroyOtherServer( pDummyServer );
	}
	else
	{
		return false;
	}
}

bool CServerTable::DestroyOtherServer( LP_SERVER_DATA pServerData )
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];

	szDummyMsg[0] = (BYTE)PTCL_ORDER_DESTROY_SERVER;

	if( pServerData && pServerData->dwConnectionIndex )
	{
		if( this->Send( pServerData->dwConnectionIndex, szDummyMsg, 1 ) )
		{
			return true;
		}
	}
	return false;
}

bool CServerTable::IsUserAcceptAllowed()
{
	bool bResult;
	EnterCriticalSection( &this->m_IsUserAcceptAllowedCriticalSection );
	bResult = this->m_bIsUserAcceptAllowed;
	LeaveCriticalSection( &this->m_IsUserAcceptAllowedCriticalSection );
	return bResult;
}

bool CServerTable::ToggleUserAcceptAllowed()
{
	bool bResult;
	EnterCriticalSection( &this->m_IsUserAcceptAllowedCriticalSection );
	if( this->m_bIsUserAcceptAllowed == true )
	{
		bResult = this->m_bIsUserAcceptAllowed = false;
	}
	else
	{
		bResult = this->m_bIsUserAcceptAllowed = true;
	}
	LeaveCriticalSection( &this->m_IsUserAcceptAllowedCriticalSection );
	return bResult;
}

bool CServerTable::SetDBDemon( LP_SERVER_DATA pTarget )
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];

	LP_SERVER_PORT_LIST_PACKET pPacket = (LP_SERVER_PORT_LIST_PACKET)(szDummyMsg + 1);
	LP_SERVER_DATA pDummyServer;
	LP_SERVER_DATA pToSetDBDemon = NULL;

	for( pDummyServer = this->GetServerListHead(); pDummyServer; pDummyServer = pDummyServer->pNextServerData )
	{
		if( pDummyServer->dwServerType == SERVER_TYPE_DB )
		{
			if( this->IsServerActivated(pDummyServer) )
			{
				if( pToSetDBDemon == NULL )
				{
					pToSetDBDemon = pDummyServer;
					continue;
				}
				else
				{
					if( this->GetDBLoad(pToSetDBDemon) > this->GetDBLoad(pDummyServer) )
						pToSetDBDemon = pDummyServer;
				}
			}
		}
	}

	// 배정할 수 있는 DB Demon이 있을 때에만 배정한다.
	if( pToSetDBDemon )
	{
		return this->SetDBDemon( pTarget, pToSetDBDemon );
	}

	return false;
}

bool CServerTable::SetDBDemon( LP_SERVER_DATA pTargetServer, LP_SERVER_DATA pDBDemon )
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];

	LP_SET_DB_DEMON_PACKET pSendPacket = (LP_SET_DB_DEMON_PACKET)(szDummyMsg+1);

	// Build Message
	szDummyMsg[0] = PTCL_ORDER_SET_DB_DEMON;
	pSendPacket->wDBDemonPort = pDBDemon->wPort;

	// 배정
	if( this->Send( pTargetServer->dwConnectionIndex, szDummyMsg, sizeof(BYTE) + sizeof(WORD) ) )
	{
		// 기존에 배정된 DB 정보 제거.
		if( !this->ClearDBDemonSetting( pTargetServer ) )
		{
//			MyLog( LOG_FATAL, "CServerTable::ClearDBDemonSetting() Failed!!!" );
		}

		// 배정된 DB 정보를 링크.
		if( !this->LinkDBDemonSetting( pTargetServer, pDBDemon ) )
		{
			MyLog( LOG_FATAL, "CServerTable::LinkDBDemonSetting() Failed!!!" );
			goto FailedToDBSetting;
		}

		return true;
	}

FailedToDBSetting:
	// 실패한 경우 서버의 상태는 DB DEMON 배정 대기.
	this->SetServerStatus( pTargetServer, STATUS_AWAITING_DB_DEMON_SETTING );

	return false;
}

bool CServerTable::LinkDBDemonSetting( LP_SERVER_DATA pTarget, LP_SERVER_DATA pDB )
{
	if( !pTarget || !pDB )
	{
#ifdef __ON_DEBUG
//		_asm int 3;
#endif
		return false;
	}

	pTarget->pUsingDBDemon = pDB;
	for( WORD i = 0; i < MAX_SERVER_NUM; i++ )
	{
		if( pDB->ppUsingServers[i] == NULL )
		{
			pDB->ppUsingServers[i] = pTarget;
			break;
		}
	}
	return true;
}

bool CServerTable::ClearDBDemonSetting( LP_SERVER_DATA pServer )
{
	if( pServer->pUsingDBDemon )
	{
		for( WORD i = 0; i < MAX_SERVER_NUM; i++ )
		{
			if( pServer->pUsingDBDemon->ppUsingServers[i] == pServer )
			{
				pServer->pUsingDBDemon->ppUsingServers[i] = NULL;
			}
		}
		pServer->pUsingDBDemon = NULL;
		return true;
	}
	else
	{
		return false;
	}
}

bool CServerTable::SetServerConnectionStatus( LP_SERVER_DATA pServer, LP_SERVER_DATA pServer2, BYTE bType )
{

	switch( bType )
	{
	case CONNECTION_STATUS_NOT_LISTED:
		{
		}
		break;
	case CONNECTION_STATUS_NOT_CONNECTED:
		{
		}
		break;
	case CONNECTION_STATUS_TRYING_TO_CONNECT:
		{
		}
		break;
	case CONNECTION_STATUS_CONNECTED_BETWEEN:
	case CONNECTION_STATUS_CONNECTED:
	case CONNECTION_STATUS_ACCEPTED:
		{
			if( this->GetServerConnectionStatus( pServer, pServer2 ) == bType )
			{
				// Already Connected;
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
				return true;
			}
		}
		break;
	default:
		{
			return false;
		}
	}

	this->m_bConnectionStatus[pServer->wServerIndex][pServer2->wServerIndex] = bType;

	return true;
}

bool CServerTable::OrderToReportServerStatus( LP_SERVER_DATA pTargetServer )
{
	char szDummyMsg[MM_MAX_PACKET_SIZE];

	szDummyMsg[0] = PTCL_ORDER_TO_REPORT_SERVER_STATUS;
	
	return this->Send( pTargetServer->dwConnectionIndex, szDummyMsg, 1 );
}

BYTE CServerTable::GetServerConnectionStatus( LP_SERVER_DATA pServer, LP_SERVER_DATA pServer2 )
{
	return this->m_bConnectionStatus[pServer->wServerIndex][pServer2->wServerIndex];
}

DWORD CServerTable::GetDBLoad( LP_SERVER_DATA pDBDemon )
{
	LP_SERVER_DATA pDummyServer;
	DWORD dwWeight = 0;

	for( WORD i = 0; i < MAX_SERVER_NUM; i++ )
	{
		if( pDBDemon->ppUsingServers[i] != NULL )
		{
			pDummyServer = pDBDemon->ppUsingServers[i];
			if( pDummyServer )
			{
				dwWeight += ( SERVER_DEFAULT_OVERHEAD + (dwBaseWeight[pDummyServer->dwServerType]*(pDummyServer->dwNumOfUsers)) );
			}
		}
	}

	return dwWeight;
}

DWORD CServerTable::CalcDBLoad( LP_SERVER_DATA pServer )
{
	if( !pServer )
		return 0;
	return ( (SERVER_DEFAULT_OVERHEAD + ((pServer->dwNumOfUsers) * dwBaseWeight[pServer->dwServerType])) );
}

#endif

DWORD CServerTable::GetServerSetNum()
{
	return this->m_dwServerSetNumber;
}

DWORD CServerTable::GetNumOfServers()
{
	return this->m_dwNumOfServers-1;
}

DWORD CServerTable::GetNumOfTypedServers( SERVER_TYPE dwServerType )
{
	return this->m_dwNumOfTypedServers[ dwServerType ];
}

DWORD CServerTable::GetNumOfUsers()
{
	return this->m_dwNumOfUsers;
}

DWORD CServerTable::SetNumOfUsers( DWORD dwNum )
{
	return (this->m_dwNumOfUsers = dwNum);
}

DWORD CServerTable::GetNumOfConnectedServers()
{
	return this->m_dwNumOfConnectedServers;
}

DWORD CServerTable::GetServerStatus()
{
	return this->m_pOwnServerData->dwStatus;
}

DWORD CServerTable::BroadCastToEveryServer( char *pMsg, DWORD dwLength )
{
	LP_SERVER_DATA pTargetServerData;

	DWORD dwFailCounter = 0;

	szMsg[0] = (BYTE)PTCL_BROADCAST_TO_SERVERS;
	memcpy( szMsg+1, pMsg, dwLength );
	
	for( pTargetServerData = this->m_pServerListHead; pTargetServerData; pTargetServerData = pTargetServerData->pNextServerData )
	{
		if( pTargetServerData->dwConnectionIndex && (pTargetServerData->dwStatus == STATUS_ACTIVATED) )
		{
			if( !this->m_pINet->SendToServer( pTargetServerData->dwConnectionIndex, (char *)szMsg, dwLength +1, FLAG_SEND_NOT_ENCRYPTION ) )
				dwFailCounter++;
		}
	}
	return dwFailCounter;
}

DWORD CServerTable::BroadCastToEveryServer( char *pMsg, DWORD dwLength, SERVER_TYPE dwTargetServerType )
{
	LP_SERVER_DATA pTargetServerData;

	DWORD dwFailCounter = 0;

	szMsg[0] = (BYTE)PTCL_BROADCAST_TO_SERVERS;
	memcpy( szMsg+1, pMsg, dwLength );

	for( pTargetServerData = this->m_pServerListHead; pTargetServerData;  pTargetServerData = pTargetServerData->pNextServerData )
	{
		if( (pTargetServerData->dwServerType == dwTargetServerType) && (pTargetServerData->dwConnectionIndex) && (pTargetServerData->dwStatus == STATUS_ACTIVATED) )
		{
			if( !this->m_pINet->SendToServer( pTargetServerData->dwConnectionIndex, (char *)szMsg, dwLength+1, FLAG_SEND_NOT_ENCRYPTION ) )
				dwFailCounter++;
		}
	}
	return dwFailCounter;
}

LP_SERVER_DATA CServerTable::GetConnectedServerData( WORD wServerID )
{
	WORD wIndex = wServerID % this->m_wMaxBucketNum;
	LP_HASHED_SERVER_DATA pHashedServerData = this->m_ppServerTable[wIndex];

	while ( pHashedServerData )
	{
		if ( pHashedServerData->pServerData->wPort == wServerID )
		{
			return pHashedServerData->pServerData;
		}
		pHashedServerData = pHashedServerData->pNextHashedServerData;
	}
	return NULL;
}

LP_SERVER_DATA CServerTable::GetConnectedServerData( DWORD dwConnectionIndex )
{
	LP_SERVER_DATA pServerData = this->GetServerData( dwConnectionIndex );
	
	if ( !pServerData || !pServerData->dwConnectionIndex )
		return NULL;

	return pServerData;
}

LP_SERVER_DATA CServerTable::GetServerData( WORD wServerID )
{
	LP_SERVER_DATA pServerData;

	if( this->m_pOwnServerData->wPort == wServerID )
		return this->m_pOwnServerData;
	
	for( pServerData = this->m_pServerListHead; pServerData; pServerData = pServerData->pNextServerData )
	{
		if( pServerData->wPort == wServerID )
		{
			return pServerData;
		}
	}
	return NULL;
}

LP_SERVER_DATA CServerTable::GetServerData( DWORD dwConnectionIndex )
{
	LP_SERVER_DATA pServerData;

	for( pServerData = this->m_pServerListHead; pServerData; pServerData = pServerData->pNextServerData )
	{
		if( pServerData->dwConnectionIndex == dwConnectionIndex )
		{
			return pServerData;
		}
	}
	return NULL;
}

LP_SERVER_DATA CServerTable::GetNewServerData( char *szIP, WORD wPort )
{
	LP_SERVER_DATA pNewServerData;

	pNewServerData = new SERVER_DATA;

	memset( pNewServerData, 0, sizeof(SERVER_DATA) );

	pNewServerData->pNextServerData = NULL;
	pNewServerData->pHashedServerData = NULL;
	pNewServerData->dwStatus = STATUS_NOT_IN_NETWORK;

	memcpy( pNewServerData->szIP, szIP, MM_IP_LENGTH );
	pNewServerData->wPort = wPort;

	// Set Server type by port Number
	if( (pNewServerData->wPort >= AGENT_SERVER_PORT_START) && (pNewServerData->wPort <= AGENT_SERVER_PORT_FINISH))
	{
		pNewServerData->dwServerType = SERVER_TYPE_AGENT;
	}
	else if( (pNewServerData->wPort >= MAP_SERVER_PORT_START) && (pNewServerData->wPort <= MAP_SERVER_PORT_FINISH))
	{
		pNewServerData->dwServerType = SERVER_TYPE_MAP;
	}
	else if( (pNewServerData->wPort >= PROXY_SERVER_PORT_START) && (pNewServerData->wPort <= PROXY_SERVER_PORT_FINISH))
	{
		pNewServerData->dwServerType = SERVER_TYPE_PROXY;
	}
	else if( (pNewServerData->wPort >= DB_DEMON_PORT_START) && (pNewServerData->wPort <= DB_DEMON_PORT_FINISH))
	{
		pNewServerData->dwServerType = SERVER_TYPE_DB;
	}
	else
	{
		delete pNewServerData;
		return NULL;
	}
	this->m_dwNumOfServers++;

#ifdef IS_PROXY_SERVER
	// ServerIndex Setting
	WORD i;
	WORD ii;

	for( i = 0; i < MAX_SERVER_NUM; i++)
	{
		if( this->m_bConnectionStatus[i][0] == (BYTE)CONNECTION_STATUS_IS_BLANK )
			break;
	}
	if( i == MAX_SERVER_NUM )
	{
		delete pNewServerData;
		pNewServerData = NULL;
		return NULL;
	}
	else
	{
		pNewServerData->wServerIndex = i;
		for( i = 0; i < MAX_SERVER_NUM; i++ )
		{
			this->m_bConnectionStatus[pNewServerData->wServerIndex][i] = (BYTE)CONNECTION_STATUS_NOT_CONNECTED;
			this->m_bConnectionStatus[i][pNewServerData->wServerIndex] = (BYTE)CONNECTION_STATUS_NOT_CONNECTED;
		}
	}
#endif

	return pNewServerData;
}

LP_SERVER_DATA CServerTable::GetOwnServerData()
{
	return this->m_pOwnServerData;
}

LP_SERVER_DATA CServerTable::GetServerListHead()
{
	return this->m_pServerListHead;
}

LP_SERVER_DATA CServerTable::GetOwnProxyServerData()
{
	if( this->m_pOwnProxyServerData[PRIMARY_SERVER] )
	{
		return this->m_pOwnProxyServerData[PRIMARY_SERVER];
	}
	else
	{
		return this->m_pOwnProxyServerData[SECONDARY_SERVER];
	}
}

LP_SERVER_DATA CServerTable::GetOwnDBDemonData()
{
	return this->m_pOwnDBDemonData;
}

#ifdef __IS_PROXY_SERVER
LP_SERVER_DATA CServerTable::GetAssignableAgentServer()
{
	LP_SERVER_DATA pServerData = NULL;
	LP_SERVER_DATA pToAssign = NULL;

	for( pServerData = this->GetServerListHead(); pServerData; pServerData = pServerData->pNextServerData )
	{
		if( this->IsServerActivated(pServerData) && (pServerData->dwServerType == SERVER_TYPE_AGENT) )
		{
			if( !pToAssign )
			{
				pToAssign = pServerData;
			}
			else if( pToAssign->dwNumOfUsers > pServerData->dwNumOfUsers )
			{
				pToAssign = pServerData;
			}
		}
	}
	
	if( !pToAssign )
	{
		return NULL;
	}
	else
	{
//		pToAssign->dwNumOfUsers++;
		return pToAssign;
	}
}
#endif

CPackedMsg*	CServerTable::GetPackedMsg(DWORD dwConnectionIndex)
{
	for (DWORD i=0; i < this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT]; i++)
	{
		if (m_ppPackedTable[i]->GetConnectionIndex() == dwConnectionIndex)
		{
			return m_ppPackedTable[i];
		}
	}
	return NULL;
}

CPackedMsg*	CServerTable::GetPackedMsg(DWORD* pdwPackedIndex,DWORD dwConnectionIndex)
{
	for (DWORD i=0; i<this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT]; i++)
	{
		if (this->m_ppPackedTable[i]->GetConnectionIndex() == dwConnectionIndex)
		{
			*pdwPackedIndex = i;
			return this->m_ppPackedTable[i];
		}
	}
	return NULL;
}

// -----------------------------------------------------------------
// GetTypedServerText
// -----------------------------------------------------------------
char *GetTypedServerText( SERVER_TYPE type )
{
	switch( type )
	{
	case SERVER_TYPE_PROXY:
		{
			return "PROXY SERVER";
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			return "AGENT SERVER";
		}
		break;
	case SERVER_TYPE_DB:
		{
			return "DB SERVER";
		}
		break;
	case SERVER_TYPE_MAP:
		{
			return "MAP SERVER";
		}
		break;
	default:
		{
			return "ERROR";
		}
		break;
	}

}

char *GetServerStatusText( DWORD dwStatus )
{
	switch( dwStatus )
	{
	case STATUS_NOT_IN_NETWORK:
		{
			return "<NOT IN NETWORK>";
		}
		break;
	case STATUS_TRYING_TO_CONNECT:
		{
			return "<TRYING TO CONNECT>";
		}
		break;
	case STATUS_AWAITING_PROXY_CONNECTION:
		{
			return "<AWAITING PROXY CONNECTION>";
		}
		break;
	case STATUS_AWAITING_SERVER_LIST:
		{
			return "<AWAITING SERVER LIST>";
		}
		break;
	case STATUS_AWAITING_SET_SERVER_LIST_RESULT:
		{
			return "<AWAITING SET SERVER LIST RESULT>";
		}
		break;
	case STATUS_AWAITING_CONNECTION_ORDER:
		{
			return "<AWAITING CONNECTION ORDER>";
		}
		break;
	case STATUS_AWAITING_CONNECTION_RESULT:
		{
			return "<AWAITING CONNECTION RESULT>";
		}
		break;
	case STATUS_AWAITING_DB_DEMON_SETTING:
		{
			return "<AWAITING DB DEMON SETTING>";
		}
		break;
	case STATUS_AWAITING_SET_DB_DEMON_RESULT:
		{
			return "<AWAITING SET DB DEMON RESULT>";
		}
		break;
	case STATUS_ACTIVATED:
		{
			return "<ACTIVATED>";
		}
		break;
	case STATUS_INACTIVATED:
		{
			return "<INACTIVATED>";
		}
		break;
	case STATUS_CLOSING:
		{
			return "<CLOSING>";
		}
		break;
	default:
		{
			return "<ERROR>";
		}
		break;
	}
}
char *GetFinishTypeText( DWORD dwFinishType )
{
	switch( dwFinishType )
	{
	case FINISH_TYPE_NORMAL:
		{
			return "<NORMAL>";
		}
		break;
	case FINISH_TYPE_UNKNOWN_ERROR:
		{
			return "<UNKNOWN ERROR>";
		}
		break;
	case FINISH_TYPE_SERVER_LIST_ACCEPT_FAIL:
		{
			return "<SERVER-LIST ACCEPT FAILED>";
		}
		break;
	case FINISH_TYPE_BY_PROXY:
		{
			return "<PROXY ORDER>";
		}
		break;
	default:
		{
			return "<ERROR>";
		}
		break;
	}
}

DWORD dwBaseWeight[NUM_OF_SERVER_TYPES] =
{
	1000,	// MAP
	1,		// DB
	700,	// AGENT
	1		// PROXY
};


// 중요한 함수...
// 코드가 좀 복잡해도 꼭 읽어두자.
void __stdcall OnConnectServerSuccess( DWORD dwConnectionIndex, void *pVoidTypedServerData )
{
	LP_SERVER_DATA pServerData = (LP_SERVER_DATA)pVoidTypedServerData;
	LP_AWAITING_CONNECTION_RESULT_DATA pResult = g_pServerTable->GetConnectionResultData();
	LP_SERVER_PORT_LIST_PACKET pConnectedList = (LP_SERVER_PORT_LIST_PACKET)(pResult->szAnswer+1);

	char szDummyMsg[MM_MAX_PACKET_SIZE];

	if( pServerData->dwConnectionIndex != 0 )
	{
		// 이미 접속된 경우. 있어선 안된다.
		MyLog( LOG_FATAL, "SERVER DATA(%s/%d) has already dwConnectionIndex (%d)", pServerData->szIP, pServerData->wPort, pServerData->dwConnectionIndex );
#ifdef __ON_DEBUG
		_asm int 3;
#else
		g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
	}

	// Log it
	MyLog( LOG_NORMAL, "[SUCCESS TO CONNECT] %s Server %s(%d)", GetTypedServerText(pServerData->dwServerType), pServerData->szIP, pServerData->wPort );

	// SET dwConnectionIndex
	pServerData->dwConnectionIndex = dwConnectionIndex;

	// Add To HashTable
	if( !g_pServerTable->AddConnectedServerDataToHashTable( pServerData, dwConnectionIndex ) )
	{
		// Failed
		g_pServerTable->SetServerStatus( pServerData, STATUS_CLOSING );
		g_pServerTable->CloseServerConnection( pServerData );

		return;
	}

	// 접속방식이 일치하는지 체크한다.
	if( (pServerData->dwConnectType != CONNECT_TYPE_WITH_PROXY) && (pServerData->dwConnectType != pResult->dwConnectionType ) )
	{
		MyLog( LOG_FATAL, "OnConnectServerSuccess() :: dwConnectType does not match(%d:%d)", pServerData->dwConnectType, pResult->dwConnectionType );
#ifdef __ON_DEBUG
		_asm int 3;
#else
		g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
	}

	// -------------------------------------------------------------
	// 여기서부터는 최초 접속 후 Negotiation 관련 코드들이 들어간다.
	// -------------------------------------------------------------
	switch( pServerData->dwConnectType )
	{
	// -----------------------
	// CONNECT_TYPE_WITH_PROXY
	// -----------------------
	case CONNECT_TYPE_WITH_PROXY:
		{
			// PROXY에 접속했으므로 더이상 PROXY 접속용 TIMER가 실행될 필요 없다.
#if defined(__IS_AGENT_SERVER) || defined(__IS_MAP_SERVER) || defined(__IS_DB_DEMON)
			g_pINet->PauseTimer( 0 );
#endif

			// PTCL_NOTIFY_SERVER_UP 전송.
			szDummyMsg[0] = (BYTE)PTCL_NOTIFY_SERVER_UP;
			memcpy( szDummyMsg+1, &g_pServerTable->GetOwnServerData()->wPort, 2 );

			if( !g_pServerTable->Send( dwConnectionIndex, szDummyMsg, 3 ) )
			{
				MyLog( LOG_IMPORTANT, "OnConnectServerSuccess() Failed To Send First Packet(PTCL_NOTIFY_SERVER_UP)" );
				g_pServerTable->CloseServerConnection( dwConnectionIndex );
			}
			g_pServerTable->SetServerStatus( pServerData, STATUS_ACTIVATED );

			if( (++pResult->dwResultCheckedServers) == pResult->dwToConnectServers )
			{
				pResult->dwConnectionType = CONNECT_TYPE_NONE;
				pResult->dwResultCheckedServers = 0;
				pResult->dwToConnectServers = 0;

				// PTCL_REQUEST_SET_SERVER_LIST 전송
				szDummyMsg[0] = (BYTE)PTCL_REQUEST_SET_SERVER_LIST;

				if( !g_pServerTable->SendToProxyServer( szDummyMsg, 1 ) )
				{
					MyLog( LOG_IMPORTANT, "OnConnectServerSuccess() Failed To Send Second Packet(PTCL_REQUEST_SET_SERVER_LIST)" );
					g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
					break;
				}
				g_pServerTable->SetServerStatus( STATUS_AWAITING_SERVER_LIST );
			}
		}
		break;
	// ------------------
	// CONNECT_TYPE_BATCH
	// ------------------
	case CONNECT_TYPE_BATCH:
		{
			szDummyMsg[0] = (BYTE)PTCL_ORDER_TO_REPORT_SERVER_DATAS;

			if( !g_pServerTable->Send( dwConnectionIndex, szDummyMsg, sizeof(BYTE) ) )
			{
				MyLog( LOG_IMPORTANT, "OnConnectServerSuccess() Failed To Send First Packet(PTCL_ORDER_TO_REPORT_SERVER_DATAS)" );
				g_pServerTable->CloseServerConnection( pServerData->dwConnectionIndex );
			}

			// 모든 Batch Connect가 끝났으면 BIND 한다.
			if( (++pResult->dwResultCheckedServers) == pResult->dwToConnectServers )
			{
				MyLog( LOG_NORMAL, "BatchConnect() Finished... %d(Total:%d) Servers are Tryied", pResult->dwToConnectServers, g_pServerTable->GetNumOfServers());

				if( !g_pServerTable->StartServer( TYPE_SERVER_SIDE ) )	// SERVER SIDE Socket 바인드.
				{
					MyLog( LOG_FATAL, "SERVER_SIDE Socket Bind Failed!!!" );
					g_pServerTable->DestroyServer( FINISH_TYPE_BIND_FAILED );
					return;
				}
				MyLog( LOG_NORMAL, "SERVER_SIDE Socket Binded" );	
	
				if( !g_pServerTable->StartServer( TYPE_USER_SIDE ) )	// USER SIDE Socket 바인드.
				{
					MyLog( LOG_NORMAL, "USER_SIDE Socket Bind Failed!!!" );
					g_pServerTable->DestroyServer( FINISH_TYPE_BIND_FAILED );
				}
				MyLog( LOG_NORMAL, "USER_SIDE Socket Binded" );

				pResult->dwConnectionType = CONNECT_TYPE_NONE;
			}
		}
		break;
	// ---------------------------
	// CONNECT_TYPE_BY_PROXY_ORDER
	// ---------------------------
	case CONNECT_TYPE_BY_PROXY_ORDER:
		{
			if( g_pServerTable->BeginNegotiationWithNormalServer( pServerData ) )
			{
				// Answer Packet build
				pConnectedList->wPort[pConnectedList->wNum++] = pServerData->wPort;

				// 모든 Ordered Connect가 끝났으면 PTCL_SERVER_CONNECTING_RESULT 를 만들어 보낸다.
				if( (++pResult->dwResultCheckedServers) == pResult->dwToConnectServers )
				{
					g_pServerTable->ReportOrderedConnectionResult();
				}
			}
		}
		break;
	// -----
	// ERROR
	// -----
	case CONNECT_TYPE_NONE:
	default:
		{
			MyLog( LOG_FATAL, "FATAL ERROR at OnConnectServerSuccess() :: ConnectType(%d) is NOT VALID!!!", pServerData->dwConnectType );
#ifdef __ON_DEBUG
			_asm int 3;
#else
			g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
		}
	}
	return;
}

void __stdcall OnFailedToConnectServer( void *pVoidTypedServerData )
{
	LP_SERVER_DATA pServerData = (LP_SERVER_DATA)pVoidTypedServerData;
	LP_AWAITING_CONNECTION_RESULT_DATA pResult = g_pServerTable->GetConnectionResultData();

	// Message 부터 뿌려준다.
	MyLog( LOG_NORMAL, "[FAILED TO CONNECT] %s Server %s(%d)", GetTypedServerText(pServerData->dwServerType), pServerData->szIP, pServerData->wPort );

	// ConnectType에 따른 처리.
	switch( pServerData->dwConnectType )
	{
	case CONNECT_TYPE_WITH_PROXY:
		{
			// Proxy Server 접속에 실패했다.
			// 타이머가 재접속을 시도하므로, 접속상태만 변경한다.
			if( (++pResult->dwResultCheckedServers) == pResult->dwToConnectServers )
			{
				pResult->dwConnectionType = CONNECT_TYPE_NONE;
				pResult->dwResultCheckedServers = 0;
				pResult->dwToConnectServers = 0;
			}
		}
		break;
	case CONNECT_TYPE_BATCH:
		{
			if( pResult->dwConnectionType != CONNECT_TYPE_BATCH )
			{
				MyLog( LOG_FATAL, "OnFailedToConnectServer() at CONNECT_TYPE_BATCH :: Illegal dwConnectionType(%d)", pResult->dwConnectionType );
#ifdef __ON_DEBUG
				_asm int 3;
#else
				g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
			}

			// 모든 배치커넥트 결과가 리턴되었으면 바인드한다.
			if( (++pResult->dwResultCheckedServers) == pResult->dwToConnectServers )
			{
				MyLog( LOG_NORMAL, "BatchConnect() Finished... %d(Total:%d) Servers are Tryied", pResult->dwToConnectServers, g_pServerTable->GetNumOfServers());

				// start server
				if( !g_pServerTable->StartServer( TYPE_SERVER_SIDE ) )
				{
					MyLog( LOG_FATAL, "SERVER_SIDE Socket Bind Failed!!!" );
					g_pServerTable->DestroyServer( FINISH_TYPE_BIND_FAILED );
					return;
				}
				MyLog( LOG_NORMAL, "SERVER_SIDE Socket Binded" );	
	
				// USER SIDE Socket 바인드.
				if( !g_pServerTable->StartServer( TYPE_USER_SIDE ) )
				{
					MyLog( LOG_NORMAL, "USER_SIDE Socket Bind Failed!!!" );
					g_pServerTable->DestroyServer( FINISH_TYPE_BIND_FAILED );
				}
				MyLog( LOG_NORMAL, "USER_SIDE Socket Binded" );
			}
		}
		break;
	case CONNECT_TYPE_BY_PROXY_ORDER:
		{
			if( pResult->dwConnectionType != CONNECT_TYPE_BY_PROXY_ORDER )
			{
				MyLog( LOG_FATAL, "OnFailedToConnectServer() at CONNECT_TYPE_BY_PROXY_ORDER :: Illegal dwConnectionType(%d)", pResult->dwConnectionType );
#ifdef __ON_DEBUG
				_asm int 3;
#else
				g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
			}

			// 모든 서버의 결과 체크가 끝났으면 결과를 프락시 서버에 알림.
			if( (++pResult->dwResultCheckedServers) == pResult->dwToConnectServers )
			{
				g_pServerTable->ReportOrderedConnectionResult();
			}
		}
		break;
	case CONNECT_TYPE_NONE:
	default:
		{
			MyLog( LOG_FATAL, "FATAL ERROR at OnFailedToConnectServer() :: ConnectType(%d) is NOT VALID!!!", pServerData->dwConnectType );
#ifdef __ON_DEBUG
			_asm int 3;
#else
			g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR );
#endif
		}
		break;
	}

	g_pServerTable->SetServerStatus( pServerData, STATUS_NOT_IN_NETWORK );
	pServerData->dwConnectType = CONNECT_TYPE_NONE;

	return;
}
