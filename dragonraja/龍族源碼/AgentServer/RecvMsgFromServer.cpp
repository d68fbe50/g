// --------------------------------
// Re-Wrote by chan78 at 2001/01/10
// --------------------------------
#include "stdafx.h"//010909 lsw
#include "struct.h"
#include "monitor.h"
#include "servertable.h"
#include "usertable.h"
#include "RecvMsgFromServer.h"
#include "mylog.h"
#include "RecvMsgFromUser.h"
#include "AgentServer.h"
#include "dr_agent_structures.h"
#include <time.h>
#include "DrServerManager.h"
#include <mmsystem.h>
#include <stdlib.h>


char txt[128];
char szMsg[MAX_PACKET_SIZE];
// FOR DEBUG by chan78 2001/02/21
extern DWORD dwMapChangeCounter;

// 011205 KBS
extern void RMProc(DWORD dwConnectionIndex, char* pMsg, DWORD dwLength);

// ==========================================================================================
void __stdcall OnAcceptServer(DWORD dwConnectionIndex)
{
	SOCKADDR_IN* paddr = NULL;
	paddr = g_pINet->GetServerAddress(dwConnectionIndex);

	MyLog( LOG_NORMAL, "New Server-side Connection From [%d.%d.%d.%d] (Total:%d)", paddr->sin_addr.S_un.S_un_b.s_b1
														, paddr->sin_addr.S_un.S_un_b.s_b2
														, paddr->sin_addr.S_un.S_un_b.s_b3
														, paddr->sin_addr.S_un.S_un_b.s_b4
														, g_pServerTable->GetNumOfConnectedServers());
	return;
}
// ==========================================================================================


// ==========================================================================================
void __stdcall OnDisconnectServer(DWORD dwConnectionIndex)
{
	// 무지 중요한 멤버 함수
	g_pServerTable->RemoveConnectedServerDataFromHashTable(dwConnectionIndex);

	return;
}
// ==========================================================================================



