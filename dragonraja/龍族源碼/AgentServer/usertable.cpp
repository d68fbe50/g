// ----------------------------------
// CUserTable by chan78 at 2001/01/20
// ----------------------------------

#include "usertable.h"
#include "servertable.h"
#include "AgentServer.h"
#include "monitor.h"
#include "dr_agent_structures.h"
#include "mylog.h"
#include <crtdbg.h>

//010909
inline bool RAJAEncodePacket(USERINFO* pUser, t_packet *p, int iLength,int ttt)
{
	short int t = p->h.header.type;
	pUser->en.Encrypt(p->h.data,2);
//	pUser->en.Encrypt(p->u.data,p->h.header.size);
	pUser->en.Encrypt(p->u.data,iLength-5);//020205 lsw
	
	//MyLog(1," Send type   %d ==> %d",t,p->h.header.type);

	p->h.header.crc = pUser->en.GetCRCConvertChar();
	
	return true;
}

CUserTable* g_pUserTable = NULL;

CUserTable::CUserTable(WORD wMaxBucketNum )
{
	m_wMaxBucketNum = wMaxBucketNum;
	m_dwDisconnectTick = 0;
	m_dwUserNum = 0;

	m_ppInfoTable = NULL;

	for( int i = 0; i<SIZE_OF_USER_DISCONNECT_TICK; i++ )
		this->m_pAwaitingDisconnectUserList[i] = NULL;

	m_dwUserNum = 0;
	m_dwSleepProcessTick = 0;//020420 lsw
	m_ppInfoTable = new USERINFO*[m_wMaxBucketNum];
	memset(m_ppInfoTable,0,sizeof(USERINFO*)*m_wMaxBucketNum);
}

CUserTable::~CUserTable()
{
	RemoveAllUserTable();

	if (m_ppInfoTable)
	{
				
		delete [] m_ppInfoTable;
		m_ppInfoTable = NULL;
	}
}

DWORD CUserTable::IncreaseDisconnectTick()
{
	this->m_dwDisconnectTick++;

	if( this->m_dwDisconnectTick >= SIZE_OF_USER_DISCONNECT_TICK )
		this->m_dwDisconnectTick = 0;

	return this->m_dwDisconnectTick;
}

// for login server
DWORD CUserTable::AddUser(DWORD dwConnectionIndex)
{
	char txt[128];
	static DWORD dwNewID = 0;

	memset(txt,0,128);

	if (!dwConnectionIndex)
		return false;

#ifdef __ON_DEBUG
	// dwConnectionIndex 가 혹시 중복되지 않는지 Check
	if( g_pINet->GetUserInfo( dwConnectionIndex ) )
	{
//		_asm int 3;
	}
#endif

	dwNewID++;
	if( dwNewID == 0 )
	{
		dwNewID++;
	}

	USERINFO* info = new USERINFO;

	_ASSERT( info );

	// Initialize
	memset(info,0,sizeof(USERINFO));
	info->dwConnectionIndex = 0;
	info->dwID = dwNewID;
	info->dwStatus = STATUS_USER_ACTIVATED;
	info->dwMapServerConnectionIndex = 0;
	info->dwConnectionIndex = dwConnectionIndex;
	info->wUDPPort = 0;
	info->dwAddress = g_pINet->GetUserAddress(dwConnectionIndex)->sin_addr.S_un.S_addr;
	info->bNameLength = 0;

	// g_pINet 에 셋팅.
	g_pINet->SetUserInfo(dwConnectionIndex,(void*)info);

	// 정보 얻기
	sockaddr_in* pSockAddrIn;
	if( !(pSockAddrIn = g_pINet->GetUserAddress(info->dwConnectionIndex)) )
	{
		delete info;
		return 0;
	}
	else
	{
		sprintf( info->szIP, "%d.%d.%d.%d"
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b1
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b2
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b3
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b4);
		info->wPort = pSockAddrIn->sin_port;
	}

	// Count User Num
	m_dwUserNum++;
	g_pServerTable->SetNumOfUsers( m_dwUserNum );

	AddUserInfo(info);

	return dwNewID;
}
void CUserTable::AddUserInfo( USERINFO* info )
{

	DWORD index = info->dwID%m_wMaxBucketNum;
	
	if (!m_ppInfoTable[index])
	{
		m_ppInfoTable[index] = info;
		info->pNextUserInfo = NULL;
		info->pPrvUserInfo = NULL;
		return;
	}

	USERINFO* cur = m_ppInfoTable[index];
	USERINFO* prv = NULL;

	while (cur)
	{
		prv = cur;
		cur = cur->pNextUserInfo;
	}
	
	cur = prv->pNextUserInfo = info;
	cur->pPrvUserInfo = prv;
	cur->pNextUserInfo = NULL;

	return;
}

