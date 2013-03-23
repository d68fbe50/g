#ifndef USERTABLE_H
#define USERTABLE_H

#include "stdafx.h"
#include "struct.h"
#include "servertable.h"
#include "dr_agent_structures.h"//010707 lsw

#define SIZE_OF_USER_DISCONNECT_TICK		5
#define MAX_ALLOWED_SLEEP_TIME				5			// x*15, 75초.

#define STATUS_USER_NOT_CERTIFIED			0
#define STATUS_USER_ACTIVATED				1
#define STATUS_USER_INACTIVATED				2
#define STATUS_USER_AWAITING_DISCONNECT		3

class CConnection;

struct USERINFO;
struct USERINFO_LIST;

struct USERINFO
{
	DWORD			dwConnectionIndex;
	DWORD			dwID;
	DWORD			dwStatus;
	DWORD			dwAddress;

	USERINFO_LIST*	pUserInfoList;

#ifdef __IS_AGENT_SERVER
	DWORD			dwSleepProcessTick;

	DWORD			dwMapServerConnectionIndex;
	DWORD			dwDBDemonConnectionIndex;
#endif

	BYTE			bNameLength;

	char			szName[21];
	char			szIP[21];

	bool			bAmILogon;
	bool			bOnConnectUserCalled;

	WORD			wUDPPort;
	WORD			wPort;

	//2001/01/29 zhh
	char			logintime[15];		//로그인 한 시간 저장
	
	CHSEL_STREAM	en;	
	CHSEL_STREAM	de;
	
	USERINFO*		pPrvUserInfo;
	USERINFO*		pNextUserInfo;
};


struct USERINFO_LIST
{
	DWORD			dwTick;
	USERINFO*		pUserInfo;
	USERINFO_LIST*	pPrvUserInfoList;
	USERINFO_LIST*	pNextUserInfoList;
};

class CUserTable
{

	DWORD					m_wMaxBucketNum;
	DWORD					m_dwUserNum;
	DWORD					m_dwDisconnectTick;
	DWORD					m_dwSleepProcessTick;

	USERINFO_LIST			*m_pAwaitingDisconnectUserList[SIZE_OF_USER_DISCONNECT_TICK];

	USERINFO**				m_ppInfoTable;
	
	void					RemoveAllUserTable();
	void					AddUserInfo(USERINFO* info);

	DWORD					IncreaseDisconnectTick();

public:								  
	void					RemoveUserID(DWORD id);
	void					RemoveUser(DWORD dwConnectionIndex);
	void					DisconnectUserImmediately( USERINFO *pUserInfo );
	void					DisconnectUserImmediately( DWORD dwConnectionIndex );
	void					SetTickForSleptTimeProcess( USERINFO *pUserInfo );

	bool					DisconnectUserBySuggest( USERINFO* pUserInfo, WORD wRajaCmdNum );
	bool					IsUserAvailable( USERINFO* pUserInfo );
	bool					IsUserAvailable( DWORD dwUserID );
	bool					SendToUser( USERINFO* pUserInfo, char* pMsg, DWORD dwLength );
	bool					SendToUserNoEncode( USERINFO* pUserInfo, char* pMsg, DWORD dwLength );//010910 lsw
	bool					SendToUser( DWORD dwUserID, char* pMsg, DWORD dwLength );
	bool					SendToUserByConnectionIndex( DWORD dwConnectionIndex, char* pMsg, DWORD dwLength );

	DWORD					AddUser(DWORD dwConnectionIndex);
	DWORD					CloseConnectionWithSleepingUsers( void );
	DWORD					RemoveAllUserByMapServerConnectionIndex(DWORD dwMapServerConnectionIndex);
	DWORD					RemoveAllUserByDBDemonConnectionIndex(DWORD dwDBDemonConnectionIndex);
	DWORD					CloseConnectionWithAwaitingToDisconnect();
	DWORD					GetUserNum();
	DWORD					GetBucketNum(){return m_wMaxBucketNum;}

	USERINFO*				GetUserInfo(DWORD id);
	USERINFO*				GetUserInfo(const char* szName);  // 030224 kyo
	USERINFO**				GetUserInfoTable(){return m_ppInfoTable;}
	USERINFO_LIST*			GetUserInfoList( DWORD dwTick );

	CUserTable( WORD wMaxBucketNum );
	~CUserTable();
};

extern CUserTable* g_pUserTable;

#endif
