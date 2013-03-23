// -------------------------------
// New RAJA Server Table
//
// Rewrote By chan78 at 2000/12/27
// -------------------------------

#ifndef SERVERTABLE_H
#define SERVERTABLE_H

#pragma once

#include "ServerIdentity.h"

#ifdef __IS_MAP_SERVER
#include "..\Stdafx.h"
#else
#include "Stdafx.h"
#endif

#include "define.h"
#include "packed.h"
#include "inetwork.h"
#include "protocol.h"
#include "MyLog.h"

#ifdef __IS_DB_DEMON
#include "struct.h"
#endif

class CPackedMsg;

enum SERVER_TYPE
{
	SERVER_TYPE_MAP						= 0,
	SERVER_TYPE_DB						= 1,
	SERVER_TYPE_AGENT					= 2,
	SERVER_TYPE_PROXY					= 3
};

enum FINISH_TYPE
{
	FINISH_TYPE_NORMAL					= 0,
	FINISH_TYPE_UNKNOWN_ERROR			= 1,
	FINISH_TYPE_SERVER_LIST_ACCEPT_FAIL	= 2,
	FINISH_TYPE_BY_PROXY				= 3,
	FINISH_TYPE_BIND_FAILED				= 4,
	FINISH_TYPE_BOOT_FAIL				= 5,
	FINISH_TYPE_PROXY_LOST_CONNECTION_UNDER_BOOT_PROGRESS	=	6
};

enum SERVER_STATUS
{
	STATUS_NOT_IN_NETWORK					= 0,
	STATUS_TRYING_TO_CONNECT				= 1,
	STATUS_AWAITING_PROXY_CONNECTION		= 2,
	STATUS_SERVER_LIST_CERTIFIED			= 3,
	STATUS_AWAITING_SERVER_LIST				= 4,
	STATUS_AWAITING_SET_SERVER_LIST_RESULT	= 5,
	STATUS_AWAITING_CONNECTION_ORDER		= 6,
	STATUS_AWAITING_CONNECTION_RESULT		= 7,
	STATUS_AWAITING_DB_DEMON_SETTING		= 8,
	STATUS_AWAITING_SET_DB_DEMON_RESULT		= 9,
	STATUS_ACTIVATED						= 10,
	STATUS_INACTIVATED						= 11,
	STATUS_CLOSING							= 12,
	STATUS_RELOAD_GAMESERVER_DATA			= 13,	//Added by KBS 020120
	STATUS_FINISH_RELOAD_GAMESERVER_DATA	= 14	//Added by KBS 020120
};

enum CONNECTION_STATUS
{
	CONNECTION_STATUS_NOT_LISTED		= 0,
	CONNECTION_STATUS_NOT_CONNECTED		= 1,
	CONNECTION_STATUS_TRYING_TO_CONNECT	= 2,
	CONNECTION_STATUS_CONNECTED_BETWEEN	= 3,
	CONNECTION_STATUS_CONNECTED			= 4,
	CONNECTION_STATUS_ACCEPTED			= 5,
};

enum CONNECT_TYPE
{
	CONNECT_TYPE_NONE					= 0,
	CONNECT_TYPE_WITH_PROXY				= 1,
	CONNECT_TYPE_BATCH					= 2,
	CONNECT_TYPE_BY_PROXY_ORDER			= 3
};

#define CONNECTION_CHECK_INTERVAL			60000								// 1분 (mil-sec 단위)
#define SERVER_CONNECTION_TIME_OUT			CONNECTION_CHECK_INTERVAL+30000		// 30초 (mil-sec 단위)
#define NUM_OF_SERVER_TYPES					4
#define NUM_OF_SERVER_STATUS				15	//Modified by KBS 020120

#define PROXY_SERVER_PORT_START				3000
#define PROXY_SERVER_PORT_FINISH			3999
#define DB_DEMON_PORT_START					4000
#define DB_DEMON_PORT_FINISH				4999
#define MAP_SERVER_PORT_START				5000
#define MAP_SERVER_PORT_FINISH				6999
#define AGENT_SERVER_PORT_START				7000
#define AGENT_SERVER_PORT_FINISH			7999

#define PRIMARY_SERVER						0
#define SECONDARY_SERVER					1

#define TYPE_SERVER_SIDE					0
#define TYPE_USER_SIDE						1

#define ERROR_UNKNOWN						0
#define ERROR_SERVER_CONNECTION_TIMED_OUT	1

#define SERVER_DEFAULT_OVERHEAD				10000

