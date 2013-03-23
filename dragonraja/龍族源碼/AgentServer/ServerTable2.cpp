#include "servertable.h"
#include "servertable2.h"

#if defined (__IS_AGENT_SERVER) || defined(__IS_PROXY_SERVER)
#include "usertable.h"
#endif

#ifdef __IS_DB_DEMON
#include <sqltypes.h>
#include "Network.h"
#endif


// ------------------------------------------------------------------------------------------
// For Proxy Server
// ------------------------------------------------------------------------------------------
#ifdef __IS_PROXY_SERVER
bool RequestClearPayTable( DWORD dwConnectionIndex );

void CServerTable::OnConnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			if( !RequestClearPayTable( pServerData->dwConnectionIndex ) )
			{
				MyLog( LOG_FATAL, "AGENT SERVER UP :: Failed to request to clear PAY TABLE to DB DEMON" );
			}
		}
		break;
	case SERVER_TYPE_DB:
		{
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnDisconnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			if( !RequestClearPayTable( pServerData->dwConnectionIndex ) )
			{
				MyLog( LOG_FATAL, "AGENT SERVER UP :: Failed to request to clear PAY TABLE to DB DEMON" );
			}
		}
		break;
	case SERVER_TYPE_DB:
		{
			LP_SERVER_DATA pDummyServerData;

			// Clear Using Servers
			for( WORD i = 0; i < MAX_SERVER_NUM; i++ )
			{
				pServerData->ppUsingServers[i] = NULL;
			}

			// Unlink and change status
			for( pDummyServerData = g_pServerTable->GetServerListHead(); pDummyServerData; pDummyServerData = pDummyServerData->pNextServerData )
			{
				if( pDummyServerData->pUsingDBDemon && pDummyServerData->pUsingDBDemon == pServerData )
				{
					pDummyServerData->pUsingDBDemon = NULL;
					this->SetServerStatus( pDummyServerData, STATUS_AWAITING_DB_DEMON_SETTING );
				}
			}
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnChangeServerStatus( LP_SERVER_DATA pServerData )
{
	// 현재 아무것도 안함.
}
#endif
// ------------------------------------------------------------------------------------------



// ------------------------------------------------------------------------------------------
// For Agent Server
// ------------------------------------------------------------------------------------------
#ifdef __IS_AGENT_SERVER
void CServerTable::OnConnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
		}
		break;
	case SERVER_TYPE_AGENT:
		{
		}
		break;
	case SERVER_TYPE_DB:
		{
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
	return;
}
void CServerTable::OnDisconnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
			if( this->GetServerStatus() < STATUS_ACTIVATED )
			{
				// 부팅 시퀀스가 끝나기 전에 PROXY와 연결이 종료되었다.
				// 이 서버는 종료된다.
				this->DestroyServer( FINISH_TYPE_PROXY_LOST_CONNECTION_UNDER_BOOT_PROGRESS );
			}
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			// 다른 Agent가 죽은 경우, 별로 해줄건 없다.
		}
		break;
	case SERVER_TYPE_DB:
		{
			// DB Demon이 죽은 경우
			// DB Demon에 엔트리를 가진 모든 사용자를 잘라줘야 한다.
			g_pUserTable->RemoveAllUserByDBDemonConnectionIndex( pServerData->dwConnectionIndex );
		}
		break;
	case SERVER_TYPE_MAP:
		{
			// Map Server가 죽은 경우
			// Map Server에 엔트리를 가진 모든 사용자를 잘라줘야 한다.
			g_pUserTable->RemoveAllUserByMapServerConnectionIndex( pServerData->dwConnectionIndex );
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnChangeServerStatus( LP_SERVER_DATA pServerData )
{
}
#endif
// ------------------------------------------------------------------------------------------



// ------------------------------------------------------------------------------------------
// For DB Demon
// ------------------------------------------------------------------------------------------
#ifdef __IS_DB_DEMON
void CServerTable::OnConnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
		}
		break;
	case SERVER_TYPE_AGENT:
		{
		}
		break;
	case SERVER_TYPE_DB:
		{
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnDisconnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
			if( this->GetServerStatus() < STATUS_ACTIVATED )
			{
				// 부팅 시퀀스가 끝나기 전에 PROXY와 연결이 종료되었다.
				// 이 서버는 종료된다.
				this->DestroyServer( FINISH_TYPE_PROXY_LOST_CONNECTION_UNDER_BOOT_PROGRESS );
			}
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			// Agent가 죽은 경우. t_connection과 SERVER_DATA 의 인덱스를 정리해줘야 한다.
			memset( pServerData->dwUSERCN, 0, (sizeof(IDCN)*MAX_USER_NUM) );

			for( DWORD i = DRAGON_CONNECTIONS_START; i < MAX_USER_NUM; i++ )
			{
				if( connections[i].dwMyAgentIndex == pServerData->dwConnectionIndex )
				{
					connections[i].bUse = false;
					connections[i].dwMyAgentIndex = 0;
					connections[i].dwUserID = 0;
				}
			}
		}
		break;
	case SERVER_TYPE_DB:
		{
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnChangeServerStatus( LP_SERVER_DATA pServerData )
{
}
#endif
// ------------------------------------------------------------------------------------------



// ------------------------------------------------------------------------------------------
// For MAP Server
// ------------------------------------------------------------------------------------------
#ifdef __IS_MAP_SERVER

#include "..\HigherLayers\DefaultHeader.h"
#include "..\HigherLayers\Dr_Network.h"

void CServerTable::OnConnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			// -----------------------------
			// Alloc this Agent's CPackedMsg
			// -----------------------------
			CPackedMsg*	pPack = new CPackedMsg;
			m_ppPackedTable[this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT]] = pPack;
			pPack->SetConnectionIndex( pServerData->dwConnectionIndex );
			pPack->SetAgentServerIndex( this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT] );
		}
		break;
	case SERVER_TYPE_DB:
		{
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnDisconnectTypedServer( LP_SERVER_DATA pServerData )
{
	switch( pServerData->dwServerType )
	{
	case SERVER_TYPE_PROXY:
		{
			if( this->GetServerStatus() < STATUS_ACTIVATED )
			{
				// 부팅 시퀀스가 끝나기 전에 PROXY와 연결이 종료되었다.
				// 이 서버는 종료된다.
				this->DestroyServer( FINISH_TYPE_PROXY_LOST_CONNECTION_UNDER_BOOT_PROGRESS );
			}
		}
		break;
	case SERVER_TYPE_AGENT:
		{
			// ------------------------------
			// Remove this Agent's CPackedMsg
			// ------------------------------
			DWORD dwPackedIndex = 0;
	
			CPackedMsg* pPack = GetPackedMsg( &dwPackedIndex, pServerData->dwConnectionIndex);
			if ( pPack )
			{
				delete pPack;
				pPack = NULL;
				this->m_ppPackedTable[dwPackedIndex] = NULL;
			}
			this->m_ppPackedTable[dwPackedIndex] = this->m_ppPackedTable[this->m_dwNumOfTypedServers[SERVER_TYPE_AGENT]-1];

			// ---------------------------------
			// Close Connections From this Agent
			// ---------------------------------
			for( DWORD i = DRAGON_CONNECTIONS_START; i < DRAGON_MAX_CONNECTIONS; i++ )
			{
				if( connections[i].dwAgentConnectionIndex == pServerData->dwConnectionIndex )
				{
					closeconnection(connections, i, -1);
				}
			}
		}
		break;
	case SERVER_TYPE_DB:
		{
		}
		break;
	case SERVER_TYPE_MAP:
		{
		}
		break;
	default:
		{
			// Fatal
		}
		break;
	}
}
void CServerTable::OnChangeServerStatus( LP_SERVER_DATA pServerData )
{
}
#endif
// ------------------------------------------------------------------------------------------
