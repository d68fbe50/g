#ifndef PROTOCOL_H
#define PROTOCOL_H

#pragma once

#include "ServerIdentity.h"

#ifdef __IS_MAP_SERVER
#include "..\\stdafx.h"
#else
#include "stdafx.h"
#endif

#define MM_IP_LENGTH							21

enum PTCL
{
	// -------------------------------------------------
	PTCL_NONE									=	0,		// DO NOT USE
	// -------------------------------------------------

	// -------------------------------------------------
	PTCL_NOTIFY_SERVER_UP						=	1,		// SERVER TO SERVER
	PTCL_NOTIFY_YOU_ARE_CERTIFIED				=	2,
	PTCL_NOTIFY_SERVER_STATUS					=	3,
	PTCL_BROADCAST_TO_SERVERS					=	4,
	PTCL_SERVER_DATA_SYNC						=	5,
	PTCL_SERVER_TRY_TO_CHECK_CONNECTION			=	6,
	PTCL_SERVER_CONNECTION_OK					=	7,
	// -------------------------------------------------

	// Neogtiation Packets
	// -------------------------------------------------
	PTCL_REQUEST_SET_SERVER_LIST				=	10,		// Request
	PTCL_REQUEST_TO_CONNECT_SERVER_LIST			=	11,		//
	PTCL_REQUEST_SET_DB_DEMON					=	12,		//
	// -------------------------------------------------
	PTCL_ORDER_SET_SERVER_LIST					=	20,		// Order
	PTCL_ORDER_CONNECT_TO_SERVERS				=	21,		//
	PTCL_ORDER_SET_DB_DEMON						=	22,		//
	PTCL_ORDER_TO_REPORT_SERVER_DATAS			=	23,		//
	PTCL_ORDER_TO_REPORT_SERVER_STATUS			=	24,		//
	// -------------------------------------------------
	PTCL_SERVER_LIST_SETTING_RESULT				=	30,		// Result
	PTCL_SERVER_CONNECTING_RESULT				=	31,		//
	PTCL_DB_DEMON_SETTING_RESULT				=	32,		//
	PTCL_REPORT_SERVER_DATAS					=	33,		//
	PTCL_REPORT_SERVER_DESTROY					=	34,		//
	PTCL_REPORT_SERVER_ERROR					=	35,		//
	PTCL_REPORT_SERVER_STATUS					=	36,
	PTCL_REPORT_SERVER_CONNECTION_STATUS_CHANGE	=	37,
	// -------------------------------------------------

	// -------------------------------------------------
	PTCL_ORDER_TO_CLEAR_PAY_TABLE				=	41,		// PROXY's
	PTCL_ORDER_DESTROY_SERVER					=	42,
	// -------------------------------------------------

	// -------------------------------------------------
	PTCL_AGENT_TO_MAP							=	50,		// AGENT TO MAP
	PTCL_AGENT_TO_MAP_REQUEST_ADD_USER			=	51,
	PTCL_AGENT_TO_MAP_REQUEST_REMOVE_USER		=	52,
	PTCL_AGENT_TO_MAP_REQUEST_REMOVE_GHOST_USER = 	75,

	PTCL_AGENT_TO_DB							=	60,		// AGENT TO DB
	PTCL_AGENT_TO_DB_REQUEST_ADD_USER			=	61,
	PTCL_AGENT_TO_DB_REQUEST_REMOVE_USER		=	62,
	PTCL_AGENT_TO_DB_ADD_USER_TO_LOGIN_TABLE	=	63,
	PTCL_AGENT_TO_DB_REMOVE_USER_FROM_LOGIN_TABLE	= 64,
	// -------------------------------------------------

	// -------------------------------------------------
	PTCL_MAP_TO_AGENT							=	70,
	PTCL_MAP_TO_AGENT_USER_ACCEPTED				=	71,
	PTCL_MAP_TO_AGENT_USER_DENIED				=	72,
	PTCL_MAP_TO_AGENT_PACKED_MSG				=	73,
	PTCL_MAP_TO_AGENT_REQUEST_DISCONNECT_USER	=	74,
	PTCL_MAP_TO_AGENT_CHECK_IS_USER_GHOST		=	75,
	PTCL_MAP_TO_DB								=	80,
	PTCL_MAP_TO_MAP								=	81,
	PTCL_MAP_TO_MAP_HANDLE_COMMAND				=	82,
	// -------------------------------------------------