typedef struct communication_statistics_data
{
	// Total by bytes
	DWORD					dwTotalSendSize;
	DWORD					dwTotalReceivedSize;

	// Total by Packets
	DWORD					dwTotalSendPackets;
	DWORD					dwTotalReceivedPackets;

	// with each Servers by Size
	DWORD					dwBetweenServersSendSize[MAX_SERVER_NUM];
	DWORD					dwBetweenServersReceivedSize[MAX_SERVER_NUM];

	// with each Servers by Packet
	DWORD					dwBetweenServersSendPackets[MAX_SERVER_NUM];
	DWORD					dwBetweenServersReceivedPackets[MAX_SERVER_NUM];

	// by PTCLs
	DWORD					dwServerSendPTCLs[256];
	DWORD					dwServerReceivedPTCLs[256];

	// Classified Period
	DWORD					dwPeriod;				// mil-sec

	// Classified Time
	DWORD					dwStartTime;
	DWORD					dwFinishTime;
} COMMUNICATION_STATISTICS_DATA, *LP_COMMUNICATION_STATISTICS_DATA;

typedef struct hashed_server_data
{
	WORD					wPosInHashTable;
	struct server_data*		pServerData;

	struct hashed_server_data*	pPrevHashedServerData;
	struct hashed_server_data*	pNextHashedServerData;
} HASHED_SERVER_DATA, *LP_HASHED_SERVER_DATA;

typedef struct server_data
{
#ifdef __IS_PROXY_SERVER
	WORD					wServerIndex;
	struct server_data		*ppUsingServers[MAX_SERVER_NUM];
	struct server_data		*pUsingDBDemon;
#endif

#ifdef __IS_DB_DEMON
	IDCN					dwUSERCN[MAX_USER_NUM];
#endif

	DWORD					dwNumOfUsers;

	char					szIP[MM_IP_LENGTH];			// Server Side
	WORD					wPort;						// Server Side
	SERVER_TYPE				dwServerType;				// Server Side
	DWORD					dwConnectionIndex;			// Server Side
	DWORD					dwStatus;					// Server Side
	DWORD					dwConnectType;				// Connect Type

	DWORD					dwLastCheckAliveTime;		// For CheckAlive
	
	char					szIPForUser[MM_IP_LENGTH];	// User Side
	WORD					wPortForUser;				// User Side

	LP_HASHED_SERVER_DATA	pHashedServerData;			// Link For Hash Table
	struct server_data*		pNextServerData;

} SERVER_DATA, *LP_SERVER_DATA;

// 한 집합의 접속시도 결과를 체크하는데 쓰인다.
typedef struct awaiting_connection_result_data
{
	DWORD					dwConnectionType;

	DWORD					dwToConnectServers;
	DWORD					dwResultCheckedServers;

	char					szAnswer[MM_MAX_PACKET_SIZE];	// To Answer target

	LP_SERVER_DATA			pSender;						// To Answer target
} AWAITING_CONNECTION_RESULT_DATA, *LP_AWAITING_CONNECTION_RESULT_DATA;

typedef void (*ONCONFUNC)( LP_SERVER_DATA pServerData );
typedef void (*ONDISCONFUNC)( LP_SERVER_DATA pServerData );
typedef bool (*RECVMSGFUNC)( LP_SERVER_DATA pServerData, PTCL bID, char* pMsg, DWORD dwLength );

class CServerTable
{
private:
	// Private Members -------------------------------------------------
	// added by slowboat
	DWORD					m_dwMaxUserNum;
	DWORD					m_dwMaxUserNumPerSec;
	DWORD					m_dwNumOfUsersInServerSet;					
	
	WORD					m_wMaxBucketNum;							// Hashing 용 Bucket

	bool					m_bIsServerRunning;							// Is Server Running

	char					m_szNewMsg[MM_MAX_PACKET_SIZE];				// 패킷 Build용 버퍼.

	DWORD					m_dwServerSetNumber;						// 세트.

	DWORD					m_dwNumOfServerConnections;					// Serverside connections 수.
	DWORD					m_dwNumOfServers;							// 전체 Server 의 수.
	DWORD					m_dwNumOfTypedServers[NUM_OF_SERVER_TYPES];	// Server Type 별 Server 수.
	DWORD					m_dwNumOfConnectedServers;					// 정상작동중인 Server의 수.
	DWORD					m_dwNumOfUsers;								// 사용자 수.

	LP_SERVER_DATA			m_pOwnProxyServerData[2];					// PROXY Server의 Pointer;
	LP_SERVER_DATA			m_pOwnDBDemonData;							// DB Server의 Pointer;
	LP_SERVER_DATA			m_pServerListHead;							// Server List 의 Head
	LP_SERVER_DATA			m_pServerListTail;							// Server List 의 Tail
	LP_SERVER_DATA			m_pOwnServerData;							// Server의 자기정보.

