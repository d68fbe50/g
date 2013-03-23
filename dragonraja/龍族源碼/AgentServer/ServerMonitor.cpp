// ----------------------------------------------------------------------
//    File Name: ServerMonitor.cpp
// Last Updated: 2000/11/28 (by chan78)
//  Description: Functions to handle commands that from Monitoring Client
// ----------------------------------------------------------------------
#include "ServerMonitor.h"
#include "servertable.h"
#include "RecvMsgFromUser.h"
#include "RecvMsgFromServer.h"
#include "mylog.h"

void SendConnectServerCount( DWORD dwConnectionIndex )
{
	t_packet packet;
	packet.h.header.type = CMD_SV_CONNECT_SERVER_COUNT;
	packet.u.kein.default_char = (unsigned char)g_pServerTable->GetNumOfConnectedServers();
	packet.h.header.size = sizeof( char );
	if( !g_pUserTable->SendToUserByConnectionIndex( dwConnectionIndex, (char *)&packet, sizeof(t_header)+packet.h.header.size) )
	{
		MyLog( LOG_FATAL, "SendConnectServerCount() :: Failed to send Packet(dwConnectionIndex:%d)", dwConnectionIndex );
	}
}

void SendCurrServerPort( DWORD dwConnectionIndex )
{
	t_packet packet;
	LP_SERVER_DATA cur = g_pServerTable->GetServerListHead();
	packet.h.header.type = CMD_SV_GET_CONNECT_SERVER_PORT;
	short int &count = packet.u.kein.server_port.count;
	count = 1;

	packet.u.kein.server_port.port[0] = g_pServerTable->GetOwnServerData()->wPort;
	
	while( cur )
	{
		if( cur->dwConnectionIndex != 0 ) {
			count++;
			packet.u.kein.server_port.port[count] = cur->wPort;
		}
		cur = cur->pNextServerData;
	}
	packet.h.header.size = sizeof( short int ) + sizeof( short int )*count;

	if( !g_pUserTable->SendToUserByConnectionIndex( dwConnectionIndex, (char*)&packet, sizeof(t_header)+packet.h.header.size ) ){
		MyLog( LOG_FATAL, "SendCurrServerPort() :: Failed to send Packet(dwConnectionIndex:%d)", dwConnectionIndex );
	}
}

void SendPbs( char *temp, int len )	
{
	t_packet p;
	
	if( temp == NULL )return;
	if( *temp == 0 ) return;
	if( len == 0 ) return;

	p.h.header.type = CMD_LOGIN_BBS;
		strcpy( p.u.login_bbs.bbs, temp );
	p.h.header.size = sizeof( t_login_bbs ) - MAX_PATH + len;

	g_pServerTable->BroadCastToEveryServer( (char*)&p, (WORD)p.h.header.size+sizeof( t_header ), SERVER_TYPE_MAP );
}