USERINFO* CUserTable::GetUserInfo( DWORD dwID )
{
	DWORD index = dwID%m_wMaxBucketNum;

	USERINFO* cur = m_ppInfoTable[index];

	while (cur)
	{
		if (cur->dwID == dwID)
		{
			return cur;
		}
		cur = cur->pNextUserInfo;
	}
	return NULL;
}

USERINFO* CUserTable::GetUserInfo( const char* szName )		// 030224 kyo
{
	for( int i=0; i < m_wMaxBucketNum; i++ )
	{
		USERINFO* cur = m_ppInfoTable[i];
		while (cur)
		{
			if( 0 == stricmp( cur->szName, szName ) )
			{
				return cur;
			}
			cur = cur->pNextUserInfo;
		}	
	}
	
	return NULL;
}



void CUserTable::RemoveUser( DWORD dwConnectionIndex )
{
	USERINFO* pInfo = (USERINFO*)g_pINet->GetUserInfo(dwConnectionIndex);
	_ASSERT(pInfo);
	RemoveUserID(pInfo->dwID);
}

void CUserTable::RemoveUserID( DWORD dwID )
{
	DWORD index = dwID%m_wMaxBucketNum;

	USERINFO* cur = m_ppInfoTable[index];
	USERINFO* next = NULL;
	USERINFO* prv = NULL;
	
	while (cur)
	{
		prv = cur->pPrvUserInfo;
		next = cur->pNextUserInfo;
		if (cur->dwID == dwID)
		{
			// 접속종료대기리스트에 있는 경우
			if( cur->pUserInfoList )
			{
				USERINFO_LIST* pPrvUIList = cur->pUserInfoList->pPrvUserInfoList;
				USERINFO_LIST* pNextUIList = cur->pUserInfoList->pNextUserInfoList;

				if( !pPrvUIList && pNextUIList )
				{
					pNextUIList->pPrvUserInfoList = NULL;
					this->m_pAwaitingDisconnectUserList[cur->pUserInfoList->dwTick] = pNextUIList;
				}
				else if( pPrvUIList && !pNextUIList )
				{
					pPrvUIList->pNextUserInfoList = NULL;
				}
				else if( !pPrvUIList && !pNextUIList )
				{
					this->m_pAwaitingDisconnectUserList[cur->pUserInfoList->dwTick] = NULL;
				}
				else if( pPrvUIList && pNextUIList )
				{
					pPrvUIList->pNextUserInfoList = pNextUIList;
					pNextUIList->pPrvUserInfoList = pPrvUIList;
				}

				delete cur->pUserInfoList;
				cur->pUserInfoList = NULL;
			}

			if (!prv)	// if head
				m_ppInfoTable[index] = next;	
			else 
				prv->pNextUserInfo = next;
			
			if (next)
				next->pPrvUserInfo = prv;

			m_dwUserNum--;
			g_pServerTable->SetNumOfUsers( m_dwUserNum );

//			MyLog( LOG_IGNORE, "User (dwID:%d, szID:%s, dwConnectionIndex:%d) Removed From CUserTable", cur->dwID, cur->szName, cur->dwConnectionIndex );

			// g_pINet 에 셋팅된 UserInfo 를 제거
			g_pINet->SetUserInfo( cur->dwConnectionIndex, NULL );

			delete cur;
			cur = NULL;

			return;
		}
		cur = cur->pNextUserInfo;
	}
	return;
}

void CUserTable::RemoveAllUserTable()
{
	USERINFO* cur = NULL;
	USERINFO* next = NULL;
	for (DWORD i=0; i<m_wMaxBucketNum; i++)
	{
		cur = m_ppInfoTable[i];
		while (cur)
		{
			if( cur->pUserInfoList )
				delete cur->pUserInfoList;

			next = cur->pNextUserInfo;
			delete cur;
			cur = next;
		}
		m_ppInfoTable[i] = NULL;
	}
}

void CUserTable::DisconnectUserImmediately( DWORD dwConnectionIndex )
{
	g_pINet->CompulsiveDisconnectUser( dwConnectionIndex );
	return;
}
void CUserTable::SetTickForSleptTimeProcess( USERINFO *pUserInfo )
{
	pUserInfo->dwSleepProcessTick = this->m_dwSleepProcessTick;

	return;
}


void CUserTable::DisconnectUserImmediately( USERINFO *pUserInfo )
{
	_ASSERT( pUserInfo );
	g_pINet->CompulsiveDisconnectUser( pUserInfo->dwConnectionIndex );
	return;
}