	AWAITING_CONNECTION_RESULT_DATA	m_ConnectionResultData;			// 프락시에게 접속 결과를 알리기 위해 쓰인다.

	CPackedMsg**			m_ppPackedTable;							// CPackedMsg 테이블

	HASHED_SERVER_DATA**	m_ppServerTable;							// Server HashTable

	I4DyuchiNET*			m_pINet;									// INet Interface

	CRITICAL_SECTION		m_IsRunningCriticalSection;					// Critical Sections

	COMMUNICATION_STATISTICS_DATA	m_CommStatisticsData;				// 전송량 통계용 구조체.
#ifdef __IS_PROXY_SERVER
	CRITICAL_SECTION		m_IsUserAcceptAllowedCriticalSection;

	BYTE					m_bConnectionStatus[MAX_SERVER_NUM][MAX_SERVER_NUM];
	bool					m_bIsUserAcceptAllowed;

#endif
	// -----------------------------------------------------------------
	
	// Private Methods -------------------------------------------------
	void					RemoveAllServerDatasFromTable();			// 모든 서버를 List에서 제거.
	void					RemoveAllServerDatasFromList();				// 모든 서버를 HashTable에서 제거.
	void					SendServerUpMessage( DWORD index,WORD port );	// SendServer
	void					OnChangeServerStatus( LP_SERVER_DATA pServerData );	// 서버의 Status 가 변경된 경우...
	void					NotifyServerStatus();							// Server 의 status를 다른 서버에 알림.
	bool					NotifyServerStatus( LP_SERVER_DATA pToServer ); //
	bool					ReportServerStatus();							// 서버의 Status 를 PROXY에 알림.
	bool					ReportServerStatus( LP_SERVER_DATA pToServer );	//
	// -----------------------------------------------------------------

public:
	// Public Methods --------------------------------------------------
	void					ShowServerStatus();
	void					SendPackedMsg();
	void					SetServerStatus( DWORD dwStatus );
	void					SetServerStatus( LP_SERVER_DATA pServerData, DWORD dwStatus );
	void					OnConnectTypedServer( LP_SERVER_DATA pServerData );
	void					OnDisconnectTypedServer( LP_SERVER_DATA pServerData );
	void					DestroyServer( DWORD dwFinishType );
	void					CheckServerConnections();
	void					CloseServerConnection( LP_SERVER_DATA pServerData );
	void					CloseServerConnection( WORD wPort );
	void					ReportOrderedConnectionResult();

	// 통계용...
//	void					CollectTransStatistics( DWORD dwType, DWORD size );

	bool					AddServerDataToList( SERVER_DATA *pSeverData );
	bool					AddConnectedServerDataToHashTable( SERVER_DATA *pServerData, DWORD dwConnectionIndex );
	bool					StartServer( DWORD dwType );
	bool					ConnectToProxyServer();
	bool					ConnectToServer( LP_SERVER_DATA pServerData, DWORD dwConnectType );
	bool					ConnectToServer( WORD wServerID, DWORD dwConnectType );
	bool					InitServerTable( char* sFileName );
	bool					Send( WORD wServerID, char* pMsg, DWORD dwLength );
	bool					Send( DWORD dwConnectionIndex, char* pMsg, DWORD dwLength );
	bool					SendToProxyServer( char *pMsg, DWORD dwLength );
	bool					SendToDBDemon( char *pMsg, DWORD dwLength );
	bool					SendToDBDemon( DWORD dwConnectionIndex, char *pMsg, DWORD dwLength );
	bool					RemoveConnectedServerDataFromHashTable( DWORD dwConnectionIndex );
	bool					RequestToSetDBDemon();
	bool					IsServerActivated( LP_SERVER_DATA pServerData );
	bool					IsServerActivated( WORD wServerID );
	bool					IsServerRunning();
	bool					OnRecvNegotiationMsgs( LP_SERVER_DATA pSender, BYTE bID, char *pMsg, DWORD dwLength );
	bool					OnRecvServerUpMsg( DWORD dwConnectionIndex, WORD wPort );
	bool					OnRecvDestroyServerMsg( LP_SERVER_DATA pSender, BYTE bID, char *pMsg, DWORD dwLength );
	bool					ReportServerConnectionStatusChange( LP_SERVER_DATA pServerData, BYTE bConnectionStatus );

