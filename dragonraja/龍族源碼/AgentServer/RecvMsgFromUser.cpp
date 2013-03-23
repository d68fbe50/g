// -------------------------------
// ReWrite by chan78 at 2001/01/11
// -------------------------------
#include "dr_agent_structures.h"
#include "usertable.h"
#include "servertable.h"           
#include "mylog.h"
#include "RecvMsgFromUser.h"
#include "AgentServer.h"
#include "ServerMonitor.h"
#include "RecvMsgFromServer.h"
#include <crtdbg.h>
#include <time.h>
#include "CUseMoney.h" // 030325 kyo 태국 과금용

extern char szMsg[MAX_PACKET_SIZE];

extern bool SendHackingUser2DB( USERINFO *pUserInfo, int type,  char *cause ); // from agentserver.cpp
// FOR DEBUG by chan78 2001/02/21
DWORD dwMapChangeCounter = 0;

void __stdcall OnAcceptUser( DWORD dwConnectionIndex )
{
	sockaddr_in* pSockAddrIn;
	char szIP[21];
	WORD wPort;
	DWORD dwUserID;

	// 이 서버가 메시지를 정상적으로 받아서 처리할 수 있는 상황인지 검사.
	if( !g_pServerTable->IsServerActivated( g_pServerTable->GetOwnServerData() ) )
	{
		// 서버가 처리불능상태이므로 가차없이 끊는다.
		g_pINet->CompulsiveDisconnectUser( dwConnectionIndex );
		return;
	}

	// Address 얻기.
	{
		pSockAddrIn = g_pINet->GetUserAddress( dwConnectionIndex );
		_ASSERT( pSockAddrIn );
		sprintf( szIP, "%d.%d.%d.%d"
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b1
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b2
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b3
			, pSockAddrIn->sin_addr.S_un.S_un_b.s_b4
		);
		wPort = pSockAddrIn->sin_port;
	}

	// 추가 시도.
	dwUserID = g_pUserTable->AddUser( dwConnectionIndex );


	// 결과 처리.
	if( dwUserID )
	{
//		MyLog( LOG_IGNORE, "NEW USER(dwID:%d, dwConnectionIndex:%d, FromIP:%s, FromPort:%d) Added to CUserTable", dwUserID, dwConnectionIndex, szIP, wPort );

		///////////////////////////////////////////////////////////
		USERINFO *pUser = g_pUserTable->GetUserInfo(dwUserID);

		HSEL_INITIAL init;
					
		init.iEncryptType	=	HSEL_ENCRYPTTYPE_RAND;
		init.iDesCount		=	HSEL_DES_TRIPLE;
		init.iCustomize		=	HSEL_KEY_TYPE_DEFAULT;
		init.iSwapFlag		=	HSEL_SWAP_FLAG_ON;
		
		if(!pUser->en.Initial(init))
		{
			MyLog( LOG_FATAL, "HSEL INIT FAIL En(On Connect)", szIP, wPort );
		}

		if(!pUser->de.Initial(init))
		{
			MyLog( LOG_FATAL, "HSEL INIT FAIL De(On Connect)", szIP, wPort );
		}

		t_packet packet;
	
		packet.h.header.type = CMD_ON_CONNECT;
		packet.h.header.size = sizeof(t_OnConnectHselInit);
		packet.h.header.crc = 0;
		
		packet.u.OnConnectHselInit.eninit	= pUser->en.GetHSELCustomizeOption();
		packet.u.OnConnectHselInit.deinit	= pUser->de.GetHSELCustomizeOption();

		if( !g_pUserTable->SendToUserNoEncode( pUser, (char *)&packet, sizeof(t_OnConnectHselInit)+5 ) )
		{
			//인잇 되어 있는 패킷을 날려 준다.
			MyLog( LOG_FATAL, "User(%s:%d) Can't Recv Packet ", szIP, wPort );
		}
		///////////////////////////////////////////////////////////
//		MyLog( LOG_FATAL, "User-->>>  %d\n ",pUser);
	}
	else
	{
		MyLog( LOG_FATAL, "New User(%s:%d) Can't be ADDED ON CUserTable !!!", szIP, wPort );
		g_pINet->CompulsiveDisconnectUser( dwConnectionIndex );
	}

	return;
}