DWORD CUserTable::RemoveAllUserByMapServerConnectionIndex( DWORD dwMapServerConnectionIndex )
{
	USERINFO* cur = NULL;
	int counter = 0;

	for( DWORD i = 0; i<m_wMaxBucketNum; i++ )
	{
		if( (cur = m_ppInfoTable[i]) )
		{
			if( cur->dwMapServerConnectionIndex == dwMapServerConnectionIndex )
			{
				// 연결 끊기.
				g_pUserTable->DisconnectUserBySuggest( cur, CMD_CLOSE_CONNECTION_ABNORMAL );
				counter++;
			}
		}
	}
	MyLog( LOG_NORMAL, "Map Server Connection Lost :: Close User Connections(%d Users Are Closed)", counter );

	return counter;
}

DWORD CUserTable::RemoveAllUserByDBDemonConnectionIndex( DWORD dwDBDemonConnectionIndex )
{
	USERINFO* cur = NULL;
	int counter = 0;

	for( DWORD i = 0; i<m_wMaxBucketNum; i++ )
	{
		if( (cur = m_ppInfoTable[i]) )
		{
			if( cur->dwDBDemonConnectionIndex == dwDBDemonConnectionIndex )
			{
				// 연결 끊기.
				g_pINet->CompulsiveDisconnectUser( cur->dwConnectionIndex );
				counter++;
			}
		}
	}
	MyLog( LOG_NORMAL, "DB Demon Connection Lost :: Close User Connections(%d Users Are Closed)", counter );

	return counter;
}


DWORD CUserTable::GetUserNum()
{
	return m_dwUserNum;
}

USERINFO_LIST* CUserTable::GetUserInfoList( DWORD dwTick )
{
	return this->m_pAwaitingDisconnectUserList[dwTick];
}

bool CUserTable::DisconnectUserBySuggest( USERINFO* pUserInfo, WORD wRajaCmdNum )
{
	t_packet packet;
	USERINFO_LIST *pUserInfoList;
	USERINFO_LIST *pToPut;

	// Build Packet
	packet.h.header.type = wRajaCmdNum;
	packet.h.header.size = 0;
	packet.h.header.crc = 0;

	if( !pUserInfo )
	{
		return false;
	}

	if( pUserInfo->dwConnectionIndex == 0 )
	{
		// dwConnectionIndex가 0인 pUserInfo는 있을 수 없다. 
//		_asm int 3;
		MyLog( LOG_FATAL, "DisconnectUserBySuggest() :: pUserInfo->dwConnectionIndex is NULL!!!!" );
		g_pUserTable->RemoveUserID( pUserInfo->dwID );
	}

	if( !g_pUserTable->SendToUser( pUserInfo, (char *)&packet, 5 ) )
	{
		MyLog( LOG_IMPORTANT, "DisconnectUserBySuggest() :: Failed To Suggest... Disconnect it." );
		g_pINet->CompulsiveDisconnectUser( pUserInfo->dwConnectionIndex );
		return false;
	}
	
	// Modified by chan78 at 2001/02/21
	pUserInfo->dwStatus = STATUS_USER_AWAITING_DISCONNECT;

	pUserInfoList = new USERINFO_LIST;
	memset( pUserInfoList, 0, sizeof( USERINFO_LIST ) );

	pToPut = this->m_pAwaitingDisconnectUserList[this->m_dwDisconnectTick];

	pUserInfoList->pUserInfo = pUserInfo;
	pUserInfoList->dwTick = this->m_dwDisconnectTick;

	if( pToPut )
	{
		pUserInfoList->pNextUserInfoList = pToPut;
		pToPut->pPrvUserInfoList = pUserInfoList;
	}
	else
	{
		pUserInfoList->pNextUserInfoList = pUserInfoList->pPrvUserInfoList = NULL;
		this->m_pAwaitingDisconnectUserList[this->m_dwDisconnectTick] = pUserInfoList;
	}

	return true;
}


// 접속종료 대기자들을 위한 처리.
DWORD CUserTable::CloseConnectionWithAwaitingToDisconnect()
{
	DWORD dwTargetTick = IncreaseDisconnectTick();
	DWORD dwCount = 0;

	USERINFO_LIST* pUserInfoList = this->m_pAwaitingDisconnectUserList[dwTargetTick];
	USERINFO_LIST* pNextUserInfoList;

	while( pUserInfoList )
	{
		dwCount++;
		g_pINet->CompulsiveDisconnectUser(pUserInfoList->pUserInfo->dwConnectionIndex);

		pNextUserInfoList = pUserInfoList->pNextUserInfoList;
		delete pUserInfoList;
		pUserInfoList = pNextUserInfoList;
	}
	this->m_pAwaitingDisconnectUserList[dwTargetTick] = NULL;

	return dwCount;
}

