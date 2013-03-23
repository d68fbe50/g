#ifndef SERVER_H
#define SERVER_H

#include "inetwork.h"
bool StartAgentServer();
void EndAgentServer();

extern I4DyuchiNET* g_pINet;
extern HANDLE hKeyEvent[3];



#endif