	// -------------------------------------------------
	PTCL_DB_ANSWER								=	80,			// DB TO AGENT/MAP
	PTCL_DB_TO_AGENT_REQUEST_DISCONNECT_USER_BY_ID	=	81,		// DB TO AGENT
	// -------------------------------------------------

	// -------------------------------------------------
	PTCL_MANAGER_QUERY							=	90,
	PTCL_MANAGER_ANSWER							=	91,
	// -------------------------------------------------
	
	// 011012 KBS
	PTCL_PROXY_TO_MAP							=	100,	//PROXY TO MAP
	PTCL_RM_FROM_PROXY							=   101,    //RM Message
	//
	//< CSD-030322
	PTCL_PROXY_TO_ACCESS 						=	102, // PROXY로 인증
	PTCL_AGENT_TO_COMMIT						=	103, // AGENT로 허가
	PTCL_PROXY_TO_LOGOUT						=	104  // AGENT로 허가
	//> CSD-030322
};

#define RESULT_DB_DEMON_SETTING_SUCCESSED			0
#define RESULT_DB_DEMON_IS_NOT_ACTIVATED			1
#define RESULT_DB_DEMON_IS_NOT_CONNECTED			2
#define RESULT_DB_DEMON_IS_NOT_IN_LIST				3

#pragma pack(push, 1)

typedef struct server_data_packet
{
	char					szIP[MM_IP_LENGTH];
	WORD					wPort;
	bool					bConnected;
} SERVER_CINFO, *LP_SERVER_CINFO;

typedef struct server_list_packet
{
	DWORD					dwServerSetNumber;
	WORD					wNum;
	SERVER_CINFO			pServerData[1];
} SERVER_CINFO_LIST_PACKET, *LP_SERVER_CINFO_LIST_PACKET;

typedef struct server_port_list_packet
{
	WORD					wNum;
	WORD					wPort[1];
} SERVER_PORT_LIST_PACKET, *LP_SERVER_PORT_LIST_PACKET;

typedef struct server_status_packet
{
	WORD					wPort;
	DWORD					dwStatus;
} SERVER_STATUS_PACKET, *LP_SERVER_STATUS_PACKET;

typedef struct server_error_packet
{
	DWORD					dwErrorCode;
	char					szError[1];
} SERVER_ERROR_PACKET, *LP_SERVER_ERROR_PACKET;

typedef struct server_notify_status_packet
{
	DWORD					dwServerStatus;
} NOTIFY_SERVER_STATUS_PACKET, *LP_NOTIFY_SERVER_STATUS_PACKET;

typedef struct server_report_status_packet
{
	DWORD					dwServerStatus;
	DWORD					dwNumOfUsers;
} REPORT_SERVER_STATUS_PACKET, *LP_REPORT_SERVER_STATUS_PACKET;

typedef struct user_data_packet
{
	WORD					wPort;
	DWORD					dwID;
} USER_DATA_PACKET, *LP_USER_DATA_PACKET;

typedef struct set_db_demon_packet
{
	WORD					wDBDemonPort;
} SET_DB_DEMON_PACKET, *LP_SET_DB_DEMON_PACKET;

typedef struct report_server_connection_status_packet
{
	BYTE					bConnectionType;
	WORD					wPort;
} REPORT_SERVER_CONNECTION_STATUS_PACKET, *LP_REPORT_SERVER_CONNECTION_STATUS_PACKET;

typedef struct set_db_demon_result_packet
{
	DWORD					dwResult;
} SET_DB_DEMON_RESULT_PACKET, *LP_SET_DB_DEMON_RESULT_PACKET;

//< CSD-030509
typedef struct check_is_user_ghost_packet
{
	DWORD dwID;
	char szID[20];
} CHECK_IS_USER_GHOST_PACKET, *LP_CHECK_IS_USER_GHOST_PACKET;
//> CSD-030509

typedef struct request_remove_ghost_user_packet
{
	DWORD dwID;
} REQUEST_REMOVE_GHOST_USER_PACKET, *LP_REQUEST_REMOVE_GHOST_USER_PACKET;

#pragma pack( pop )


#endif