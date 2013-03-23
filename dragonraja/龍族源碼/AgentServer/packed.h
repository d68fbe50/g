#ifndef PACKED_H
#define PACKED_H

#include "stdafx.h"
#include "define.h"
//#include "protocol.h"


#define MM_MAX_PACKET_SIZE	5120

#pragma pack(push, 1)


class CPackedMsg
{
	BYTE				m_bID;
	DWORD				m_dwMsgLength;
	DWORD				m_dwUserNum;
	char				m_szBody[MM_MAX_PACKET_SIZE];

	DWORD				m_dwConnectionIndex;
	DWORD				m_dwAgentServerIndex;
	bool				m_bFlag;

public:
	void inline		SetMsg(char* msg,DWORD len) 
	{
		if (m_bFlag)
			return;

		m_bFlag = true;
		m_dwMsgLength = len; 
		memcpy(m_szBody,msg,len);
	}
	void inline Release() {m_dwMsgLength = 0;m_dwUserNum = 0;m_bFlag = false;}
	void inline AddUser(DWORD dwUserID)
	{
		*((DWORD*)(m_szBody + m_dwMsgLength) + m_dwUserNum) = dwUserID;
		m_dwUserNum++;
	}
	DWORD	inline	GetPacketSize() {return 1 + 4 + 4 + m_dwMsgLength + m_dwUserNum*4;}
	char*			GetMsg() {return m_szBody;}
	DWORD	inline	GetMsgLength() {return m_dwMsgLength;}
	DWORD	inline 	GetUserNum() {return m_dwUserNum;}
	DWORD	inline 	GetUser(DWORD index) {return *((DWORD*)(m_szBody + m_dwMsgLength) + index);}
	void	inline	SetConnectionIndex(DWORD index) {m_dwConnectionIndex = index;}
	DWORD	inline	GetConnectionIndex() {return m_dwConnectionIndex;}
	void	inline	SetAgentServerIndex(DWORD index) {m_dwAgentServerIndex = index;}
	DWORD	inline	GetAgentServerIndex() {return m_dwAgentServerIndex;}
	
	
	
public:
	CPackedMsg()
	{
		m_bFlag = false;
		m_bID = 1;
		m_dwMsgLength = 0;	
		m_dwUserNum = 0;
		m_dwConnectionIndex = 0;
	}
};

#pragma pack(pop)

#endif