void __stdcall OnDisconnectUser( DWORD dwConnectionIndex )
{
	// 사용자가 다른 Server에 Entry를 갖고 있는 경우 제거해주는 처리를 한다.
	USERINFO *pUserInfo = (USERINFO*)g_pINet->GetUserInfo(dwConnectionIndex);

	// pUserInfo 검증.
#ifdef __ON_DEBUG
	ASSERT( pUserInfo );
#endif
	if( !pUserInfo )
	{
		MyLog(LOG_IGNORE, "Connection Closed Not Authed User Index %d", dwConnectionIndex );
		return;
	}
	// Map Server에 연결된 경우.
	if( pUserInfo->dwMapServerConnectionIndex )
	{
		szMsg[0] = (BYTE)PTCL_AGENT_TO_MAP_REQUEST_REMOVE_USER;
		memcpy(szMsg+1,&pUserInfo->dwID,4);

		if( !g_pServerTable->Send(pUserInfo->dwMapServerConnectionIndex,szMsg, 1+4) )
		{
			MyLog( LOG_IMPORTANT, "OnDisconnectUser() :: Failed to Send Notify Packet that User Lost connection to Map(%d)", pUserInfo->dwMapServerConnectionIndex );
			LP_SERVER_DATA pServerData = g_pServerTable->GetServerData( pUserInfo->dwMapServerConnectionIndex );
			if( pServerData == NULL )
			{
				MyLog( LOG_IMPORTANT, "-- PServerData(%d) is NULL!" );
			}
			else
			{
				MyLog( LOG_IMPORTANT, "-- %s(%s:%d)", GetTypedServerText(pServerData->dwServerType), pServerData->szIP, pServerData->wPort );
			}
		}
	}
	else if( pUserInfo->dwDBDemonConnectionIndex )
	{
		szMsg[0] = (BYTE)PTCL_AGENT_TO_DB_REQUEST_REMOVE_USER;
		memcpy(szMsg+1,&pUserInfo->dwID,4);

		if( !g_pServerTable->Send( pUserInfo->dwDBDemonConnectionIndex, szMsg, 5) )
		{
			g_pINet->CompulsiveDisconnectUser( pUserInfo->dwConnectionIndex );
			MyLog( LOG_NORMAL, "Can't send request to remove User %d from DB DEMON -- Close this connection", pUserInfo->dwID );
		}
	}
#ifdef __ON_DEBUG
	// DB Demon과 Map SERVER에 동시에 Entry를 갖고 있는 경우. 발생하면 안되는 예외상황.
	else if( pUserInfo->dwDBDemonConnectionIndex && pUserInfo->dwMapServerConnectionIndex )
	{
//		_asm int 3;
	}
#endif

	// DB의 Log-in Table Entry에서 제거한다.
	if( pUserInfo->bAmILogon )
	{
		// --------------
		// 2001/01/29, zhh
		time_t Logout;
		struct tm *now;												
		time( &Logout );
		now = localtime(&Logout);
		int year = now->tm_year + 1900;
		int mon  = now->tm_mon+1;
		int day  = now->tm_mday;
		int hour = now->tm_hour;
		int min  = now->tm_min;						
		int sec  = now->tm_sec;
		char logouttime[15];
		memset(logouttime,0,15);
		sprintf(logouttime,"%4d%2d%2d%2d%2d%2d", year, mon, day, hour, min, sec);
		// --------------

		szMsg[0] = (BYTE)PTCL_AGENT_TO_DB_REMOVE_USER_FROM_LOGIN_TABLE;
		memcpy(szMsg+1,&pUserInfo->dwID,4);
		memcpy(szMsg+1+4, &pUserInfo->szName, ID_LENGTH);
		memcpy(szMsg+1+4+ID_LENGTH, &g_pServerTable->GetOwnServerData()->wPort, 2 );

		//2001/01/29 zhh
		memcpy(szMsg+1+4+ID_LENGTH+2, logouttime,15);
		memcpy(szMsg+1+4+ID_LENGTH+2+15, pUserInfo->logintime,15);

		//2001/08/30 zhh
		memcpy(szMsg+1+4+ID_LENGTH+2+15+15, pUserInfo->szIP,20);

		if( pUserInfo->dwDBDemonConnectionIndex )
		{
			//2001/08/30 zhh
			if( !g_pServerTable->Send(pUserInfo->dwDBDemonConnectionIndex, szMsg, 1+4+ID_LENGTH+2+30+20) )
			{
				MyLog( LOG_IMPORTANT, "Failed To send 'PTCL_AGENT_TO_DB_REMOVE_USER_FROM_LOGIN_TABLE' to (%d)", pUserInfo->dwDBDemonConnectionIndex );
			}
		}
		else 
		{
			//2001/08/30 zhh
			if( !g_pServerTable->SendToDBDemon( szMsg, 1+4+ID_LENGTH+2+30+20) )
			{
				MyLog( LOG_IMPORTANT, "Failed To send 'PTCL_AGENT_TO_DB_REMOVE_USER_FROM_LOGIN_TABLE' to DBDemon", pUserInfo->dwDBDemonConnectionIndex );
			}
		}
	}
	//< CSD-030322
	static char szDummy[1 + ID_LENGTH];
	memset(szDummy, 0, sizeof(szDummy));
	szDummy[0] = BYTE(PTCL_PROXY_TO_LOGOUT);
	memcpy(szDummy + 1, pUserInfo->szName, ID_LENGTH);

	if (!g_pServerTable->SendToProxyServer(szDummy, 1 + ID_LENGTH))
	{
		MyLog(LOG_IMPORTANT, "Failed To send 'PTCL_PROXY_TO_LOGOUT' to Proxy");
	}
	//> CSD-030322

	// 030206 kyo
	//g_cAsyncPay.LogoutUser( pUserInfo );
	g_cAsyncPay.LogoutUser( dwConnectionIndex, pUserInfo->szName );

	// 실제로 Clear.
	g_pUserTable->RemoveUser(dwConnectionIndex);
	return;
}

