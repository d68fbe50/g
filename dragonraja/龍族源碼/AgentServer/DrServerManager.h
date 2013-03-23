#pragma once
#include "ServerTable.h"

#if defined(__IS_AGENT_SERVER) || defined(__IS_PROXY_SERVER)
#include "UserTable.h"
#endif

#pragma pack(push, 1)

#define MANAGER_ID			"manager12"
#define MANAGER_PASSWD		"testok32"

typedef struct server_status
{
	DWORD		dwNumOfUsers;
	DWORD		dwTotalServerConnections;

	DWORD		dwStatus;
	char		szServerName[80+1];
} MGR_SERVER_STATUS_PACKET, *LP_MGR_SERVER_STATUS_PACKET;

typedef struct request_auth
{
	char		szID[16+1];
	char		szPasswd[16+1];
} MGR_REQUEST_AUTH_PACKET, *LP_MGR_REQUEST_AUTH_PACKET;

// -------------------------------------------------
typedef struct manager_packet_header
{
	BYTE		bPTCL;
	WORD		wCMD;
	DWORD		dwCRC;

	union
	{
		WORD		wTargetServerID;
		DWORD		dwTargetManagerID;
	} uTarget;

} MANAGER_PACKET_HEADER, *LP_MANAGER_PACKET_HEADER;

typedef struct manager_packet
{
	MANAGER_PACKET_HEADER h;
	
	union
	{
		MGR_SERVER_STATUS_PACKET	myMgrServerStatusPacket;
		MGR_REQUEST_AUTH_PACKET		myMgrRequestAuthPacket;
	} b;
} MANAGER_PACKET, *LP_MANAGER_PACKET;
// -------------------------------------------------

#pragma pack(pop)

#ifdef __IS_PROXY_SERVER
bool OnRecvMsgFromManager( USERINFO *pUserInfo, LP_MANAGER_PACKET pPacket, DWORD dwLength );
bool OnRecvAuthMsgFromManager( USERINFO *pUserInfo, LP_MANAGER_PACKET pPacket, DWORD dwLength );
bool AnswerToManager( LP_MANAGER_PACKET pPacket, DWORD dwLength );
#else
bool OnRecvMsgFromManager( LP_MANAGER_PACKET pPacket, DWORD dwLength );
bool AnswerToManager( LP_MANAGER_PACKET pPacket, DWORD dwLength );
#endif

// ---------------------------------------------------
// Commands
// ---------------------------------------------------

#define MANAGER_CMD_TARGET_NOT_AVAILABLE		101
#define MANAGER_CMD_AUTH						102

#define MANAGER_CMD_REQUEST_SERVER_STATUS		201
#define MANAGER_CMD_ANSWER_SERVER_STATUS		211
