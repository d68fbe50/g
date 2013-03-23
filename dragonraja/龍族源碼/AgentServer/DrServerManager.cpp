// -----------------------------
// Wrote by chan78 at 2001/03/16
// -----------------------------
#include "DrServerManager.h"

#ifdef __IS_PROXY_SERVER
bool AnswerToManager( LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	pPacket->h.bPTCL = PTCL_MANAGER_ANSWER;

	return g_pUserTable->SendToUser( pPacket->h.uTarget.dwTargetManagerID, (char *)pPacket, dwLength );
}
#else
bool AnswerToManager( LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	pPacket->h.bPTCL = PTCL_MANAGER_ANSWER;

	// 현재로선 프락시 서버가 하나뿐이므로.
	return g_pServerTable->SendToProxyServer( (char*)pPacket, dwLength );
}
#endif

// -------------------------------------------------------------------
// PROXY SERVER 용
// -------------------------------------------------------------------
#ifdef __IS_PROXY_SERVER
bool OnRecvAuthMsgFromManager( USERINFO *pUserInfo, LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	if( dwLength != sizeof( MGR_REQUEST_AUTH_PACKET ) )
	{
		return false;
	}
	if( pPacket->h.bPTCL != PTCL_MANAGER_QUERY )
	{
		return false;
	}
	if( pPacket->h.wCMD != MANAGER_CMD_AUTH )
	{
		return false;
	}
	if( pPacket->h.uTarget.wTargetServerID != g_pServerTable->GetOwnServerData()->wPort )
	{
		return false;
	}
	if( strcmp(pPacket->b.myMgrRequestAuthPacket.szID, MANAGER_ID) )
	{
		return false;
	}
	if( strcmp(pPacket->b.myMgrRequestAuthPacket.szPasswd, MANAGER_PASSWD) )
	{
		return false;
	}
	return true ;
}
bool OnRecvMsgFromManager( USERINFO *pUserInfo, LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	char szSendMsg[MM_MAX_PACKET_SIZE];
	LP_MANAGER_PACKET pSendPacket = (LP_MANAGER_PACKET)szSendMsg;

	// 미리 채워둔다. Answer 용.
	pSendPacket->h.bPTCL = PTCL_MANAGER_ANSWER;
	pSendPacket->h.uTarget.dwTargetManagerID = pUserInfo->dwID;

	// PROXY SERVER 인 경우엔 이 함수로 넘겨진 패킷의 타겟이 내가 아닐수도 있다.
	// 다른 서버로 리다이렉션.
	if( pPacket->h.uTarget.wTargetServerID != g_pServerTable->GetOwnServerData()->wPort )
	{
		// 내가 처리할 패킷이 아니다. Redirection.
		LP_SERVER_DATA pServerData = g_pServerTable->GetServerData( pPacket->h.uTarget.wTargetServerID );

		// 타겟 서버가 없거나 접속되어있지 않다.
		if( !pServerData || !pServerData->dwConnectionIndex )
		{
			if( !AnswerToManager( pSendPacket, sizeof(MANAGER_PACKET_HEADER) ) )
			{
				MyLog( LOG_IMPORTANT, "MANAGER_CMD_TARGET_NOT_AVAILABLE :: Failed To Answer(dwID: %d, TargetServer:%d)", pUserInfo->dwID, pPacket->h.uTarget );
				return true;
			}
		}

		if( !g_pServerTable->Send( pServerData->dwConnectionIndex, (char *)pPacket, dwLength ) )
		{
			MyLog( LOG_IMPORTANT, "Failed To Send 'PTCL_MANAGER_QUERY' to (%d/Port:%d)", pServerData->dwConnectionIndex, pServerData->wPort );
		}
		return true;
	}

	// PROXY가 직접 처리할 것들.
	switch( pPacket->h.wCMD )
	{
	case MANAGER_CMD_REQUEST_SERVER_STATUS:
		{
			pSendPacket->b.myMgrServerStatusPacket.dwNumOfUsers = g_pUserTable->GetUserNum();
			pSendPacket->b.myMgrServerStatusPacket.dwTotalServerConnections = g_pServerTable->GetNumOfConnectedServers();
			pSendPacket->b.myMgrServerStatusPacket.dwStatus = g_pServerTable->GetOwnServerData()->dwStatus;
			sprintf( pSendPacket->b.myMgrServerStatusPacket.szServerName, "PROXY SERVER(%d)", g_pServerTable->GetOwnServerData()->wPort );

			if( !AnswerToManager( pSendPacket, (sizeof(MANAGER_PACKET_HEADER) + sizeof(MGR_SERVER_STATUS_PACKET)) ) )
			{
				MyLog( LOG_NORMAL, "MANAGER_CMD_REQUEST_SERVER_STATUS :: Failed To Answer" );
				break;
			}
		}
		break;
	default:
		{
			return false;
		}
	}
	return true;
}
#endif