	bool					BeginNegotiationWithProxyServer( LP_SERVER_DATA pServerData );
	bool					BeginNegotiationWithNormalServer( LP_SERVER_DATA pServerData );

	DWORD					GetServerSetNum();
	DWORD					GetNumOfServers();
	DWORD					GetNumOfTypedServers( SERVER_TYPE dwServerType );
	DWORD					GetNumOfUsers();
	DWORD					SetNumOfUsers( DWORD dwNum );
	DWORD					GetNumOfConnectedServers();
	DWORD					GetServerStatus();
	DWORD					BroadCastToEveryServer( char* pMsg, DWORD dwLength );
	DWORD					BroadCastToEveryServer( char* pMsg, DWORD dwLength, SERVER_TYPE dwTarget );

	LP_SERVER_DATA			GetConnectedServerData( WORD wServerID );
	LP_SERVER_DATA			GetConnectedServerData( DWORD dwConnectionIndex );
	LP_SERVER_DATA			GetServerData( WORD wServerID );
	LP_SERVER_DATA			GetServerData( DWORD dwConnectionIndex );
	LP_SERVER_DATA			GetNewServerData( char ip[], WORD port );
	LP_SERVER_DATA			GetOwnServerData();
	LP_SERVER_DATA			GetServerListHead();
	LP_SERVER_DATA			GetOwnProxyServerData();
	LP_SERVER_DATA			GetOwnDBDemonData();
	LP_SERVER_DATA			GetAssignableAgentServer();

	LP_AWAITING_CONNECTION_RESULT_DATA	GetConnectionResultData()			{ return &m_ConnectionResultData; }

	CPackedMsg*				GetPackedMsg( DWORD dwConnectionIndex );
	CPackedMsg*				GetPackedMsg( DWORD* pdwPackedIndex,DWORD dwConnectionIndex );

#ifdef __IS_MAP_SERVER
	bool					SendRajaPacketToOtherMapServer( WORD wPort, char* szMsg, DWORD dwLength );
#endif

#ifdef __IS_PROXY_SERVER
	void 					AddNumOfUsersInServerSet()			{ m_dwNumOfUsersInServerSet++; }

	void					ShowServerConnectionStatus();
	void					ReBalanceDBDemonSettings();

	bool					DestroyOtherServer( WORD wServerID );
	bool					DestroyOtherServer( LP_SERVER_DATA pServerData );

	bool					IsUserAcceptAllowed();
	bool					ToggleUserAcceptAllowed();

	bool					SetDBDemon( LP_SERVER_DATA pTarget );
	bool					SetDBDemon( LP_SERVER_DATA pTargetServer, LP_SERVER_DATA pDBDemon );
	bool					SetServerConnectionStatus( LP_SERVER_DATA pServer, LP_SERVER_DATA pServer2, BYTE bType );
	bool					OrderToReportServerStatus( LP_SERVER_DATA pTargetServer );

	bool					LinkDBDemonSetting( LP_SERVER_DATA pTarget, LP_SERVER_DATA pDB );
	bool					ClearDBDemonSetting( LP_SERVER_DATA pServer );

	BYTE					GetServerConnectionStatus( LP_SERVER_DATA pServer, LP_SERVER_DATA pServer2 );

	DWORD					GetMaxUserNum()						{ return m_dwMaxUserNum; }
	DWORD					GetMaxUserNumPerSec()				{ return m_dwMaxUserNumPerSec; }
	DWORD					GetNumOfUsersInServerSet()			{ return m_dwNumOfUsersInServerSet; }

	DWORD					BatchConnect();
	DWORD					GetDBLoad( LP_SERVER_DATA pDBDemon );
	DWORD					CalcDBLoad( LP_SERVER_DATA pServer );

#endif

	// -----------------------------------------------------------------

	// Constructor, Destructor -----------------------------------------
	CServerTable( char* sFileName, WORD wMaxBucketNum, I4DyuchiNET* pINet );
	~CServerTable();
	// -----------------------------------------------------------------
};

// Global Variables
extern CServerTable*	g_pServerTable;
extern I4DyuchiNET*		g_pINet;

// Function Proto-types
char *GetTypedServerText( SERVER_TYPE type );
char *GetServerStatusText( DWORD dwStatus );
char *GetFinishTypeText( DWORD dwStatus );

extern DWORD dwBaseWeight[NUM_OF_SERVER_TYPES];
extern char ServerStatusSymbols[NUM_OF_SERVER_STATUS];

void __stdcall OnConnectServerSuccess( DWORD dwConnectionIndex, void *pVoidTypedServerData );
void __stdcall OnFailedToConnectServer( void *pVoidTypedServerData );

#endif