void SendCMD_CONNECT_AGENT_SERVER_CONFORM(const DWORD dwUserID, const char* szUserName, const int nResult)//
{
	USERINFO* pUser =	(USERINFO*)g_pINet->GetUserInfo(dwUserID);
	
	if(!pUser){return;}

	if(::stricmp(szUserName,pUser->szName))//아까와 다른 유저 라면
	{
		return;
	}
	
	t_packet p;
	::memcpy(p.u.ConnectAgentServerConform.szUserID,pUser->szName,20);
	
	p.h.header.type = CMD_CONNECT_AGENT_SERVER_CONFORM;
	p.h.header.size = sizeof(CONNECTAGENTSERVERCONFORM);

	p.u.ConnectAgentServerConform.iKey = nResult;
__try{
	g_pUserTable->SendToUser( pUser, (char*)&p, sizeof(t_header)+sizeof(CONNECTAGENTSERVERCONFORM) );
}__except( EXCEPTION_EXECUTE_HANDLER )
{
	MyLog( 0, "ERROR IN SendCMD_CONNECT_AGENT_SERVER_CONFORM" );
}

}

void RecvCMD_CONNECT_AGENT_SERVER_CONFORM(USERINFO *pUser, t_packet *p)//
{// 태국 과금 붙는 곳
	__try // 030626 kyo
	{	//030703 lsw 아이디 길이 20 입니다. 저거 바꾸지 마세요 -_-..
		::memcpy( pUser->szName, p->u.ConnectAgentServerConform.szUserID,ID_LENGTH); // 030626 kyo //change size ID_LENGTH -> 40
		pUser->bAmILogon = false;

		if(LocalMgr.IsAbleNation(THAI)&& !LocalMgr.IsFreeBeta())
		{
			sockaddr_in* pSockAddrIn = g_pINet->GetUserAddress(pUser->dwConnectionIndex);
			char szUserIP[64] = {0, };
			sprintf(szUserIP, "%d.%d.%d.%d", pSockAddrIn->sin_addr.S_un.S_un_b.s_b1, 
											 pSockAddrIn->sin_addr.S_un.S_un_b.s_b2, 
											 pSockAddrIn->sin_addr.S_un.S_un_b.s_b3, 
											 pSockAddrIn->sin_addr.S_un.S_un_b.s_b4);
			g_cAsyncPay.LoginUser(pUser->dwConnectionIndex, 
				                  p->u.ConnectAgentServerConform.szUserID, 
								  p->u.ConnectAgentServerConform.szUserPASS, 
			                      CAsyncClient::GAME_ID, 
								  CAsyncClient::USER_TYPE, szUserIP, szUserIP);
		}
		else
		{	
			::SendCMD_CONNECT_AGENT_SERVER_CONFORM(pUser->dwConnectionIndex, pUser->szName, 100);//
		}
	}
	__except( EXCEPTION_EXECUTE_HANDLER )
	{
		MyLog( 0, "ERROR IN RecvCMD_CONNECT_AGENT_SERVER_CONFORM" );
	}
}

