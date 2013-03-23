#pragma once

#include "stdafx.h"

typedef void (__stdcall *ACCEPTFUNC)(DWORD);
typedef void (__stdcall *RECVFUNC)(DWORD dwConnectionIndex,char* pMsg,DWORD dwLength);
			  
typedef void (__stdcall *VOIDFUNC)(void);
typedef	void (__stdcall *EVENTCALLBACK)(DWORD);					// Added by chan78 at 2001/10/17
typedef void (__stdcall *CONNECTSUCCESSFUNC)(DWORD dwConnectionIndex,void* pVoid);
typedef void (__stdcall *CONNECTFAILFUNC)(void* pVoid);
typedef void (__stdcall *DISCONNECTFUNC)(DWORD dwConnectionIndex);
typedef void (__stdcall *EVENTFUNC)(DWORD dwEventIndex );		// Modified by chan78 at 2001/10/17

#define	NETDDSC_ENCRYPTION			0x00000001
#define NETDDSC_DEBUG_LOG			0x00000010


enum FLAG_SEND
{
	
	FLAG_SEND_ENCRYPTION		=	0x00000001,
	FLAG_SEND_NOT_ENCRYPTION	=	0x00000000
};

struct CUSTOM_EVENT
{   
    DWORD		dwPeriodicTime;
	EVENTFUNC	pEventFunc;
	
	
};

struct PACKET_LIST
{
	char*			pMsg;
	DWORD			dwLen;
	PACKET_LIST*	pNext;
	DWORD			dwFlag;
};

struct DESC_NETWORK
{
    DWORD			dwMaxUserNum;
    DWORD			dwMaxServerNum;
	RECVFUNC		OnRecvFromUserTCP;
	RECVFUNC		OnRecvFromServerTCP;
	ACCEPTFUNC		OnAcceptUser;
	ACCEPTFUNC		OnAcceptServer;
	DISCONNECTFUNC	OnDisconnectUser;
	DISCONNECTFUNC	OnDisconnectServer;
	
    DWORD			dwServerMaxTransferSize;
    DWORD			dwUserMaxTransferSize;
    DWORD			dwServerBufferSizePerConnection;
    DWORD			dwUserBufferSizePerConnection;
    DWORD			dwMainMsgQueMaxBufferSize;
	DWORD			dwConnectNumAtSameTime;
    DWORD			dwFlag;
    DWORD			dwCustomDefineEventNum;
	
    CUSTOM_EVENT*	pEvent;
};
   