// 오랜시간 메시지 전송이 없는 사용자들을 위한 처리.
DWORD CUserTable::CloseConnectionWithSleepingUsers( void )
{
	static dwCounter = 0;
	DWORD dwDisconnected = 0;
	USERINFO *pUser = NULL;

	if( (++dwCounter) == 15 )
		dwCounter = 0;

	// 1초마다 들어오므로 15초에 한번씩 진입하도록 한다.
	if( dwCounter == 0 )
	{
		this->m_dwSleepProcessTick++;
		if( this->m_dwSleepProcessTick >= MAX_ALLOWED_SLEEP_TIME )
			this->m_dwSleepProcessTick = 0;

		for( WORD i = 0; i < this->m_wMaxBucketNum; i++ )
		{
			pUser = this->m_ppInfoTable[i];
			while (pUser)
			{
				if( pUser->dwSleepProcessTick == m_dwSleepProcessTick )
				{
					MyLog( LOG_IGNORE, "User %s Connection CLOSED :: No packet exchange.", pUser->szName );
					dwDisconnected++;
					this->DisconnectUserBySuggest( pUser, CMD_CLOSE_CONNECTION_SLEPT_TOO_LONG_TIME );
				}
				pUser = pUser->pNextUserInfo;
			}
		}
	}

	return dwDisconnected;
}

bool CUserTable::SendToUser( DWORD dwUserID, char* pMsg, DWORD dwLength )
{
	USERINFO *pUserInfo = this->GetUserInfo( dwUserID );
	
	return this->SendToUser( pUserInfo, pMsg, dwLength );
}

//010910 lsw
//예전 버전 SendTouser 내용 그대로임
bool CUserTable::SendToUserNoEncode( USERINFO* pUserInfo, char* pMsg, DWORD dwLength )
{
	if( !pUserInfo || !pUserInfo->dwConnectionIndex )
		return false;
	if( pUserInfo->dwStatus != STATUS_USER_ACTIVATED )
		return false;
	return g_pINet->SendToUser( pUserInfo->dwConnectionIndex, pMsg, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}

bool CUserTable::SendToUser( USERINFO* pUserInfo, char* pMsg, DWORD dwLength )
{
	if( !pUserInfo || !pUserInfo->dwConnectionIndex )
		return false;
	if( pUserInfo->dwStatus != STATUS_USER_ACTIVATED )
		return false;
	
	//패킷 인코딩 할 자리 여기만 하면 된다 위에 있는 함수도 여기로 들어오기 때문이다.
	t_packet p;
	memcpy(&p,pMsg,dwLength);
	RAJAEncodePacket(pUserInfo,&p, dwLength,1);
	return g_pINet->SendToUser( pUserInfo->dwConnectionIndex, (char*)(&p)	, dwLength, FLAG_SEND_NOT_ENCRYPTION );

//	return g_pINet->SendToUser( pUserInfo->dwConnectionIndex, pMsg	, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}

bool CUserTable::SendToUserByConnectionIndex( DWORD dwConnectionIndex, char* pMsg, DWORD dwLength )
{
	//패킷 인코딩 할 자리 여기만 하면 된다
	USERINFO *pUserInfo = (USERINFO*)g_pINet->GetUserInfo(dwConnectionIndex);
	t_packet p;
	memcpy(&p,pMsg,dwLength);
	RAJAEncodePacket(pUserInfo,&p, dwLength,2);
	return g_pINet->SendToUser( dwConnectionIndex, (char*)(&p)	, dwLength, FLAG_SEND_NOT_ENCRYPTION );

//	return g_pINet->SendToUser( dwConnectionIndex, pMsg	, dwLength, FLAG_SEND_NOT_ENCRYPTION );
}

bool CUserTable::IsUserAvailable( DWORD dwUserID )
{
	USERINFO* pUserInfo = this->GetUserInfo( dwUserID );

	return this->IsUserAvailable( pUserInfo );
}

bool CUserTable::IsUserAvailable( USERINFO* pUserInfo )
{
	bool result;

	if( !pUserInfo )
		return false;

	switch( pUserInfo->dwStatus )
	{
	case STATUS_USER_ACTIVATED:
		{
			result = true;
		}
		break;
	case STATUS_USER_INACTIVATED:
	case STATUS_USER_AWAITING_DISCONNECT:
		{
			result = false;
		}
		break;
	default:
		{
			result = false;
		}
		break;
	}

	return result;
}

