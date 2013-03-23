#include "struct.h"

CHAT_CLIENT_SEND::CHAT_CLIENT_SEND(char* msg)
{
	bStrLength = lstrlen(msg);
	memcpy(szMsg,msg,bStrLength);
}

CHAT_SERVER_SEND::CHAT_SERVER_SEND(char* msg,DWORD dwID)
{	
	bStrLength = lstrlen(msg);
	dwSpeakerID = dwID;
	memcpy(szMsg,msg,bStrLength);
}
CHAT_CLIENT_RECV::CHAT_CLIENT_RECV()
{
	memset(szMsg,0,MAX_CHAT_MSG_LENGHT);
}
CHAT_SERVER_RECV::CHAT_SERVER_RECV()
{
	memset(szMsg,0,MAX_CHAT_MSG_LENGHT);

}
