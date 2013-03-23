//
// Updated by chan78 at 2000/11/28
//
#pragma once
#include "dr_agent_structures.h"

extern DWORD g_NumOfContactedServers;

bool SendMsgToUser( DWORD dwConnectionIndex, char *sMsg, DWORD dwLength );
bool SendPacketToUser( DWORD dwConnectionIndex, t_packet *packet );

void __stdcall RecvMsgFromUser(DWORD dwConnectionIndex, char* pMsg, DWORD dwLength );
void BroadCastToUsers( char sMsg[], int dwLength );

void __stdcall OnAcceptUser(DWORD dwConnectionIndex);
void __stdcall OnDisconnectUser(DWORD dwConnectionIndex);
