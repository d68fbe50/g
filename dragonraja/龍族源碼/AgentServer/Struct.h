#ifndef STRUCT_H
#define STRUCT_H



#include "protocol.h"
#include "stdafx.h"
#include "define.h"

#pragma pack(push, 1)

struct POINT2D
{
	float x;
	float z;
};

typedef struct {
	BYTE	bID;
} DEFAULT, *LPDEFAULT;

typedef struct {
	BYTE	bID;
	WORD	wData1;
} IDWORD, *LPIDWORD;
typedef struct {
	BYTE	bID;
	WORD	wData1;
	WORD	wData2;
} IDWORD2, *LPIDWORD2;
typedef struct {
	BYTE	bID;
	BYTE	bData1;
} IDBYTE, *LPIDBYTE;

typedef struct {
	BYTE	bID;
	BYTE	bData1;
	BYTE	bData2;
} IDBYTE2, *LPIDBYTE2;

typedef struct {
	BYTE	bID;
	BYTE	bData1;
	WORD	wData1;
} IDBYTEWORD, *LPIDBYTEWORD;
typedef struct {
	BYTE	bID;
	BYTE	bData1;
	BYTE	bData2;
	WORD	wData1;
} IDBYTE2WORD, *LPIDBYTE2WORD;
typedef struct {
	BYTE	bID;
	BYTE	bData1;
	WORD	wData1;
	WORD	wData2;
} IDBYTEWORD2, *LPIDBYTEWORD2;
typedef struct {
	BYTE	bID;
	DWORD	dwData1;
} IDDWORD, *LPIDDWORD;
typedef struct {
	BYTE	bID;
	DWORD	dwData1;
	DWORD	dwData2;
} IDDWORD2, *LPIDDWORD2;
typedef struct {
	BYTE	bID;
	BYTE	bData1;
	DWORD	dwData1;
} IDBYTEDWORD, *LPIDBYTEDWORD;
typedef struct {
	BYTE	bID;
	WORD	wData1;
	DWORD	dwData1;
} IDWORDDWORD, *LPIDWORDDWORD;


struct CHAT_CLIENT_SEND
{
	BYTE	bID;
	BYTE	bStrLength;
	char	szMsg[MAX_CHAT_MSG_LENGHT];
	DWORD	GetPacketSize() {return bStrLength+2;}
	CHAT_CLIENT_SEND(char* msg);
};

struct CHAT_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwSpeakerID;
	BYTE	bStrLength;
	char	szMsg[MAX_CHAT_MSG_LENGHT];
	CHAT_CLIENT_RECV();
};

struct CHAT_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwSpeakerID;
	BYTE	bStrLength;
	char	szMsg[MAX_CHAT_MSG_LENGHT];
	DWORD	GetPacketSize() {return bStrLength+6;}
	CHAT_SERVER_SEND(char* msg,DWORD dwID);
};

struct CHAT_SERVER_RECV
{
	BYTE	bID;
	DWORD	dwSpeakerID;
	BYTE	bStrLength;
	char	szMsg[MAX_CHAT_MSG_LENGHT];
	CHAT_SERVER_RECV();
};

struct ATTACK_CLIENT_SEND
{
	BYTE	bID;
	DWORD	dwVictimID;
	BYTE	bAttackType;
};

struct ATTACK_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwAttackerID;
	DWORD	dwVictimID;
	BYTE	bAttackType;
};

struct ATTACK_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwAttackerID;
	DWORD	dwVictimID;
	BYTE	bAttackType;
};

struct ATTACK_SERVER_RECV
{
	BYTE	bID;
	DWORD	dwAttackerID;
	DWORD	dwVictimID;
	BYTE	bAttackType;
};
//===============================hun 6.13
struct ACTION_CLIENT_SEND
{
	BYTE	bID;
	BYTE	bActionNum;
};

struct ACTION_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bActionNum;
};

struct ACTION_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bActionNum;
};

struct ACTION_SERVER_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bActionNum;
};
//=============================
struct USERDEFAULT_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwUserID;
};
struct USERDEFAULT
{
	BYTE	bID;
	DWORD	dwUserID;
};

struct USERDEFAULT_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
};

/*==================================HUN 6.15
struct USERINFO_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bObjectType;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
	char	szUserName[16];
};
struct USERINFO_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bObjectType;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
	char	szUserName[16];
};
==========================================*/

struct DIRECTION_CLIENT_SEND
{
	BYTE bID;
	BYTE bDir;
};
struct DIRECTION_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bDir;
};
struct DIRECTION_SERVER_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bDir;
};
struct DIRECTION_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bDir;

};

struct POSITION_SET_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};
struct POSITION_SET_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwUserID;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};


struct POSITION_CLIENT_SEND
{
	BYTE	bID;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};

struct POSITION_SERVER_RECV
{
	BYTE	bID;
	DWORD	dwID;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};

struct POSITION_CLIENT_RECV
{
	BYTE	bID;
	DWORD	dwID;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};