// -------------------------------------------------------------------
// Agent SERVER 용
// -------------------------------------------------------------------
#ifdef __IS_AGENT_SERVER
bool OnRecvMsgFromManager( LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	char szSendMsg[MM_MAX_PACKET_SIZE];
	LP_MANAGER_PACKET pSendPacket = (LP_MANAGER_PACKET)szSendMsg;

	// 미리 채워둔다. Answer 용.
	pSendPacket->h.bPTCL = PTCL_MANAGER_ANSWER;
	pSendPacket->h.uTarget.dwTargetManagerID = pPacket->h.uTarget.dwTargetManagerID;

	switch( pPacket->h.wCMD )
	{
	case MANAGER_CMD_REQUEST_SERVER_STATUS:
		{
			pSendPacket->b.myMgrServerStatusPacket.dwNumOfUsers = g_pUserTable->GetUserNum();
			pSendPacket->b.myMgrServerStatusPacket.dwTotalServerConnections = g_pServerTable->GetNumOfConnectedServers();
			pSendPacket->b.myMgrServerStatusPacket.dwStatus = g_pServerTable->GetOwnServerData()->dwStatus;
			sprintf( pSendPacket->b.myMgrServerStatusPacket.szServerName, "AGENT SERVER(%d)", g_pServerTable->GetOwnServerData()->wPort );

			if( !AnswerToManager( pSendPacket, (sizeof(MANAGER_PACKET_HEADER) + sizeof(MGR_SERVER_STATUS_PACKET)) ) )
			{
				MyLog( LOG_NORMAL, "MANAGER_CMD_REQUEST_SERVER_STATUS :: Failed To Answer" );
				break;
			}
		}
		break;
	default:
		{
			return false;
		}
	}
	return true;
}
#endif


// -------------------------------------------------------------------
// Map SERVER 용
// -------------------------------------------------------------------
#ifdef __IS_MAP_SERVER
extern char MapName[ MAX_PATH];	

bool OnRecvMsgFromManager( LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	char szSendMsg[MM_MAX_PACKET_SIZE];
	LP_MANAGER_PACKET pSendPacket = (LP_MANAGER_PACKET)szSendMsg;

	// 미리 채워둔다. Answer 용.
	pSendPacket->h.bPTCL = PTCL_MANAGER_ANSWER;
	pSendPacket->h.uTarget.dwTargetManagerID = pPacket->h.uTarget.dwTargetManagerID;

	switch( pPacket->h.wCMD )
	{
	case MANAGER_CMD_REQUEST_SERVER_STATUS:
		{
			pSendPacket->b.myMgrServerStatusPacket.dwNumOfUsers = g_pServerTable->GetNumOfUsers();
			pSendPacket->b.myMgrServerStatusPacket.dwTotalServerConnections = g_pServerTable->GetNumOfConnectedServers();
			pSendPacket->b.myMgrServerStatusPacket.dwStatus = g_pServerTable->GetOwnServerData()->dwStatus;
			sprintf( pSendPacket->b.myMgrServerStatusPacket.szServerName, "MAP SERVER(%d/%s)", g_pServerTable->GetOwnServerData()->wPort, MapName );

			if( !AnswerToManager( pSendPacket, (sizeof(MANAGER_PACKET_HEADER) + sizeof(MGR_SERVER_STATUS_PACKET)) ) )
			{
				MyLog( LOG_NORMAL, "MANAGER_CMD_REQUEST_SERVER_STATUS :: Failed To Answer" );
				break;
			}
		}
		break;
	default:
		{
			return false;
		}
	}
	return true;
}
#endif


// -------------------------------------------------------------------
// DB Demon 용
// -------------------------------------------------------------------
#ifdef __IS_DB_DEMON
bool OnRecvMsgFromManager( LP_MANAGER_PACKET pPacket, DWORD dwLength )
{
	char szSendMsg[MM_MAX_PACKET_SIZE];
	LP_MANAGER_PACKET pSendPacket = (LP_MANAGER_PACKET)szSendMsg;

	// 미리 채워둔다. Answer 용.
	pSendPacket->h.bPTCL = PTCL_MANAGER_ANSWER;
	pSendPacket->h.uTarget.dwTargetManagerID = pPacket->h.uTarget.dwTargetManagerID;

	switch( pPacket->h.wCMD )
	{
	case MANAGER_CMD_REQUEST_SERVER_STATUS:
		{
			pSendPacket->b.myMgrServerStatusPacket.dwNumOfUsers = g_pServerTable->GetNumOfUsers();
			pSendPacket->b.myMgrServerStatusPacket.dwTotalServerConnections = g_pServerTable->GetNumOfConnectedServers();
			pSendPacket->b.myMgrServerStatusPacket.dwStatus = g_pServerTable->GetOwnServerData()->dwStatus;
			sprintf( pSendPacket->b.myMgrServerStatusPacket.szServerName, "DB DEMON(%d)", g_pServerTable->GetOwnServerData()->wPort );

			if( !AnswerToManager( pSendPacket, (sizeof(MANAGER_PACKET_HEADER) + sizeof(MGR_SERVER_STATUS_PACKET)) ) )
			{
				MyLog( LOG_NORMAL, "MANAGER_CMD_REQUEST_SERVER_STATUS :: Failed To Answer" );
				break;
			}
		}
		break;
	default:
		{
			return false;
		}
	}
	return true;
}
#endif
