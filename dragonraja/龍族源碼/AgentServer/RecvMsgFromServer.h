#ifndef __RECV_MSG_H
#define __RECV_MSG_H

#pragma once
#include "stdafx.h"
#include "usertable.h"


void __stdcall OnAcceptServer(DWORD dwConnectionIndex);
void __stdcall OnDisconnectServer(DWORD dwConnectionIndex);

void __stdcall RecvMsgFromServer(DWORD dwConnectionIndex,char* pMsg,DWORD dwLength);

USERINFO* GetNewUserConnection(DWORD dwConnectionIndex, bool flag);

#endif