struct POSITION_SERVER_SEND
{
	BYTE	bID;
	DWORD	dwMoverID;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};

struct POSITION_DEFAULT
{
	DWORD	dwDist;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
};
/*
struct USER_LOGIN
{
private:

	BYTE	bID;
	WORD	wUDPPort;
	BYTE	bNameLength;
	BYTE	bPasswordLength;
	char	szMsg[50];
public:
	BYTE	GetID() {return bID;}
	WORD	GetUDPPort() {return wUDPPort;}
	BYTE	GetNameLength() {return bNameLength;}
	BYTE	GetPasswordLength() {return bPasswordLength;}
	char*	GetName() {return szMsg;}
	char*	GetPassword() {return szMsg+bNameLength;}
	BYTE	GetPacketSize() {return 1+2+1+1+bNameLength+bPasswordLength;}
	USER_LOGIN(char* szName,char* szPassword,WORD port) 
	{
		bID = PTCL_USER_LOGIN_NAME_PASSWORD;
		bNameLength = lstrlen(szName);
		memcpy(szMsg,szName,bNameLength);
		bPasswordLength = lstrlen(szPassword);
		memcpy(szMsg+bNameLength,szPassword,bPasswordLength);
		wUDPPort = port;
	}
};
*/
//=============================HUN 6.15

struct USERINFO_DEFAULT
{
	BYTE	bAID;//============hun
	DWORD	dwUserID;
	WORD	bObjectType;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
	char	szUserName[16];
};

struct USERINFO_SERVER_SEND
{
	BYTE	bID;
	BYTE	bAID;//========hun
	DWORD	dwUserID;
	WORD	bObjectType;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
	char	szUserName[16];
};

struct USERINFO_CLIENT_RECV
{
	BYTE	bID;
	BYTE	bAID;//========hun
	DWORD	dwUserID;
	WORD	bObjectType;
	BYTE	bDir;
	float	fX;
	float	fY;
	float	fZ;
	char	szUserName[16];
};
//====================================
/*
struct USER_ADD_MULTI
{
	BYTE					bID;
	DWORD					dwUserNum;
	USERINFO_DEFAULT		UserInfo[1];
	DWORD					GetUserNum(){return dwUserNum;}
	USERINFO_DEFAULT*		GetUserInfo(DWORD index){return UserInfo+index;}
	void inline 			SetUserInfo(DWORD dwUserID,WORD bObjectType,char* szName,BYTE bDir,float x,float y,float z)
	{

		(UserInfo+dwUserNum)->dwUserID = dwUserID;
		(UserInfo+dwUserNum)->bObjectType = bObjectType;
		(UserInfo+dwUserNum)->bDir = bDir;
		(UserInfo+dwUserNum)->fX = x;
		(UserInfo+dwUserNum)->fY = y;
		(UserInfo+dwUserNum)->fZ = z;
		memcpy((UserInfo+dwUserNum)->szUserName,szName,lstrlen(szName));
		dwUserNum++;
	}
	DWORD					GetPacketSize() {return 1 + 4 + sizeof(USERINFO_DEFAULT)*dwUserNum;}
	void					Initialize() {bID = PTCL_USER_ADD_MULTI; dwUserNum = 0;}

};
*/
/*
struct USER_REMOVE_MULTI
{
	BYTE					bID;
	DWORD					dwUserNum;
	DWORD					dwUserID[1];
	DWORD					GetUserNum(){return dwUserNum;}
	DWORD					GetUserID(DWORD index){return *(dwUserID+index);}
	void inline 			SetUserID(DWORD dwID) {*(dwUserID+dwUserNum) = dwID; dwUserNum++;}
	void inline				Initialize() {bID = PTCL_USER_REMOVE_MULTI; dwUserNum = 0;}
	DWORD					GetPacketSize() {return 1 + 4 + 4*dwUserNum;}
};

struct UDP_PACKET
{
	WORD	wUDPPort;
	BYTE	bMsgLength;
	BYTE	bSerialNO;
	char	szMsg[256];

	WORD	inline GetUDPPort() {return wUDPPort;}
	BYTE	inline GetSerialNO() {return bSerialNO;}
	char*	GetMsg() {return szMsg;}
	BYTE	inline	GetMsgLength() {return bMsgLength;}
	DWORD	inline GetPacketSize() {return 2+1+1+bMsgLength;}
	UDP_PACKET(WORD wPort,char* msg,BYTE length,BYTE bSN)
	{
		memcpy(szMsg,msg,length);
		bMsgLength = length;
		wUDPPort = wPort; 
		bSerialNO = bSN;
	}

};
*/
/*
struct TEST_PACKET
{
	BYTE				bID;
	unsigned int		socket;
	char				szBuf[MAX_PACKET_SIZE-4];
	TEST_PACKET(unsigned int s,WORD len)
	{
		socket = s;
		bID = PTCL_TEST;
	}
};
*/
#pragma pack(pop)

#endif