inline bool RAJADecodePacket(USERINFO* pUser, t_packet *p, int iLength)
{
	pUser->de.Decrypt(p->h.data,2);
	pUser->de.Decrypt(p->u.data,iLength-5);
	
	if( pUser->de.GetCRCConvertChar() != p->h.header.crc)
	{
		return false;
	}
	return true;
}


void __stdcall RecvMsgFromUser(DWORD dwConnectionIndex, char* pMsg, DWORD dwLength )
{
	t_packet *packet;
	t_packet *spacket;
	int cause =0;
	char sMsg[MAX_PACKET_SIZE];
	spacket = (t_packet *)(sMsg+1+4);
	
	// 이 서버가 메시지를 정상적으로 받아서 처리할 수 있는 상황인지 검사.
	if( !g_pServerTable->IsServerActivated( g_pServerTable->GetOwnServerData() ) )
	{
		// 서버가 STATUS_SERVER_ACTIVATED 이외의 상황이면 이미 정상적인 처리가 불가능한 경우이다.
		// 서버가 부팅중인 경우에는 USER측 소켓을 아예 바인드하지 않거나, 바인드를 하더라도 접속 불가
		// 패킷을 보낸 후 권고 접속종료를 시키고, 서버가 정상작동중에 INACTIVATED 된 경우라면 모든 사
		// 용자에게 권고 접송종료를 시키므로 이 메시지를 받는 경우는 다음과 같다.

		// 1) 아직 접속종료 패킷을 받기 전에 보낸 패킷인 경우.
		// 2) 서버/클라이언트쪽 코드가 잘못된 경우.
		// 3) 정상적인 클라이언트가 아닌 경우.

		// 판단할 방법이 없으므로 패킷을 무시하는 방식으로 대처한다.
		// 어차피 서버가 종료되면 다 잘린다.
		return;
	}

	// 송신자의 Identity 구하기.
	USERINFO *pUserInfo = (USERINFO*)g_pINet->GetUserInfo(dwConnectionIndex);
	// 송신자의 Identity는 무조건 정상값. 그외의 경우 프로그램의 버그.
	_ASSERT( pUserInfo );

	g_pUserTable->SetTickForSleptTimeProcess( pUserInfo );

	// Invalid User to be Disconnected..
#define IUD_PACKET_WRONG_SIZE_				10
#define IUD_PACKET_KEY_CODE_				11
#define IUD_STATUS_USER_NOT_CERTIFIED_		12

	// 기본사이즈 체크
	if( dwLength < sizeof(t_header) )
	{
//		MyLog( LOG_FATAL, "User(%d) :: Illegal Packet size(smaller than sizeof(t_header)) has received", dwConnectionIndex );
		// 사용자가 규격에 어긋나는 패킷을 보냈다.
		// 강제로 끊는다.
		MyLog( LOG_NORMAL, "** Too Small Packet From User" );
		cause = IUD_PACKET_WRONG_SIZE_;
		goto DISCONNECT_USER_FOR_ERROR_;
	}

	// Build Packet Header from string
	packet = (t_packet *)pMsg;

	// 정상적인 커넥션인지 확인.
	if( pUserInfo->dwStatus == STATUS_USER_NOT_CERTIFIED )
	{
		if( packet->h.header.type != CMD_ACCESS_LOGIN )
		{
			cause = IUD_STATUS_USER_NOT_CERTIFIED_;
			goto DISCONNECT_USER_FOR_ERROR_;
		}
	}
	else if( !g_pUserTable->IsUserAvailable( pUserInfo ) )
	{		
		// 비정상적인 커넥션.
		// 메시지 처리를 하지 않는다.
		return;
	}		
	
	//패킷 키 디코딩이 들어갈 자리	
	//if(pUserInfo->bAmILogon)
	{
		if(!RAJADecodePacket(pUserInfo, packet, dwLength))
		{
			MyLog( LOG_FATAL, "-------------------------", dwConnectionIndex, packet->h.header.type );
			MyLog( LOG_FATAL, "CRC Error From Usre", dwConnectionIndex, packet->h.header.type );

			char cause[ FILENAME_MAX];
			sprintf( cause, "Bad Packet Size %d:%d", packet->h.header.size, dwLength-sizeof(t_header) );
			SendHackingUser2DB( pUserInfo, 20008, cause );
			g_pUserTable->DisconnectUserBySuggest( pUserInfo, CMD_HACKING_USER );

			return;
		}

	}

	// Is it Valid packet?
	if( packet->h.header.size != (WORD)(dwLength-sizeof(t_header)) )
	{		
		MyLog( LOG_FATAL, "User(%d) :: Illegal Packet(%d) has received", dwConnectionIndex, packet->h.header.type );
		// 사용자가 규격에 어긋나는 패킷을 보냈다. 필요하면 여기서 끊어준다.
		//MyLog( LOG_NORMAL, "Invalid Packet From User(Size is not Valid) - Close It" );

		char cause[ FILENAME_MAX];
		sprintf( cause, "Bad Packet Size %d:%d", packet->h.header.size, dwLength-sizeof(t_header) );
		SendHackingUser2DB( pUserInfo, 20008, cause );
		g_pUserTable->DisconnectUserBySuggest( pUserInfo, CMD_HACKING_USER );
		return;
	}
	
	// Isn't it too big?
	if( packet->h.header.size > RAJA_MAX_PACKET_SIZE )
	{	
		MyLog( LOG_FATAL, "User(%d) :: Too Large Packet(%d) Received", dwConnectionIndex, packet->h.header.size);
		return;
	}	
		
		
	// ----------------------------------------------
	// 이곳에 라자 Agent Server의 패킷처리가 들어간다.
	// ----------------------------------------------
	switch( packet->h.header.type )
	{
	
	// 직접 처리할 Packet들 
	case CMD_CONNECT_AGENT_SERVER_CONFORM:
		{//태국 과금 받는곳
			::RecvCMD_CONNECT_AGENT_SERVER_CONFORM(pUserInfo,packet);//
		}break;	
	case CMD_ALL_READY:
		{
			// FOR DEBUG by chan78 2001/02/21
			dwMapChangeCounter--;
			LP_SERVER_DATA pTestServer;
			pTestServer = g_pServerTable->GetServerData( pUserInfo->dwMapServerConnectionIndex );
			if( !pTestServer )
			{		
				if( pUserInfo->dwMapServerConnectionIndex == 0 )
				{	
					//						MyLog( LOG_NORMAL, "CMD_ALL_READY (%d) (uID:%d, pUserInfo->dwMapServerConnectionIndex is NULL)", dwMapChangeCounter, pUserInfo->dwID );
				}	
				else
				{	
					//						MyLog( LOG_NORMAL, "CMD_ALL_READY (%d) (uID:%d, ---------------FATAL No Server To Redirect)", dwMapChangeCounter, pUserInfo->dwID );
				}	
			}		
			else	
			{		
				//MyLog( LOG_NORMAL, "CMD_ALL_READY (%d) (uID:%d, MapdwID:%d port:%d)", dwMapChangeCounter, pUserInfo->dwID, pUserInfo->dwMapServerConnectionIndex, pTestServer->wPort );
			}		
		}			
		goto ToMapServer_;
		
		
		
	case CMD_PING:
		break;
	case CMD_NONE:
		break;
	case CMD_LOST_CONNECTION:
		{
			//MyLog( LOG_IGNORE, "User connection closed by Client's Request" );
			g_pINet->CompulsiveDisconnectUser(dwConnectionIndex);
		}
		break;
		
		// Added by chan78 at 2000/11/28
		// Monitoring Client Related Packets
	case CMD_SV_CONNECT_SERVER_COUNT :
		{
			SendConnectServerCount( dwConnectionIndex );
		}
		break;
	case CMD_SV_GET_CONNECT_SERVER_PORT	:
		{	
			SendCurrServerPort( dwConnectionIndex );
		}	
		break;
		// Added by chan78 at 2000/12/07
		// 010109 KHS
	case CMD_SV_SEND_MESSAGE_ALL :		// 010110 YGI
		{
			SendPbs( packet->u.default_msg, packet->h.header.size ); 
			break;
		}
		
		//--------------------------------------------
		// 정보를 갈취하고 데이터를 변경해 보낼 패킷들
		//--------------------------------------------
	case CMD_ACCESS_LOGIN:
		{	
			t_packet to_send;
			SOCKADDR_IN* paddr = NULL;
			DWORD length = sizeof(t_header)+packet->h.header.size;
			
			::strupr( packet->u.ClientAccessLogin.id );
			::memcpy( &pUserInfo->szName, &packet->u.ClientAccessLogin.id, 20 );
			
			pUserInfo->bAmILogon = false;
			
			// IP 붙히기..
			::memcpy( &to_send, packet, length );
			paddr = g_pINet->GetUserAddress(dwConnectionIndex);
			::sprintf( to_send.u.ClientAccessLogin.ip, "%d.%d.%d.%d", paddr->sin_addr.S_un.S_un_b.s_b1
				, paddr->sin_addr.S_un.S_un_b.s_b2
				, paddr->sin_addr.S_un.S_un_b.s_b3
				, paddr->sin_addr.S_un.S_un_b.s_b4 );

			to_send.u.ClientAccessLogin.wPort = g_pServerTable->GetOwnServerData()->wPort;
			
			// 패킷전송
			if( !pUserInfo->dwMapServerConnectionIndex )
			{
				// Build Packet
				sMsg[0] = (BYTE)PTCL_AGENT_TO_DB;
				*((DWORD *)(sMsg+1)) = pUserInfo->dwID;
				to_send.h.header.size = to_send.h.header.size;	// Modified by chan78 at 2000/12/17
				::memcpy( sMsg+1+4, to_send.h.data, sizeof(t_header) );
				::memcpy( sMsg+1+4+sizeof(t_header), to_send.u.data, to_send.h.header.size );
				
				// 최초로 DB Demon에 메시지를 보내는 부분.
				if( g_pServerTable->GetOwnDBDemonData() && g_pServerTable->GetOwnDBDemonData()->dwConnectionIndex )
				{
					// 현재 AGENT가 사용하는 DB DEMON을 이 사용자가 엔트리를 보유한 DB Demon으로 설정한다.
					pUserInfo->dwDBDemonConnectionIndex = g_pServerTable->GetOwnDBDemonData()->dwConnectionIndex;
					
					if( !g_pServerTable->Send( pUserInfo->dwDBDemonConnectionIndex, (char*)&sMsg, (1+4+sizeof(t_header)+to_send.h.header.size)) )
					{
						g_pUserTable->DisconnectUserBySuggest( pUserInfo, CMD_CLOSE_CONNECTION_ABNORMAL );
						MyLog( LOG_FATAL, "Can't redirect Message to DB Demon -- Close this User");
					}
				}
				else
				{
					g_pUserTable->DisconnectUserBySuggest( pUserInfo, CMD_CLOSE_CONNECTION_ABNORMAL );
					MyLog( LOG_FATAL, "Can't redirect Message to DB Demon -- Close this User");
				}
			}
		}
		break;
		//-------------------------------------
		// DB Demon으로 redirection 할 Packet들
		//-------------------------------------
	case CMD_SELECTED_CHAR_RESULT_CLIENT_BOTH_DB_DEMON:
	case CMD_GLOBAL_CHAT_DATA:
	case CMD_IM_GAME_SERVER:
	case CMD_CREATE_CHAR:
	case CMD_DELETE_CHAR:
	case CMD_ISTHERE_CHARNAME:
	case CMD_THROW_DICE:
	case CMD_CREATE_ABILITY:
	case CMD_CHECK_NEW_CHAR:
	case CMD_CONNECT_INFO:
	case CMD_CHR_ITEM_INFO_0:
	case CMD_CHR_ITEM_INFO_1:
	case CMD_CHR_ITEM_INFO_2:
	case CMD_CHAR_INFO_MAGIC:
	case CMD_CHAR_INFO_SKILL:
	case CMD_CONNECT_INFO1:
	case CMD_SELECT_NATION :
	case CMD_RESET_JOB :
ToMapServer_:
		// Modified by chan78 at 2000/11/28
		// 위에 해당하는 커맨드라도 dwMapServerConnectionIndex가 있으면 MapServer로 보낸다.
		if( !pUserInfo->dwMapServerConnectionIndex )
		{
			// Build Packet
			sMsg[0] = (BYTE)PTCL_AGENT_TO_DB;
			*((DWORD *)(sMsg+1)) = pUserInfo->dwID;
			memcpy( sMsg+1+4, packet->h.data, sizeof(t_header) );
			memcpy( sMsg+1+4+sizeof(t_header), packet->u.data, packet->h.header.size );
			
			// Modified by chan78 at 2001/02/21
			if( pUserInfo->dwDBDemonConnectionIndex )
			{	
				if( !g_pServerTable->Send(pUserInfo->dwDBDemonConnectionIndex, sMsg, (1+4+sizeof(t_header)+packet->h.header.size)) )
				{
					MyLog( LOG_NORMAL, "Can't Redirect Client Packet to DB DEMON -- Close this connection", pUserInfo->dwID );
					g_pUserTable->DisconnectUserBySuggest( pUserInfo, CMD_CLOSE_CONNECTION_ABNORMAL );
				}
			}	
			else	
			{		
				if( !g_pServerTable->SendToDBDemon( sMsg, (1+4+sizeof(t_header)+packet->h.header.size)) )
				{	
					MyLog( LOG_FATAL, "Can't redirect Message to DB Demon -- Close this User");
					g_pUserTable->DisconnectUserBySuggest( pUserInfo, CMD_CLOSE_CONNECTION_ABNORMAL );
				}				
			}					
			break;					
		}						
		// ----------------------	
		// Map Server로 갈 패킷들	
		// ----------------------	
		// 이곳에서 MAP Server로 갈 Packet의 무결성을 검증해 걸러주는것이 좋다.
	default :					
		{						
			if( DWORD ToServ = pUserInfo->dwMapServerConnectionIndex ) 
			{	// Build Packet	
				switch( packet->h.header.type )
				{				
				case CMD_ACCESS_JOIN :	
					{
						sMsg[0] = (BYTE)PTCL_AGENT_TO_MAP;							// CMD ID
						*((DWORD *)(sMsg+1)) = pUserInfo->dwID;
						packet->h.header.size = sizeof( ACCESSJOIN );
						::memcpy( sMsg+1+4, packet, (sizeof(t_header)+packet->h.header.size) );	// t_packet
						::strcpy( packet->u.AccessJoin.ip, pUserInfo->szIP );
					}break;
				default :
					{
						sMsg[0] = (BYTE)PTCL_AGENT_TO_MAP;							// CMD ID
						*((DWORD *)(sMsg+1)) = pUserInfo->dwID;
						::memcpy( sMsg+1+4, packet, (sizeof(t_header)+packet->h.header.size) );	// t_packet
					}break;	
				}
				if( g_pINet->SendToServer( ToServ, sMsg, (1+4+sizeof(t_header)+packet->h.header.size),FLAG_SEND_NOT_ENCRYPTION ) == false ) 
				{
					::MyLog( LOG_FATAL, "User(%d) :: Can't redirect Message to Map Server(%d) :: Illegal Server Index", dwConnectionIndex, ToServ);
				}				
			}
			else 
			{			
				::MyLog( LOG_FATAL, "Client(%d) has not MapServer Index(%d)", pUserInfo->dwID, ToServ);
			}	//	클라이언트에게 끊으라는 패킷을 보내준다.				
		}						
		break;					
	}		


	return;


DISCONNECT_USER_FOR_ERROR_:

	g_pINet->CompulsiveDisconnectUser(dwConnectionIndex);
	
	return;
}