// ==========================================================================================
void __stdcall RecvMsgFromServer( DWORD dwConnectionIndex, char *pMsg, DWORD dwLength )
{
	BYTE bID;
	bID = (BYTE)pMsg[0];
	USERINFO *pUser;

	if (dwConnectionIndex == 0)
	{
#ifdef __ON_DEBUG
//		_asm int 3;
#endif
		return;
	}

	if( bID == (BYTE)PTCL_NOTIFY_SERVER_UP )
	{
		if( g_pServerTable->OnRecvServerUpMsg(dwConnectionIndex, *(WORD*)(pMsg+1)) )
		{
#ifdef __ON_DEBUG
//			_asm int 3;
#endif
		}
		return;
	}

	LP_SERVER_DATA pSender = g_pServerTable->GetConnectedServerData( dwConnectionIndex );

	if( !pSender ) return;

	switch (bID)
	{
	// -------------
	// 기본패킷 
	// -------------
	// 전용
	case PTCL_ORDER_SET_SERVER_LIST:
	case PTCL_ORDER_CONNECT_TO_SERVERS:
	case PTCL_ORDER_SET_DB_DEMON:
	case PTCL_ORDER_TO_REPORT_SERVER_DATAS:
	case PTCL_NOTIFY_YOU_ARE_CERTIFIED:

	//공통
	case PTCL_ORDER_DESTROY_SERVER:
	case PTCL_NOTIFY_SERVER_STATUS:
 	case PTCL_SERVER_TRY_TO_CHECK_CONNECTION:
	case PTCL_SERVER_CONNECTION_OK:
	case PTCL_ORDER_TO_REPORT_SERVER_STATUS:
		{	
			if( !g_pServerTable->OnRecvNegotiationMsgs( pSender, bID, pMsg+1, dwLength-1 ) )
			{
				MyLog( LOG_FATAL, "OnRecvNegotiationMsg() Failed :: (pSender(%d), bId(%d), MsgLength(%d))", pSender->wPort, bID, dwLength );
#ifdef __ON_DEBUG
//				_asm int 3;
#endif
			}
		}	
		break;
	// ---------------
	// AGENT 전용 패킷
	// ---------------
	case PTCL_MAP_TO_AGENT_CHECK_IS_USER_GHOST:
		{	//< CSD-030515
			char szAnswer[64+1];
			LP_REQUEST_REMOVE_GHOST_USER_PACKET pAnswer = (LP_REQUEST_REMOVE_GHOST_USER_PACKET)(szAnswer + 1);
			LP_CHECK_IS_USER_GHOST_PACKET pPacket = (LP_CHECK_IS_USER_GHOST_PACKET)(pMsg + 1);
			
			if (pPacket->dwID <= 0)
			{
				MyLog( LOG_FATAL, "PTCL_MAP_TO_AGENT_CHECK_IS_USER_GHOST :: dwID < 0 !!! (From %d/%d)", dwConnectionIndex, pSender->wPort );
				break;
			}

			pUser = g_pUserTable->GetUserInfo(pPacket->dwID);

			if (pUser == NULL)
			{	//  없다. 이건 GHOST!
				szAnswer[0] = PTCL_AGENT_TO_MAP_REQUEST_REMOVE_GHOST_USER;
				pAnswer->dwID = pPacket->dwID;

				if( !g_pServerTable->Send(dwConnectionIndex, szAnswer, sizeof(BYTE)+sizeof(REQUEST_REMOVE_GHOST_USER_PACKET)))
				{
					MyLog(LOG_FATAL, "PTCL_MAP_TO_AGENT_CHECK_IS_USER_GHOST :: Failed To Answer!!! (From %d/%d)", dwConnectionIndex, pSender->wPort);
				}
				// Proxy에서 로그아웃을 하도록 함
				static char szDummy[1 + ID_LENGTH];
				memset(szDummy, 0, sizeof(szDummy));
				szDummy[0] = BYTE(PTCL_PROXY_TO_LOGOUT);
				memcpy(szDummy + 1, pPacket->szID, ID_LENGTH);

				if (!g_pServerTable->SendToProxyServer(szDummy, 1 + ID_LENGTH))
				{
					MyLog(LOG_IMPORTANT, "Failed To send 'PTCL_PROXY_TO_LOGOUT' to Proxy");
				}

				MyLog(LOG_FATAL, "PTCL_MAP_TO_AGENT_CHECK_IS_USER_GHOST :: User Name : %s!!! (From %d/%d)", pPacket->szID, dwConnectionIndex, pSender->wPort);
			}

			break;
		}	//> CSD-030515
	case PTCL_BROADCAST_TO_SERVERS:
		{	
			t_packet raja_packet;
			memset(&raja_packet,0,sizeof(t_packet));
			memcpy(raja_packet.h.data, pMsg+1, 5);
			memcpy(raja_packet.u.data, pMsg+1+5, raja_packet.h.header.size);
			char szName[21];
			// 패킷안의 이름 정보를 카피하고 널스트링을 넣는다 
			memcpy(szName,raja_packet.u.login_close_login_id.id,20);
			szName[20] = NULL;
			
			if (raja_packet.h.header.type == CMD_CLOSE_LOGIN_ID)
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
						if (strcmp(cur->szName,szName ) == 0)
						{
							// 해당 유저에게 끊도록 권고한다.
							g_pUserTable->DisconnectUserBySuggest( cur, CMD_CLOSE_CONNECTION_SAME_ID_LOGON );
						}
						cur = next;
					}
				}
			}
			break;
		}
		

	case PTCL_DB_TO_AGENT_REQUEST_DISCONNECT_USER_BY_ID:
	case PTCL_MAP_TO_AGENT_REQUEST_DISCONNECT_USER:
		{
			DWORD *dwUniqID;

			dwUniqID = (DWORD *)(pMsg+1);
			pUser = g_pUserTable->GetUserInfo(*dwUniqID);
			
			if (pUser != NULL) 
			{	//< CSD-030322		
				static char szDummy[1 + ID_LENGTH];
				memset(szDummy, 0, sizeof(szDummy));
				szDummy[0] = BYTE(PTCL_PROXY_TO_LOGOUT);
				memcpy(szDummy + 1, pUser->szName, ID_LENGTH);

				if (!g_pServerTable->SendToProxyServer(szDummy, 1 + ID_LENGTH))
				{
					MyLog(LOG_IMPORTANT, "Failed To send 'PTCL_PROXY_TO_LOGOUT' to Proxy");
				}
				
				// 접속을 끊도록 권고한다.
				g_pUserTable->DisconnectUserBySuggest( pUser, CMD_CLOSE_CONNECTION_NORMAL );
				MyLog( LOG_NORMAL, "User(%d) SUGGESTED to DISCONNECT by %s(%d)", pUser->dwConnectionIndex, GetTypedServerText(pSender->dwServerType), dwConnectionIndex );
			}	//> CSD-030322

			break;
		}
	case PTCL_DB_ANSWER:
		{
			DWORD *dwUniqID;
			bool redirect_to_client = true;		// default must be true

			dwUniqID = (DWORD *)(pMsg+1);

			t_packet *p = (t_packet *)(pMsg + 1 + 4);

			pUser = g_pUserTable->GetUserInfo(*dwUniqID);
			if (pUser) 
			{
				switch( p->h.header.type ) {
				// ---------------------------
				// Client에게 보내지 않을 패킷
				// ---------------------------
				// Modified by chan78 at 2000/12/09 :: 동일 ID 동시접속
				case CMD_CLOSE_LOGIN_ID:
					{
						char szName[21];

						// 패킷안의 이름 정보를 카피하고 널스트링을 넣는다 
						memcpy( szName, p->u.login_close_login_id. id, 20 );
						szName[20] = 0;
							
						if( !strcmp( szName, pUser->szName ) )
						{	
							// 해당 유저를 끊는다.
							g_pUserTable->DisconnectUserBySuggest( pUser, CMD_CLOSE_CONNECTION_SAME_ID_LOGON );
							//g_pINet->CompulsiveDisconnectUser(pUser->dwConnectionIndex);
						}	
						else
						{	
							MyLog( LOG_IMPORTANT, "CMD_CLOSE_LOGIN_ID: Name is not match!!! '%s', '%s'", szName, pUser->szName );
						}	
					}		
					redirect_to_client = false;
					break;
				// ---------------------------------
				// 여기서부터는 Client에게 보낼 패킷
				// ---------------------------------
				case CMD_CONNECT_INFO:
					{
						// Setting Server informations
						WORD port = p->u.server_connect_info.port;
						if( g_pUserTable->GetUserInfo( *dwUniqID ) && g_pServerTable->GetConnectedServerData(port) ) {
							g_pUserTable->GetUserInfo( *dwUniqID )->dwMapServerConnectionIndex = g_pServerTable->GetConnectedServerData(port)->dwConnectionIndex;
						} else {
							MyLog( LOG_FATAL, "Invalid dwUniqID(%d) or ServerID(%d)", *dwUniqID, port );
						}
						//MyLog( LOG_IGNORE, "User %d took map Server %d(%d)", *dwUniqID, p->u.server_connect_info.port, g_pUserTable->GetUserInfo( *dwUniqID )->dwMapServerConnectionIndex );

						// LOGIN 과정에서 DB에 기록된 사용자 정보의 제거를 요청한다.
						szMsg[0] = (BYTE)PTCL_AGENT_TO_DB_REQUEST_REMOVE_USER;
						memcpy(szMsg+1,dwUniqID,4);		// (dwUniqID == &(*dwUniqID) 해깔리지 마세요.

						if( pUser->dwDBDemonConnectionIndex )
						{
							if( !g_pServerTable->Send( pUser->dwDBDemonConnectionIndex, szMsg, 5) )
							{
								g_pUserTable->DisconnectUserBySuggest( pUser, CMD_CLOSE_CONNECTION_ABNORMAL );
								MyLog( LOG_IMPORTANT, "Failed To send 'PTCL_AGENT_TO_DB_REQUEST_REMOVE_USER' to (%d)", pUser->dwDBDemonConnectionIndex );
							}
						}
						else
						{
							if( !g_pServerTable->SendToDBDemon( szMsg, 5 ) )
							{
								g_pUserTable->DisconnectUserBySuggest( pUser, CMD_CLOSE_CONNECTION_ABNORMAL );
								MyLog( LOG_IMPORTANT, "Failed To send 'PTCL_AGENT_TO_DB_REQUEST_REMOVE_USER' to (%d)", pUser->dwDBDemonConnectionIndex );
							}
						}
					}
					break;
				case CMD_ACCEPT_LOGIN:
					{	//< CSD-030322 
						pMsg[0] = BYTE(PTCL_PROXY_TO_ACCESS);

						if(LocalMgr.IsAbleNation(JAPAN))
						{
							t_packet packet;
							::memcpy(packet.h.data, pMsg+1+4,5);
							::memcpy(packet.u.data, pMsg+1+4+5, packet.h.header.size);
							
							DWORD pUniqID = *(DWORD*)(pMsg + 1);
							USERINFO *pUserInfo = g_pUserTable->GetUserInfo(pUniqID);

							if(!pUserInfo)
							{
								MyLog(LOG_IMPORTANT, "RecvMsgFromServer(CMD_ACCEPT_LOGIN) Can Not Take UserInfo (%d)", pUniqID);
								break;
							}

							::memcpy(pUserInfo->szName, packet.u.server_accept_login.id,20);
							MyLog(LOG_IMPORTANT, "RecvMsgFromServer(CMD_ACCEPT_LOGIN) User ID Copy: '%s'",pUserInfo->szName);
						}

						if (!g_pServerTable->SendToProxyServer(pMsg, dwLength))
						{
							MyLog(LOG_IMPORTANT, "Failed To send 'PTCL_PROXY_TO_ACCESS' to Proxy");
							break;
						}
						return;
					}//> CSD-030322

					case CMD_INVALID_ID		:
					case CMD_INVALID_PW		:
					case CMD_INVALID_DB		:
					case CMD_INVALID_PAY		:
					case CMD_INVALID_VERSION	:
					case CMD_INVALID_AGE		: // 030923 kyo
						{
							//010925 lsw
							//if( !g_pUserTable->SendToUserNoEncode( pUser, (pMsg+1+4), (dwLength-1-4) ) )
							if( !g_pUserTable->SendToUser( pUser, (pMsg+1+4), (dwLength-1-4) ) )
							{
								MyLog( LOG_FATAL, "WARNNING:: Failed To Redirect DB Demon's Packet to User(%d)", pUser->dwConnectionIndex );
							}
							return;
						}
						break;
				default:
					break;
				}

				if( redirect_to_client )
				{
					if( !g_pUserTable->SendToUser( pUser, (pMsg+1+4), (dwLength-1-4) ) )
					{
						MyLog( LOG_FATAL, "WARNNING:: Failed To Redirect DB Demon's Packet to User(%d)", pUser->dwConnectionIndex );
					} else {
						//MyLog( LOG_FATAL, "Got Message From DB Demon(id:%d UniqID:%d dwLength:%d)(type:%d)", bID, *dwUniqID, dwLength, p->h.header.type );
					}
				}
			}
			else	// pUser Is NULL
			{
				// Added by chan78 at 2001/02/09
				if( p->h.header.type == CMD_ACCEPT_LOGIN )
				{	
					// Request Remove From '[TotalDB].LoginTable' to DB DEMON
					szMsg[0] = (BYTE)PTCL_AGENT_TO_DB_REMOVE_USER_FROM_LOGIN_TABLE;

					memcpy(szMsg+1, &(*dwUniqID),4);
					memcpy(szMsg+1+4, p->u.server_accept_login.id, ID_LENGTH );
					memcpy(szMsg+1+4+ID_LENGTH, &g_pServerTable->GetOwnServerData()->wPort, 2 );
					if( !g_pServerTable->Send(dwConnectionIndex, szMsg, 1+4+ID_LENGTH+2) )
					{
						MyLog( LOG_FATAL, "--- Warnning!!! Failed to Send PTCL_USER_LIST_CONNECTION!!!" );
					}
				}
				else if( p->h.header.type == CMD_CLOSE_LOGIN_ID )
				{
					// CMD_CLOSE_LOGIN_ID를 받았지만 유저가 USERLIST에 존재하지 않는 경우.
					// 이경우는 로그할 필요가 있다.
					szMsg[0] = (BYTE)PTCL_AGENT_TO_DB_REMOVE_USER_FROM_LOGIN_TABLE;

					memcpy(szMsg+1, &(*dwUniqID),4);
					memcpy(szMsg+1+4, p->u.login_close_login_id.id, ID_LENGTH );
					memcpy(szMsg+1+4+ID_LENGTH, &g_pServerTable->GetOwnServerData()->wPort, 2 );
					
					if( !g_pServerTable->Send(dwConnectionIndex, szMsg, 1+4+ID_LENGTH+2) )
					{
						MyLog( LOG_FATAL, "--- Warnning!!! Failed to Send PTCL_USER_LIST_CONNECTION!!!" );
					}
					MyLog( LOG_IMPORTANT, "CMD_CLOSE_LOGIN_ID received illegal pUser!!!" );
				}
//				else MyLog( LOG_FATAL, "DB Demon Sent Illegal dwUniqID(%d)", *dwUniqID );
			}		
		}			
		break;
	case PTCL_MAP_TO_AGENT_PACKED_MSG:
		{
			t_packet *packet;
			// bSend 는 Agent가 가로채 처리한 후 client에게 전송 할것인가 말것인가를 결정한다. 기본값 참.
			bool bSend = true;

			CPackedMsg*	pPackedMsg = (CPackedMsg*)pMsg;
			DWORD dwUserNum = pPackedMsg->GetUserNum();
			//USERINFO_CLIENT_RECV* pInfo = (USERINFO_CLIENT_RECV*)pMsg->GetMsg();

			// 받은 패킷을 클라이언트로 보내준다.
			packet = (t_packet*)(pPackedMsg->GetMsg());
			if( (sizeof(t_header) + packet->h.header.size) != pPackedMsg->GetMsgLength() )
			{
				MyLog( LOG_IGNORE, "MapServer(%d) Send Illegal PackedMsg, Ignore It!", dwConnectionIndex);
				return;
			}

			for (DWORD i=0; i<dwUserNum; i++)
			{
				DWORD dwUserID = pPackedMsg->GetUser(i);
				USERINFO *pUser = g_pUserTable->GetUserInfo(dwUserID);
				if( !pUser )
				{
					//MyLog( LOG_FATAL, "PTCL_PACKED_USER :: User %d Not Found from MAP(%d)", dwUserID, dwConnectionIndex );

					// Modified by chan78 at 2000/12/16 :: 걔 없다 끊어달라고 요청.
					szMsg[0] = (BYTE)PTCL_AGENT_TO_MAP_REQUEST_REMOVE_USER;
					memcpy(szMsg+1,&dwUserID,4);

					if( !g_pServerTable->Send( dwConnectionIndex, szMsg, 5 ) ) {
						MyLog( LOG_IMPORTANT, "-- Requst Remove that Player(dwUniqID:%d) to Map Server(dwConnectionIndex:%d)", dwUserID, dwConnectionIndex );
						LP_SERVER_DATA pServerData = g_pServerTable->GetServerData( dwConnectionIndex );
						if( pServerData == NULL )
						{
							MyLog( LOG_IMPORTANT, "-- PSList(%d) is NULL!" );
						}
						else
						{
							MyLog( LOG_IMPORTANT, "-- %s(%s:%d)", GetTypedServerText(pServerData->dwServerType), pServerData->szIP, pServerData->wPort );
						}
					}
					continue;
				}

				switch(packet->h.header.type)
				{
				//-----------------------------------------------------------------------------
				// Map Change의 처리 :: Agent는 이 Packet을 hooking해 Map Server의 ID를 바꾼다.
				//-----------------------------------------------------------------------------
				case CMD_CHANGE_MAP:
					{
						char szAnswer[16+1];
						t_packet *pAnswer;
						pAnswer = (t_packet *)(szAnswer+1+4);

						LP_SERVER_DATA pServerData = g_pServerTable->GetConnectedServerData((WORD)packet->u.server_change_map.port);
						if( !pServerData || !pServerData->dwConnectionIndex ) {
							// 서버 ID(port)로 dwConnectionIndex를 구할 수 없으면 접속을 끊어버린다.
							// 알림 패킷을 보내려면 여기서 보내야한다.
							MyLog( LOG_FATAL, "User %s Failed to CHANGE MAP :: Server(port:%d) Is Not Connected", pUser->szName, packet->u.server_change_map.port );
							g_pINet->CompulsiveDisconnectUser( pUser->dwConnectionIndex );
						}

						// Change Map Server
						pUser->dwMapServerConnectionIndex = pServerData->dwConnectionIndex;
						//MyLog( LOG_FATAL, "User %d CHANGE map Server to %d(%d)", dwUserID, pServerData->wPort, pServerData->dwConnectionIndex );

						// Added by chan78 at 2001/02/22 :: Answer To Map
						szAnswer[0] = (BYTE)PTCL_AGENT_TO_MAP;
						memcpy( szAnswer+1, &dwUserID, sizeof(DWORD) );

						pAnswer->h.header.type = CMD_CHANGE_MAP_DETECTED;
						pAnswer->h.header.size = 0;

						if( !g_pServerTable->Send( dwConnectionIndex, szAnswer, 1+4+sizeof(t_header) ) )
						{
							//MyLog( LOG_IMPORTANT, "Fail to Send 'CMD_CHANGE_MAP_DETECTED' to MAP(%d)", dwConnectionIndex );
						}
					
						// FOR DEBUG by chan78 2001/02/21
						dwMapChangeCounter++;
						//MyLog( LOG_NORMAL, "CMD_CHANGE_MAP (%d) (uID:%d, MapdwID:%d port:%d )", dwMapChangeCounter, dwUserID, pServerData->dwConnectionIndex, packet->u.server_change_map.port );

						bSend = true;
					}
					break;

				default:
					// Do nothing.
					break;
				}
				// 전송한다.
				if( bSend ) {
					if (pUser)
					{
						//패킷 키 인코딩 할 자리 
						if( !g_pUserTable->SendToUser(pUser, pPackedMsg->GetMsg(), pPackedMsg->GetMsgLength() ) )
						{
							// 끊는다.
						}
					} else {
						MyLog( LOG_FATAL, "PTCL_PACKED_USER :: User %d Not Found", i );
					}
				}
			}
		}
		break;
	// Added by chan78 at 2001/03/16
	// -----------------------------
	case PTCL_MANAGER_QUERY:
		{
			if( !OnRecvMsgFromManager( (LP_MANAGER_PACKET)pMsg, dwLength ) )
			{
				MyLog( LOG_FATAL, "PTCL_MANAGER_ANSWER :: OnRecvMsgFromManager() has return false(%d)", pSender->wPort );
				break;
			}
		}
		break;
	// Added by chan78 at 2001/03/16
	case PTCL_MANAGER_ANSWER:
		{
			// 있을 수 없다.
			MyLog( LOG_FATAL, "PTCL_MANAGER_ANSWER :: has received!!!(%d)", pSender->wPort );
			g_pServerTable->DestroyServer( FINISH_TYPE_UNKNOWN_ERROR);
		}
		break;
	// -----------------------------

	// Added by KBS 011012
	case PTCL_RM_FROM_PROXY:
		{
			RMProc(dwConnectionIndex, pMsg, dwLength);
		}
		break;
	//
	case PTCL_AGENT_TO_COMMIT:
		{	//< CSD-030322
			// When A User Connaction Accepted
			DWORD* pUniqID = (DWORD*)(pMsg + 1);
			pUser = g_pUserTable->GetUserInfo(*pUniqID);

			if (pUser == NULL)
			{
				break;
			}

			pUser->bAmILogon = true;
			//2001/01/29 zhh
			time_t Login;
			struct tm *now;
			time( &Login );
			now = localtime(&Login);
			int year = now->tm_year + 1900;
			int mon  = now->tm_mon+1;
			int day  = now->tm_mday;
			int hour = now->tm_hour;
			int min  = now->tm_min;
			int sec  = now->tm_sec;

			char logintime[15];
			memset(logintime,0,15);
			sprintf(logintime,"%4d%2d%2d%2d%2d%2d", year, mon, day, hour, min, sec );
			memcpy(pUser->logintime, logintime, 15);
			
			if (!g_pUserTable->SendToUser(pUser, (pMsg + 1 + 4), dwLength - 4 - 1))
			{
				MyLog( LOG_FATAL, "WARNNING:: Failed To Redirect DB Demon's Packet to User(%d)", pUser->dwConnectionIndex );
			}
						
			break;
		}	//> CSD-030322
	default:
		{
			MyLog( LOG_FATAL, "Unknown SERVER PACKET(%d, %d)!", bID, dwConnectionIndex );
//			_asm int 3;
			break;
		}
		break;
	}
	return;
}
// ==========================================================================================

